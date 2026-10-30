import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';
import '../services/match_scorer.dart';

class ConnectEndpoint extends Endpoint {
  /// Create a teammate/partner requirement.
  Future<Requirement> createRequirement(Session session, Requirement req) async {
    return await Requirement.db.insertRow(session, req);
  }

  /// Get candidate matches ranked by MatchScorer score.
  Future<List<Map<String, dynamic>>> getRankedCandidates(
    Session session, {
    required int currentUserId,
    required List<String> requiredSkills,
    required List<String> preferredSkills,
    required List<String> userInterests,
    required String userCollege,
    String? userBranch,
    int? userYear,
  }) async {
    final allProfiles = await UserProfile.db.find(
      session,
      where: (t) => t.userInfoId.notEquals(currentUserId),
    );

    final scoredCandidates = <Map<String, dynamic>>[];

    for (final candidate in allProfiles) {
      final matchResult = MatchScorer.computeScore(
        requiredSkills: requiredSkills,
        preferredSkills: preferredSkills,
        userInterests: userInterests,
        userCollege: userCollege,
        userBranch: userBranch,
        userYear: userYear,
        candidateSkills: candidate.skills,
        candidateInterests: candidate.interests,
        candidateCollege: candidate.collegeName,
        candidateBranch: candidate.branchName,
        candidateYear: candidate.year,
      );

      scoredCandidates.add({
        'profile': candidate,
        'matchPercentage': matchResult.matchPercentage,
        'matchedSkills': matchResult.matchedSkills,
        'isSameCollege': matchResult.isSameCollege,
      });
    }

    // Sort descending by match percentage
    scoredCandidates.sort((a, b) => (b['matchPercentage'] as int).compareTo(a['matchPercentage'] as int));

    return scoredCandidates;
  }

  /// Send a connection request with a note.
  Future<ConnectionRequest> sendRequest(
    Session session, {
    required int senderId,
    required String senderName,
    required int receiverId,
    required String receiverName,
    required String note,
  }) async {
    final existing = await ConnectionRequest.db.findFirstRow(
      session,
      where: (t) => t.senderId.equals(senderId) & t.receiverId.equals(receiverId),
    );

    if (existing != null) {
      return existing;
    }

    final req = ConnectionRequest(
      senderId: senderId,
      senderName: senderName,
      receiverId: receiverId,
      receiverName: receiverName,
      note: note,
      status: 'pending',
      messageCountBeforeAccept: 0,
      createdAt: DateTime.now(),
    );

    final saved = await ConnectionRequest.db.insertRow(session, req);

    // Create or find conversation
    final user1 = senderId < receiverId ? senderId : receiverId;
    final user2 = senderId < receiverId ? receiverId : senderId;

    final conv = await Conversation.db.findFirstRow(
      session,
      where: (t) => t.user1Id.equals(user1) & t.user2Id.equals(user2),
    );

    if (conv == null) {
      await Conversation.db.insertRow(
        session,
        Conversation(
          user1Id: user1,
          user2Id: user2,
          lastMessageSnippet: note,
          lastMessageAt: DateTime.now(),
          user1UnreadCount: 1,
          user2UnreadCount: 0,
          isAccepted: false,
        ),
      );
    }

    return saved;
  }

  /// Accept or reject connection request.
  Future<bool> respondToRequest(
    Session session, {
    required int requestId,
    required int receiverId,
    required bool accept,
  }) async {
    final req = await ConnectionRequest.db.findById(session, requestId);
    if (req == null || req.receiverId != receiverId) return false;

    req.status = accept ? 'accepted' : 'rejected';
    req.updatedAt = DateTime.now();
    await ConnectionRequest.db.updateRow(session, req);

    // Update conversation acceptance status
    final user1 = req.senderId < req.receiverId ? req.senderId : req.receiverId;
    final user2 = req.senderId < req.receiverId ? req.receiverId : req.senderId;

    final conv = await Conversation.db.findFirstRow(
      session,
      where: (t) => t.user1Id.equals(user1) & t.user2Id.equals(user2),
    );

    if (conv != null) {
      conv.isAccepted = accept;
      await Conversation.db.updateRow(session, conv);
    }

    return true;
  }

  /// Send chat message. Strict server-side enforcement: at most 3 messages before acceptance!
  Future<ChatMessage> sendMessage(
    Session session, {
    required int conversationId,
    required int senderId,
    required String senderName,
    required String content,
  }) async {
    final conv = await Conversation.db.findById(session, conversationId);
    if (conv == null) {
      throw Exception('Conversation not found.');
    }

    // Check pre-acceptance message limit on the server
    if (!conv.isAccepted) {
      final preCount = await ChatMessage.db.count(
        session,
        where: (t) => t.conversationId.equals(conversationId) & t.senderId.equals(senderId),
      );

      if (preCount >= 3) {
        throw Exception('Pre-acceptance limit reached: You can send at most 3 messages before the request is accepted.');
      }
    }

    final msg = ChatMessage(
      conversationId: conversationId,
      senderId: senderId,
      senderName: senderName,
      content: content,
      createdAt: DateTime.now(),
      isRead: false,
    );

    final saved = await ChatMessage.db.insertRow(session, msg);

    conv.lastMessageSnippet = content;
    conv.lastMessageAt = DateTime.now();
    await Conversation.db.updateRow(session, conv);

    return saved;
  }

  /// Get message history for conversation.
  Future<List<ChatMessage>> getMessages(Session session, int conversationId) async {
    return await ChatMessage.db.find(
      session,
      where: (t) => t.conversationId.equals(conversationId),
      orderBy: (t) => t.createdAt,
    );
  }
}
