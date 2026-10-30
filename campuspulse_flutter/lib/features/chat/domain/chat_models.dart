enum RequestStatus { pending, accepted, declined }

/// Model for incoming connection / teammate requests received by the student
class ConnectionRequest {
  final String id;
  final String senderName;
  final String senderAvatar;
  final String senderCollege;
  final String senderBranch;
  final int senderYear;
  final String purpose;
  final String introNote;
  final List<String> matchedSkills;
  final int matchPercentage;
  final DateTime timestamp;
  RequestStatus status;

  ConnectionRequest({
    required this.id,
    required this.senderName,
    required this.senderAvatar,
    required this.senderCollege,
    required this.senderBranch,
    required this.senderYear,
    required this.purpose,
    required this.introNote,
    required this.matchedSkills,
    required this.matchPercentage,
    required this.timestamp,
    this.status = RequestStatus.pending,
  });

  ConnectionRequest copyWith({RequestStatus? status}) {
    return ConnectionRequest(
      id: id,
      senderName: senderName,
      senderAvatar: senderAvatar,
      senderCollege: senderCollege,
      senderBranch: senderBranch,
      senderYear: senderYear,
      purpose: purpose,
      introNote: introNote,
      matchedSkills: matchedSkills,
      matchPercentage: matchPercentage,
      timestamp: timestamp,
      status: status ?? this.status,
    );
  }
}

/// Model for individual chat messages in a 1-on-1 conversation
class ChatMessage {
  final String id;
  final String conversationId;
  final String text;
  final DateTime timestamp;
  final bool isMe;
  final bool isRead;

  const ChatMessage({
    required this.id,
    required this.conversationId,
    required this.text,
    required this.timestamp,
    required this.isMe,
    this.isRead = true,
  });
}

/// Model for an active 1-on-1 chat conversation
class ChatConversation {
  final String id;
  final String peerName;
  final String peerAvatar;
  final String peerCollege;
  final String peerBranch;
  final bool isOnline;
  final int matchPercentage;
  final List<ChatMessage> messages;
  final bool isTyping;

  const ChatConversation({
    required this.id,
    required this.peerName,
    required this.peerAvatar,
    required this.peerCollege,
    required this.peerBranch,
    this.isOnline = true,
    this.matchPercentage = 95,
    required this.messages,
    this.isTyping = false,
  });

  String get lastMessageText => messages.isNotEmpty ? messages.last.text : 'Start chatting';
  DateTime get lastMessageTime => messages.isNotEmpty ? messages.last.timestamp : DateTime.now();

  ChatConversation copyWith({
    List<ChatMessage>? messages,
    bool? isTyping,
    bool? isOnline,
  }) {
    return ChatConversation(
      id: id,
      peerName: peerName,
      peerAvatar: peerAvatar,
      peerCollege: peerCollege,
      peerBranch: peerBranch,
      isOnline: isOnline ?? this.isOnline,
      matchPercentage: matchPercentage,
      messages: messages ?? this.messages,
      isTyping: isTyping ?? this.isTyping,
    );
  }
}
