import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

class RentalEndpoint extends Endpoint {
  /// Get available rental listings for the campus.
  Future<List<RentalItem>> getRentalItems(
    Session session, {
    int? collegeId,
    String? category,
  }) async {
    return await RentalItem.db.find(
      session,
      where: (t) {
        var expr = t.isAvailable.equals(true);
        if (collegeId != null) expr = expr & t.collegeId.equals(collegeId);
        if (category != null && category.isNotEmpty) {
          expr = expr & t.category.equals(category);
        }
        return expr;
      },
      orderBy: (t) => t.createdAt.desc(),
    );
  }

  /// Create a new rental listing.
  Future<RentalItem> createListing(Session session, RentalItem item) async {
    return await RentalItem.db.insertRow(session, item);
  }

  /// Request to rent an item. Mandates consent agreement.
  Future<RentalRequest> requestRental(
    Session session, {
    required int itemId,
    required int renterId,
    required String renterName,
    required int ownerId,
    required bool consentAgreed,
    required DateTime startDate,
    required DateTime returnDueDate,
    required double totalRentAmount,
    required double depositHeld,
  }) async {
    if (!consentAgreed) {
      throw Exception('Consent agreement is mandatory: You must agree to be fully responsible for any damage or loss.');
    }

    final req = RentalRequest(
      itemId: itemId,
      renterId: renterId,
      renterName: renterName,
      ownerId: ownerId,
      status: 'pending_approval',
      consentAgreed: consentAgreed,
      startDate: startDate,
      returnDueDate: returnDueDate,
      totalRentAmount: totalRentAmount,
      depositHeld: depositHeld,
      createdAt: DateTime.now(),
    );

    return await RentalRequest.db.insertRow(session, req);
  }

  /// Owner approves or rejects rental request.
  Future<bool> respondRentalRequest(
    Session session, {
    required int requestId,
    required int ownerId,
    required bool approve,
  }) async {
    final req = await RentalRequest.db.findById(session, requestId);
    if (req == null || req.ownerId != ownerId) return false;

    req.status = approve ? 'active' : 'rejected';
    await RentalRequest.db.updateRow(session, req);

    if (approve) {
      final item = await RentalItem.db.findById(session, req.itemId);
      if (item != null) {
        item.isAvailable = false;
        await RentalItem.db.updateRow(session, item);
      }
    }

    return true;
  }

  /// Complete return of item.
  Future<bool> completeReturn(
    Session session, {
    required int requestId,
    required String returnPhotosJson,
  }) async {
    final req = await RentalRequest.db.findById(session, requestId);
    if (req == null) return false;

    req.returnPhotosJson = returnPhotosJson;
    req.status = 'returned';
    await RentalRequest.db.updateRow(session, req);

    final item = await RentalItem.db.findById(session, req.itemId);
    if (item != null) {
      item.isAvailable = true;
      await RentalItem.db.updateRow(session, item);
    }

    return true;
  }
}
