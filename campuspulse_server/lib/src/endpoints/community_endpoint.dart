import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

class CommunityEndpoint extends Endpoint {
  /// Discover communities with optional search and category filters.
  Future<List<Community>> getCommunities(
    Session session, {
    String? search,
    String? category,
  }) async {
    return await Community.db.find(
      session,
      where: (t) {
        var expr = t.id.notEquals(0);
        if (category != null && category.isNotEmpty) {
          expr = expr & t.category.equals(category);
        }
        if (search != null && search.isNotEmpty) {
          expr = expr & t.name.ilike('%$search%');
        }
        return expr;
      },
      orderBy: (t) => t.memberCount.desc(),
    );
  }

  /// Create a community. Creator becomes admin member.
  Future<Community> createCommunity(Session session, Community community) async {
    final created = await Community.db.insertRow(session, community);

    await CommunityMember.db.insertRow(
      session,
      CommunityMember(
        communityId: created.id!,
        userId: community.creatorUserId,
        userName: 'Admin',
        role: 'admin',
        joinedAt: DateTime.now(),
        isApproved: true,
      ),
    );

    return created;
  }

  /// Join or leave community.
  Future<bool> toggleJoinCommunity(
    Session session, {
    required int communityId,
    required int userId,
    required String userName,
  }) async {
    final comm = await Community.db.findById(session, communityId);
    if (comm == null) return false;

    final existing = await CommunityMember.db.findFirstRow(
      session,
      where: (t) => t.communityId.equals(communityId) & t.userId.equals(userId),
    );

    if (existing != null) {
      await CommunityMember.db.deleteRow(session, existing);
      comm.memberCount = (comm.memberCount - 1).clamp(0, 999999);
      await Community.db.updateRow(session, comm);
      return false; // Left
    } else {
      await CommunityMember.db.insertRow(
        session,
        CommunityMember(
          communityId: communityId,
          userId: userId,
          userName: userName,
          role: 'member',
          joinedAt: DateTime.now(),
          isApproved: !comm.isPrivate,
        ),
      );
      comm.memberCount += 1;
      await Community.db.updateRow(session, comm);
      return true; // Joined
    }
  }

  /// Get feed of posts in community.
  Future<List<CommunityPost>> getCommunityPosts(
    Session session,
    int communityId,
  ) async {
    return await CommunityPost.db.find(
      session,
      where: (t) => t.communityId.equals(communityId),
      orderBy: (t) => t.createdAt.desc(),
    );
  }

  /// Create a post in a community.
  Future<CommunityPost> createPost(Session session, CommunityPost post) async {
    return await CommunityPost.db.insertRow(session, post);
  }
}
