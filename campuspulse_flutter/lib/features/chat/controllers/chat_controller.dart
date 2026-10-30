import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/chat_models.dart';

class ChatState {
  final List<ConnectionRequest> requests;
  final List<ChatConversation> conversations;
  final String requestSearchQuery;
  final String chatSearchQuery;

  const ChatState({
    required this.requests,
    required this.conversations,
    this.requestSearchQuery = '',
    this.chatSearchQuery = '',
  });

  int get pendingRequestCount =>
      requests.where((r) => r.status == RequestStatus.pending).length;

  List<ConnectionRequest> get filteredRequests {
    if (requestSearchQuery.trim().isEmpty) return requests;
    final q = requestSearchQuery.trim().toLowerCase();
    return requests.where((r) {
      return r.senderName.toLowerCase().contains(q) ||
          r.senderCollege.toLowerCase().contains(q) ||
          r.senderBranch.toLowerCase().contains(q) ||
          r.purpose.toLowerCase().contains(q) ||
          r.matchedSkills.any((s) => s.toLowerCase().contains(q));
    }).toList();
  }

  List<ChatConversation> get filteredConversations {
    if (chatSearchQuery.trim().isEmpty) return conversations;
    final q = chatSearchQuery.trim().toLowerCase();
    return conversations.where((c) {
      return c.peerName.toLowerCase().contains(q) ||
          c.peerCollege.toLowerCase().contains(q) ||
          c.peerBranch.toLowerCase().contains(q) ||
          c.lastMessageText.toLowerCase().contains(q);
    }).toList();
  }

  ChatState copyWith({
    List<ConnectionRequest>? requests,
    List<ChatConversation>? conversations,
    String? requestSearchQuery,
    String? chatSearchQuery,
  }) {
    return ChatState(
      requests: requests ?? this.requests,
      conversations: conversations ?? this.conversations,
      requestSearchQuery: requestSearchQuery ?? this.requestSearchQuery,
      chatSearchQuery: chatSearchQuery ?? this.chatSearchQuery,
    );
  }
}

class ChatController extends StateNotifier<ChatState> {
  ChatController()
      : super(
          ChatState(
            requests: [
              ConnectionRequest(
                id: 'req_1',
                senderName: 'Sahab Raza',
                senderAvatar: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=300',
                senderCollege: 'Netaji Subhas University of Technology (NSUT)',
                senderBranch: 'Information Technology',
                senderYear: 2,
                purpose: 'HackPulse 2026 Hackathon',
                introNote: 'Hey! Loved your Flutter project. We need a strong frontend & Riverpod builder for our 36-hr HackPulse team. Let\'s build something legendary together!',
                matchedSkills: ['Flutter', 'Dart', 'PostgreSQL', 'Docker'],
                matchPercentage: 96,
                timestamp: DateTime.now().subtract(const Duration(minutes: 24)),
              ),
              ConnectionRequest(
                id: 'req_2',
                senderName: 'Priya Patel',
                senderAvatar: 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=300',
                senderCollege: 'Delhi Technological University (DTU)',
                senderBranch: 'Electronics & Communication',
                senderYear: 4,
                purpose: 'Robotics Autonomous Rover Team',
                introNote: 'Invictus Techfest robotics team needs someone to design our ROS telemetry mobile dashboard. Saw your profile and thought you\'d be a great fit!',
                matchedSkills: ['Python', 'Embedded C', 'Flutter', 'ROS'],
                matchPercentage: 92,
                timestamp: DateTime.now().subtract(const Duration(hours: 2, minutes: 10)),
              ),
              ConnectionRequest(
                id: 'req_3',
                senderName: 'Rohan Das',
                senderAvatar: 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=300',
                senderCollege: 'IIT Delhi',
                senderBranch: 'Computer Science & Engineering',
                senderYear: 3,
                purpose: 'DBMS & OS Midsem Study Circle',
                introNote: 'Hey, forming a peer study group for DBMS B-Tree indexing and OS Concurrency past-year question solving. Let\'s crack top grades!',
                matchedSkills: ['DBMS', 'SQL', 'Operating Systems', 'Algorithms'],
                matchPercentage: 88,
                timestamp: DateTime.now().subtract(const Duration(hours: 5)),
              ),
              ConnectionRequest(
                id: 'req_4',
                senderName: 'Ananya Gupta',
                senderAvatar: 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=300',
                senderCollege: 'IIT Delhi',
                senderBranch: 'Design & CSE',
                senderYear: 3,
                purpose: 'Campus UI/UX Design Sprint',
                introNote: 'Working on a new student design system in Figma. Would love to collaborate on the component library.',
                matchedSkills: ['Figma', 'UI/UX', 'Design Systems', 'Flutter'],
                matchPercentage: 85,
                timestamp: DateTime.now().subtract(const Duration(days: 1)),
              ),
            ],
            conversations: [
              ChatConversation(
                id: 'conv_sahab',
                peerName: 'Sahab Raza',
                peerAvatar: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=300',
                peerCollege: 'NSUT • Information Tech',
                peerBranch: '2nd Year',
                isOnline: true,
                matchPercentage: 96,
                messages: [
                  ChatMessage(
                    id: 'm1',
                    conversationId: 'conv_sahab',
                    text: 'Hey Aarav! Did you register for HackPulse 2026 yet?',
                    timestamp: DateTime.now().subtract(const Duration(minutes: 45)),
                    isMe: false,
                  ),
                  ChatMessage(
                    id: 'm2',
                    conversationId: 'conv_sahab',
                    text: 'Yes, just submitted our team track for Campus Life OS!',
                    timestamp: DateTime.now().subtract(const Duration(minutes: 38)),
                    isMe: true,
                  ),
                  ChatMessage(
                    id: 'm3',
                    conversationId: 'conv_sahab',
                    text: 'Awesome! Let\'s meet at LHC central foyer after 2 PM to sync on APIs.',
                    timestamp: DateTime.now().subtract(const Duration(minutes: 15)),
                    isMe: false,
                  ),
                ],
              ),
              ChatConversation(
                id: 'conv_priya',
                peerName: 'Priya Patel',
                peerAvatar: 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=300',
                peerCollege: 'DTU • ECE',
                peerBranch: '4th Year (Club Admin)',
                isOnline: false,
                matchPercentage: 92,
                messages: [
                  ChatMessage(
                    id: 'p1',
                    conversationId: 'conv_priya',
                    text: 'Hi Aarav! Shared the robotics sensor datasheet with you.',
                    timestamp: DateTime.now().subtract(const Duration(hours: 3)),
                    isMe: false,
                  ),
                ],
              ),
            ],
          ),
        );

  void setRequestSearchQuery(String query) {
    state = state.copyWith(requestSearchQuery: query);
  }

  void setChatSearchQuery(String query) {
    state = state.copyWith(chatSearchQuery: query);
  }

  /// Accept an incoming connection request and unlock chat
  ChatConversation acceptRequest(String requestId) {
    final updatedRequests = state.requests.map((r) {
      if (r.id == requestId) {
        return r.copyWith(status: RequestStatus.accepted);
      }
      return r;
    }).toList();

    final req = state.requests.firstWhere((r) => r.id == requestId);

    // Check if conversation already exists or create new one
    final existingConvIndex = state.conversations.indexWhere(
      (c) => c.peerName.toLowerCase() == req.senderName.toLowerCase(),
    );

    ChatConversation activeConv;
    List<ChatConversation> updatedConversations = [...state.conversations];

    if (existingConvIndex >= 0) {
      activeConv = state.conversations[existingConvIndex];
    } else {
      activeConv = ChatConversation(
        id: 'conv_${req.id}',
        peerName: req.senderName,
        peerAvatar: req.senderAvatar,
        peerCollege: req.senderCollege,
        peerBranch: '${req.senderBranch} (Year ${req.senderYear})',
        isOnline: true,
        matchPercentage: req.matchPercentage,
        messages: [
          ChatMessage(
            id: 'init_${req.id}',
            conversationId: 'conv_${req.id}',
            text: req.introNote,
            timestamp: req.timestamp,
            isMe: false,
          ),
          ChatMessage(
            id: 'reply_${req.id}',
            conversationId: 'conv_${req.id}',
            text: 'Connection accepted! Excited to collaborate on ${req.purpose}.',
            timestamp: DateTime.now(),
            isMe: true,
          ),
        ],
      );
      updatedConversations.insert(0, activeConv);
    }

    state = state.copyWith(
      requests: updatedRequests,
      conversations: updatedConversations,
    );

    return activeConv;
  }

  /// Decline a request
  void declineRequest(String requestId) {
    final updatedRequests = state.requests.map((r) {
      if (r.id == requestId) {
        return r.copyWith(status: RequestStatus.declined);
      }
      return r;
    }).toList();

    state = state.copyWith(requests: updatedRequests);
  }

  /// Add a newly initiated conversation when student sends a connection request
  ChatConversation addSentRequestOrConversation({
    required String peerName,
    required String peerAvatar,
    required String peerCollege,
    required String peerBranch,
    required int matchPercentage,
    required String initialMessage,
  }) {
    final existingIndex = state.conversations.indexWhere(
      (c) => c.peerName.toLowerCase() == peerName.toLowerCase(),
    );

    if (existingIndex >= 0) {
      return state.conversations[existingIndex];
    }

    final newConv = ChatConversation(
      id: 'conv_${DateTime.now().millisecondsSinceEpoch}',
      peerName: peerName,
      peerAvatar: peerAvatar,
      peerCollege: peerCollege,
      peerBranch: peerBranch,
      matchPercentage: matchPercentage,
      messages: [
        ChatMessage(
          id: 'sent_${DateTime.now().millisecondsSinceEpoch}',
          conversationId: 'conv_${DateTime.now().millisecondsSinceEpoch}',
          text: initialMessage.isNotEmpty ? initialMessage : 'Hey! Would love to connect and team up on Kampuzz.',
          timestamp: DateTime.now(),
          isMe: true,
        ),
      ],
    );

    state = state.copyWith(conversations: [newConv, ...state.conversations]);
    return newConv;
  }

  /// Send a real-time message and simulate interactive instant peer response
  Future<void> sendMessage(String conversationId, String text) async {
    final trimmed = text.trim();
    if (trimmed.isEmpty) return;

    final convIndex = state.conversations.indexWhere((c) => c.id == conversationId);
    if (convIndex < 0) return;

    final currentConv = state.conversations[convIndex];
    final userMessage = ChatMessage(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      conversationId: conversationId,
      text: trimmed,
      timestamp: DateTime.now(),
      isMe: true,
    );

    // 1. Immediately post user message and show typing status
    final convWithUserMsg = currentConv.copyWith(
      messages: [...currentConv.messages, userMessage],
      isTyping: true,
    );

    final updatedList1 = [...state.conversations];
    updatedList1[convIndex] = convWithUserMsg;
    state = state.copyWith(conversations: updatedList1);

    // 2. Realistic interactive peer reply delay
    await Future.delayed(const Duration(milliseconds: 650));

    // Dynamic contextual reply logic based on peer and query
    final peerReplyText = _generatePeerReply(currentConv.peerName, trimmed);

    final replyMessage = ChatMessage(
      id: (DateTime.now().millisecondsSinceEpoch + 1).toString(),
      conversationId: conversationId,
      text: peerReplyText,
      timestamp: DateTime.now(),
      isMe: false,
    );

    final convWithReply = convWithUserMsg.copyWith(
      messages: [...convWithUserMsg.messages, replyMessage],
      isTyping: false,
    );

    final updatedList2 = [...state.conversations];
    updatedList2[convIndex] = convWithReply;
    state = state.copyWith(conversations: updatedList2);
  }

  String _generatePeerReply(String peerName, String query) {
    final q = query.toLowerCase();
    if (q.contains('meet') || q.contains('where') || q.contains('time') || q.contains('lhc')) {
      return 'Sounds perfect! Let\'s catch up at the LHC Central Foyer stairs right after lectures. See you there!';
    }
    if (q.contains('git') || q.contains('code') || q.contains('repo') || q.contains('pr')) {
      return 'Awesome, got the link! Reviewing your commits right now. The code structure looks super clean.';
    }
    if (q.contains('hack') || q.contains('sih') || q.contains('hackpulse') || q.contains('project')) {
      return 'Great! I\'ve finalized our presentation slides and API schema. We are definitely in the running for the podium!';
    }
    if (q.contains('notes') || q.contains('dbms') || q.contains('exam') || q.contains('study')) {
      return 'Yes! Let\'s go through the 2024 and 2025 PYQs together. It\'ll save so much time for midsems.';
    }
    if (q.contains('call') || q.contains('free') || q.contains('talk')) {
      return 'Free in 10 minutes right after my lab wraps up! Will drop a ping here.';
    }

    return 'Sounds like a great plan! Let\'s execute this. Will ping you with the next update shortly.';
  }
}

final chatControllerProvider = StateNotifierProvider<ChatController, ChatState>((ref) {
  return ChatController();
});
