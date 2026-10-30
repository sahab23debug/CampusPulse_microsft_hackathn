import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

class ResourceEndpoint extends Endpoint {
  /// Fetches notes and resources with filters and sorting.
  Future<List<Resource>> getResources(
    Session session, {
    int? branchId,
    int? year,
    int? semester,
    int? subjectId,
    String? resourceType,
    String? sortBy, // 'rating', 'newest', 'most_used'
    int page = 0,
    int limit = 20,
  }) async {
    return await Resource.db.find(
      session,
      where: (t) {
        var expr = t.id.notEquals(0);
        if (branchId != null) expr = expr & t.branchId.equals(branchId);
        if (year != null) expr = expr & t.year.equals(year);
        if (semester != null) expr = expr & t.semester.equals(semester);
        if (subjectId != null) expr = expr & t.subjectId.equals(subjectId);
        if (resourceType != null && resourceType.isNotEmpty) {
          expr = expr & t.resourceType.equals(resourceType);
        }
        return expr;
      },
      orderBy: (t) {
        if (sortBy == 'rating') return t.averageRating.desc();
        if (sortBy == 'most_used') return t.followCount.desc();
        return t.createdAt.desc();
      },
      limit: limit,
      offset: page * limit,
    );
  }

  /// Get single resource by ID and increment views.
  Future<Resource?> getResourceById(Session session, int id) async {
    final res = await Resource.db.findById(session, id);
    if (res != null) {
      res.viewsCount += 1;
      await Resource.db.updateRow(session, res);
    }
    return res;
  }

  /// Upload a new resource.
  Future<Resource> uploadResource(Session session, Resource resource) async {
    return await Resource.db.insertRow(session, resource);
  }

  /// Rate a resource (1-5 stars). Uploader cannot rate own upload. Only 1 rating per user.
  Future<ResourceRating?> rateResource(
    Session session, {
    required int resourceId,
    required int userId,
    required String userName,
    required int rating,
    String? review,
  }) async {
    final resource = await Resource.db.findById(session, resourceId);
    if (resource == null) return null;
    if (resource.uploaderId == userId) {
      throw Exception('Uploaders cannot rate their own uploads.');
    }

    final existing = await ResourceRating.db.findFirstRow(
      session,
      where: (t) => t.resourceId.equals(resourceId) & t.userId.equals(userId),
    );

    ResourceRating savedRating;
    if (existing != null) {
      existing.rating = rating;
      existing.review = review;
      savedRating = await ResourceRating.db.updateRow(session, existing);
    } else {
      savedRating = await ResourceRating.db.insertRow(
        session,
        ResourceRating(
          resourceId: resourceId,
          userId: userId,
          userName: userName,
          rating: rating,
          review: review,
          createdAt: DateTime.now(),
        ),
      );
    }

    // Recalculate average rating
    final allRatings = await ResourceRating.db.find(
      session,
      where: (t) => t.resourceId.equals(resourceId),
    );
    if (allRatings.isNotEmpty) {
      final total = allRatings.fold<int>(0, (sum, r) => sum + r.rating);
      resource.ratingCount = allRatings.length;
      resource.averageRating = double.parse((total / allRatings.length).toStringAsFixed(1));
      await Resource.db.updateRow(session, resource);
    }

    return savedRating;
  }

  /// Add comment to a resource.
  Future<ResourceComment> addComment(
    Session session, {
    required int resourceId,
    required int userId,
    required String userName,
    String? userAvatarUrl,
    required String content,
  }) async {
    final comment = ResourceComment(
      resourceId: resourceId,
      userId: userId,
      userName: userName,
      userAvatarUrl: userAvatarUrl,
      content: content,
      createdAt: DateTime.now(),
      isReported: false,
    );
    return await ResourceComment.db.insertRow(session, comment);
  }

  /// Delete own comment.
  Future<bool> deleteComment(Session session, int commentId, int userId) async {
    final comment = await ResourceComment.db.findById(session, commentId);
    if (comment != null && comment.userId == userId) {
      await ResourceComment.db.deleteRow(session, comment);
      return true;
    }
    return false;
  }

  /// Toggle follow / 'I followed this' counter.
  Future<bool> toggleFollow(Session session, int resourceId, int userId) async {
    final resource = await Resource.db.findById(session, resourceId);
    if (resource == null) return false;

    final existing = await ResourceFollow.db.findFirstRow(
      session,
      where: (t) => t.resourceId.equals(resourceId) & t.userId.equals(userId),
    );

    if (existing != null) {
      await ResourceFollow.db.deleteRow(session, existing);
      resource.followCount = (resource.followCount - 1).clamp(0, 999999);
      await Resource.db.updateRow(session, resource);
      return false; // un-followed
    } else {
      await ResourceFollow.db.insertRow(
        session,
        ResourceFollow(
          resourceId: resourceId,
          userId: userId,
          createdAt: DateTime.now(),
        ),
      );
      resource.followCount += 1;
      await Resource.db.updateRow(session, resource);
      return true; // followed
    }
  }

  /// Bookmark / save resource.
  Future<bool> toggleBookmark(
    Session session, {
    required int userId,
    required String resourceType,
    required int targetId,
    required String title,
    String? subtitle,
  }) async {
    final existing = await Bookmark.db.findFirstRow(
      session,
      where: (t) =>
          t.userId.equals(userId) &
          t.resourceType.equals(resourceType) &
          t.targetId.equals(targetId),
    );

    if (existing != null) {
      await Bookmark.db.deleteRow(session, existing);
      return false;
    } else {
      await Bookmark.db.insertRow(
        session,
        Bookmark(
          userId: userId,
          resourceType: resourceType,
          targetId: targetId,
          title: title,
          subtitle: subtitle,
          createdAt: DateTime.now(),
        ),
      );
      return true;
    }
  }

  /// Abuse reporting for resources and comments.
  Future<bool> reportAbuse(
    Session session, {
    required int reporterUserId,
    required String reporterUserName,
    required String targetType,
    required int targetId,
    required String reason,
  }) async {
    await AbuseReport.db.insertRow(
      session,
      AbuseReport(
        reporterUserId: reporterUserId,
        reporterUserName: reporterUserName,
        targetType: targetType,
        targetId: targetId,
        reason: reason,
        status: 'pending',
        createdAt: DateTime.now(),
      ),
    );
    return true;
  }
}
