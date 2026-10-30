import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/sam_engine.dart';
import '../../auth/controllers/auth_controller.dart';

class SamState {
  final List<SamMessage> messages;
  final bool isTyping;
  final List<String> quickSuggestions;

  const SamState({
    required this.messages,
    this.isTyping = false,
    this.quickSuggestions = const [
      '📸 Solve Question from Photo',
      '📍 Scan with Geo-Cam',
      '💻 Coding & DSA Blueprint',
      '📄 Build an ATS-Friendly CV',
      '🎓 Top Industry Certifications',
      '📚 Semester Study & Exam Plan',
      '📅 Next class & room',
      '⚠️ Can I bunk DBMS today?',
      '🗓️ Today\'s full timetable',
      '📚 Top DBMS handwritten notes',
      '🏆 Upcoming hackathons & fests',
      '🤝 How to find teammates for SIH?',
      '📊 Check overall attendance',
      '💡 Exam survival tips',
      '😄 Tell me a joke',
    ],
  });

  SamState copyWith({
    List<SamMessage>? messages,
    bool? isTyping,
    List<String>? quickSuggestions,
  }) {
    return SamState(
      messages: messages ?? this.messages,
      isTyping: isTyping ?? this.isTyping,
      quickSuggestions: quickSuggestions ?? this.quickSuggestions,
    );
  }
}

class SamController extends StateNotifier<SamState> {
  final Ref _ref;

  SamController(this._ref) : super(const SamState(messages: [])) {
    _initGreeting();
  }

  void _initGreeting() {
    final user = _ref.read(authControllerProvider).currentUser;
    final firstName = user?.fullName.split(' ').first ?? 'Friend';

    final greeting = SamMessage(
      id: 'greeting',
      isUser: false,
      timestamp: DateTime.now(),
      text: 'Hey $firstName! 👋 I\'m **Sam**, your 24/7 AI Campus Copilot on **Kampuzz**.\n\n'
          'I\'m here to help you solve questions from photos (via live Geo-Cam), ace your studies, master coding & DSA, build winning ATS resumes, suggest top industry certifications, track safe bunks, and find hackathon teammates!\n\n'
          'Ask me anything or tap the 📷 camera/media icon below to scan an exam question!',
      actions: const [
        SamAction(label: 'Scan Question (Geo-Cam)', icon: Icons.camera_alt_rounded, route: '/camera'),
        SamAction(label: 'Coding & DSA Help', icon: Icons.code_rounded, route: '/arena'),
        SamAction(label: 'Study Hub Notes', icon: Icons.menu_book_rounded, route: '/study'),
        SamAction(label: 'Safe Bunks', icon: Icons.calculate_rounded, route: '/bunk-meter'),
      ],
    );

    state = state.copyWith(messages: [greeting]);
  }

  Future<void> sendMessage(
    String text, {
    String? mediaUrl,
    String? mediaCaption,
    String? geoLandmark,
  }) async {
    final trimmed = text.trim();
    if (trimmed.isEmpty && mediaUrl == null) return;

    final user = _ref.read(authControllerProvider).currentUser;
    final userMsgText = trimmed.isEmpty ? 'Can you analyze and solve the question in this photo step-by-step?' : trimmed;

    final userMsg = SamMessage(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      text: userMsgText,
      isUser: true,
      timestamp: DateTime.now(),
      mediaUrl: mediaUrl,
      mediaCaption: mediaCaption,
      geoLandmark: geoLandmark,
    );

    state = state.copyWith(
      messages: [...state.messages, userMsg],
      isTyping: true,
    );

    // Realistic brief AI thinking delay (350ms)
    await Future.delayed(const Duration(milliseconds: 350));

    final aiReply = SamEngine.processQuery(
      userMsgText,
      user,
      mediaUrl: mediaUrl,
      geoLandmark: geoLandmark,
    );

    state = state.copyWith(
      messages: [...state.messages, aiReply],
      isTyping: false,
    );
  }

  void clearChat() {
    _initGreeting();
  }
}

final samControllerProvider = StateNotifierProvider<SamController, SamState>((ref) {
  return SamController(ref);
});
