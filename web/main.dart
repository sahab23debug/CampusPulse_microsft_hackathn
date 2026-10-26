import 'dart:html';

// ==========================================
// DATA MODELS (DART)
// ==========================================

class StudentProfile {
  String id;
  String name;
  String avatar;
  String major;
  String department;
  String year;
  String semester;
  String bio;
  List<String> courses;
  List<String> interests;
  String lookingFor;
  String studyStyle;
  String preferredLocation;
  String availability;
  int compatScore;
  List<String> matchReasons;
  bool isOnline;
  bool isVerified;

  StudentProfile({
    required this.id,
    required this.name,
    required this.avatar,
    required this.major,
    required this.department,
    required this.year,
    required this.semester,
    required this.bio,
    required this.courses,
    required this.interests,
    required this.lookingFor,
    required this.studyStyle,
    required this.preferredLocation,
    required this.availability,
    this.compatScore = 85,
    this.matchReasons = const [],
    this.isOnline = true,
    this.isVerified = true,
  });
}

class CampusEvent {
  String id;
  String title;
  String organizer;
  String organizerRole;
  String category;
  String dateStr;
  String location;
  String? room;
  String description;
  String imageUrl;
  int attendeesCount;
  int? maxCapacity;
  bool isRsvpd;
  bool isFeatured;
  bool isOfficial;
  List<String> tags;

  CampusEvent({
    required this.id,
    required this.title,
    required this.organizer,
    required this.organizerRole,
    required this.category,
    required this.dateStr,
    required this.location,
    this.room,
    required this.description,
    required this.imageUrl,
    required this.attendeesCount,
    this.maxCapacity,
    this.isRsvpd = false,
    this.isFeatured = false,
    this.isOfficial = false,
    this.tags = const [],
  });
}

class Connection {
  String id;
  StudentProfile student;
  String status;
  String lastMessage;
  String lastMessageTime;
  int unreadCount;

  Connection({
    required this.id,
    required this.student,
    this.status = 'connected',
    this.lastMessage = '',
    this.lastMessageTime = 'Just now',
    this.unreadCount = 0,
  });
}

class ChatMessage {
  String id;
  String senderId;
  String senderName;
  String text;
  String timestamp;
  bool isStudyInvite;
  String? inviteCourse;
  String? inviteLocation;
  String? inviteTime;

  ChatMessage({
    required this.id,
    required this.senderId,
    required this.senderName,
    required this.text,
    required this.timestamp,
    this.isStudyInvite = false,
    this.inviteCourse,
    this.inviteLocation,
    this.inviteTime,
  });
}

// ==========================================
// APPLICATION STATE (DART)
// ==========================================

class AppState {
  // Auth state
  bool isLoggedIn = false;
  String userRole = 'student'; // 'student' | 'teacher' | 'club_head' | 'admin'
  String loginEmail = 'alex.chen@campus.edu';
  String loginPassword = 'Password2026!';
  String loginRoleSelection = 'student'; // 'student' | 'faculty_club' | 'admin'
  String facultyClubSubRole = 'teacher'; // 'teacher' | 'club_head'
  String loginError = '';
  bool showPassword = false;
  bool rememberMe = true;
  bool isForgotPasswordOpen = false;
  String forgotPasswordRole = 'student';
  String forgotPasswordEmail = '';
  bool forgotPasswordSent = false;

  // App navigation
  String activeSection = 'discover'; // 'discover' | 'events' | 'chats' | 'schedule' | 'admin'
  String searchQuery = '';
  String selectedCategory = 'All';
  String selectedEventCategory = 'All';
  String eventSearchQuery = '';
  int cardIndex = 0;
  String activeChatStudentId = 'usr_maya';
  bool isProfileOpen = false;
  bool isCreateEventOpen = false;
  StudentProfile? connectModalStudent;
  String connectNote = '';
  bool isInviteModalOpen = false;

  late StudentProfile currentUser; // Normal student: Alex Chen
  late StudentProfile teacherUser; // Faculty Teacher: Prof. Sarah Martinez
  late StudentProfile clubHeadUser; // Student Club Head: Jordan Lee
  late StudentProfile adminUser; // Campus Admin: Dean Marcus Holloway
  late List<StudentProfile> students;
  late List<CampusEvent> events;
  late List<Connection> connections;
  Map<String, List<ChatMessage>> chatMessages = {};

  bool get canPostEvents => userRole == 'teacher' || userRole == 'club_head' || userRole == 'admin';
  bool get isStudent => userRole == 'student';
  bool get isTeacher => userRole == 'teacher';
  bool get isClubHead => userRole == 'club_head';
  bool get isAdmin => userRole == 'admin';

  StudentProfile get activeUser {
    if (userRole == 'teacher') return teacherUser;
    if (userRole == 'club_head') return clubHeadUser;
    if (userRole == 'admin') return adminUser;
    return currentUser;
  }

  AppState() {
    currentUser = StudentProfile(
      id: 'usr_me',
      name: 'Alex Chen',
      avatar: 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=crop&w=256&h=256&q=80',
      major: 'Computer Science & Data Science',
      department: 'EECS Department',
      year: 'Junior (3rd Year)',
      semester: 'Fall 2026',
      bio: 'Passionate about distributed systems and ML infra. Looking for study partners for CS 189 and teammates for CalHacks next month!',
      courses: ['CS 189: Intro to Machine Learning', 'CS 162: Operating Systems', 'DATA 100: Principles of Data Science', 'MATH 53: Multivariable Calculus'],
      interests: ['Distributed Systems', 'ML Infrastructure', 'Hackathons', 'Kaggle', 'Bouldering'],
      lookingFor: 'Study Buddy',
      studyStyle: 'Deep Focus · 50/10 Pomodoro',
      preferredLocation: 'Moffitt Library 4th Floor',
      availability: 'Weekdays after 3:30 PM & Sundays',
    );

    teacherUser = StudentProfile(
      id: 'usr_teacher_martinez',
      name: 'Prof. Sarah Martinez',
      avatar: 'https://images.unsplash.com/photo-1573496359142-b8d87734a5a2?auto=format&fit=crop&w=256&h=256&q=80',
      major: 'EECS Faculty & Senior Research Lead',
      department: 'Department of Electrical Engineering & Computer Sciences',
      year: 'Faculty Professor',
      semester: 'Fall 2026',
      bio: 'Associate Professor of Computer Science. Teaching CS 189 Machine Learning and CS 162. Research lead for Berkeley AI Research (BAIR). Hosting exam review jams & lab clinics.',
      courses: ['CS 189: Intro to Machine Learning', 'CS 162: Operating Systems', 'EECS 126: Probability'],
      interests: ['Machine Learning', 'AI Safety', 'Curriculum Innovation', 'Mentorship'],
      lookingFor: 'Academic Mentorship',
      studyStyle: 'Faculty Office Hours & Problem Clinics',
      preferredLocation: 'Soda Hall - Faculty Suite 524',
      availability: 'Tuesdays & Thursdays 2:00 PM - 5:00 PM',
    );

    clubHeadUser = StudentProfile(
      id: 'usr_club_jordan',
      name: 'Jordan Lee',
      avatar: 'https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?auto=format&fit=crop&w=256&h=256&q=80',
      major: 'Computer Science & Cognitive Science',
      department: 'President, Mobile Developers Org & Campus Tech Guild',
      year: 'Senior (Club President)',
      semester: 'Fall 2026',
      bio: 'President of Mobile Developers Org and Lead Director for CalHacks 12.0. Organizing weekly code sprints, mobile app jams, and tech company sponsor workshops.',
      courses: ['CS 169A: Software Engineering', 'CS 160: User Interface Design', 'DATA 100: Principles of Data Science'],
      interests: ['Mobile Development', 'Flutter & Dart', 'Hackathons', 'Tech Community'],
      lookingFor: 'Hackathon Team',
      studyStyle: 'Pair Programming & Sprint Sprints',
      preferredLocation: 'Jacobs Hall Makerspace Studio 1',
      availability: 'Wednesday evenings & weekends',
    );

    adminUser = StudentProfile(
      id: 'usr_admin',
      name: 'Dean Marcus Holloway',
      avatar: 'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?auto=format&fit=crop&w=256&h=256&q=80',
      major: 'Campus Life Administration',
      department: 'Office of Student Affairs & Academic Success',
      year: 'Administrator',
      semester: 'Fall 2026',
      bio: 'Administrator overseeing campus life programs, university study guild reservations, and verified academic bulletins.',
      courses: ['Campus Community Oversight', 'Student Guild Policy'],
      interests: ['Academic Mentorship', 'Student Well-being'],
      lookingFor: 'Project Collaborator',
      studyStyle: 'Office Hours & Advisory',
      preferredLocation: 'Sproul Hall - Dean Suite 300',
      availability: 'Mon - Fri 9:00 AM - 5:00 PM',
    );

    students = [
      StudentProfile(
        id: 'usr_maya',
        name: 'Maya Patel',
        avatar: 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?auto=format&fit=crop&w=256&h=256&q=80',
        major: 'Computer Science',
        department: 'EECS Department',
        year: 'Junior (3rd Year)',
        semester: 'Fall 2026',
        bio: 'Obsessed with deep learning architectures and NLP. Currently grinding CS 189 homework sets. Love whiteboard problem-solving!',
        courses: ['CS 189: Intro to Machine Learning', 'CS 162: Operating Systems', 'EECS 126: Probability'],
        interests: ['ML Infrastructure', 'NLP', 'Hackathons', 'Espresso'],
        lookingFor: 'Study Buddy',
        studyStyle: 'Whiteboard & Discussion · Active Recall',
        preferredLocation: 'Main Stacks Level C & Bechtel Center',
        availability: 'Mon/Wed/Fri 2:00 PM - 7:00 PM',
        compatScore: 96,
        matchReasons: ['Both enrolled in CS 189 & CS 162', 'Shared interests in ML Infrastructure', 'Similar afternoon study schedule'],
        isOnline: true,
      ),
      StudentProfile(
        id: 'usr_david',
        name: 'David Kim',
        avatar: 'https://images.unsplash.com/photo-1522075469751-3a6694fb2f61?auto=format&fit=crop&w=256&h=256&q=80',
        major: 'Computer Science',
        department: 'EECS Department',
        year: 'Junior (3rd Year)',
        semester: 'Fall 2026',
        bio: 'Full-stack developer competing in upcoming campus hackathons! Looking for 2 teammates to build mobile tools.',
        courses: ['CS 162: Operating Systems', 'CS 189: Intro to Machine Learning', 'CS 169A: Software Engineering'],
        interests: ['Distributed Systems', 'Mobile Apps', 'Hackathons', 'Espresso'],
        lookingFor: 'Hackathon Team',
        studyStyle: 'Pair Programming & Sprint Sprints',
        preferredLocation: 'Soda Hall 3rd Floor Alcove',
        availability: 'Friday evenings & all weekend',
        compatScore: 98,
        matchReasons: ['Both taking CS 162 and CS 189', 'Looking for Hackathon teammates right now'],
        isOnline: true,
      ),
      StudentProfile(
        id: 'usr_elena',
        name: 'Elena Rostova',
        avatar: 'https://images.unsplash.com/photo-1517841905240-472988babdf9?auto=format&fit=crop&w=256&h=256&q=80',
        major: 'Applied Mathematics & Statistics',
        department: 'Mathematics Division',
        year: 'Sophomore (2nd Year)',
        semester: 'Fall 2026',
        bio: 'Math nerd working through multivariable calculus and linear algebra proofs. Flashcards, practice exams, and clear explanations!',
        courses: ['MATH 53: Multivariable Calculus', 'DATA 100: Principles of Data Science', 'STAT 134: Concepts of Probability'],
        interests: ['Statistical Modeling', 'Kaggle', 'Bouldering', 'Classical Piano'],
        lookingFor: 'Exam Prep',
        studyStyle: 'Structured Flashcards & Practice Midterms',
        preferredLocation: 'Evans Hall Math Lounge 8th Floor',
        availability: 'Tues/Thurs 10:00 AM - 4:00 PM',
        compatScore: 88,
        matchReasons: ['Both enrolled in MATH 53 & DATA 100', 'Shared interest in Kaggle & Quantitative modeling'],
        isOnline: false,
      ),
      StudentProfile(
        id: 'usr_marcus',
        name: 'Marcus Vance',
        avatar: 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?auto=format&fit=crop&w=256&h=256&q=80',
        major: 'Cognitive Science & Design',
        department: 'Interdisciplinary Studies',
        year: 'Junior (3rd Year)',
        semester: 'Fall 2026',
        bio: 'Product designer building accessible campus apps. Need an engineering collaborator for projects!',
        courses: ['CS 160: User Interface Design', 'DATA 100: Principles of Data Science', 'COGSCI 131: Computational Models'],
        interests: ['UI/UX Design', 'Design Systems', 'Accessibility', 'Specialty Coffee'],
        lookingFor: 'Project Collaborator',
        studyStyle: 'Visual Wireframing & Rapid Prototyping',
        preferredLocation: 'Jacobs Hall Design Institute',
        availability: 'Flexible · Mon-Thu afternoons',
        compatScore: 84,
        matchReasons: ['Complementary Design & Engineering duo', 'Shared DATA 100 coursework'],
        isOnline: true,
      ),
      StudentProfile(
        id: 'usr_sarah',
        name: 'Sarah Lindqvist',
        avatar: 'https://images.unsplash.com/photo-1544005313-94ddf0286df2?auto=format&fit=crop&w=256&h=256&q=80',
        major: 'Bioengineering & Computer Science',
        department: 'College of Engineering',
        year: 'Senior (4th Year)',
        semester: 'Fall 2026',
        bio: 'Researching structural bioinformatics and GPU protein modeling. Preparing for midterm 1 in machine learning.',
        courses: ['CS 189: Intro to Machine Learning', 'BIOENG 144: Instrumentation', 'MATH 53: Multivariable Calculus'],
        interests: ['Computational Biology', 'Rock Climbing', 'Tea'],
        lookingFor: 'Study Buddy',
        studyStyle: 'Deep Focus · 50/10 Pomodoro',
        preferredLocation: 'Stanley Hall Atrium',
        availability: 'Weekdays 1:00 PM - 5:00 PM',
        compatScore: 89,
        matchReasons: ['Shared CS 189 & MATH 53', 'Identical Pomodoro study pace'],
        isOnline: false,
      )
    ];

    events = [
      CampusEvent(
        id: 'evt_1',
        title: 'CS 189 Midterm Prep & Problem Jam',
        organizer: 'Prof. Sarah Martinez',
        organizerRole: 'Faculty Professor (EECS)',
        category: 'Study Sesh',
        dateStr: 'Tonight, 6:30 PM – 9:00 PM',
        location: 'Soda Hall - Wozniak Lounge',
        room: 'Room 430',
        description: 'Collaborative walk-through of previous exam questions on SVMs, kernel ridge regression, and loss gradient derivations. Whiteboard space and snacks provided!',
        imageUrl: './assets/images/library_study_hub_1792864911583.jpg',
        attendeesCount: 38,
        maxCapacity: 50,
        isRsvpd: true,
        isFeatured: true,
        isOfficial: true,
        tags: ['CS189', 'Exam Prep', 'Whiteboard', 'Snacks'],
      ),
      CampusEvent(
        id: 'evt_2',
        title: '48hr Campus Life Hackathon Sprint',
        organizer: 'Jordan Lee (Mobile Dev Guild)',
        organizerRole: 'Student Club President',
        category: 'Hackathon',
        dateStr: 'This Friday, 5:00 PM kickoff',
        location: 'Jacobs Hall Makerspace & Design Hall',
        room: 'Studio One',
        description: 'Build production-grade mobile web applications with Dart, Flutter, and Serverpod. Mentors will be on-site to assist teams throughout the weekend.',
        imageUrl: './assets/images/hackathon_team_jam_1792864909538.jpg',
        attendeesCount: 142,
        maxCapacity: 200,
        isRsvpd: false,
        isFeatured: true,
        tags: ['Dart', 'Flutter', '\$5k Prizes', 'Team Formation'],
      ),
      CampusEvent(
        id: 'evt_3',
        title: 'Sunset Acoustic Jam & Lawn Social',
        organizer: 'Campus Arts & Student Union',
        organizerRole: 'Student Club Head',
        category: 'Social',
        dateStr: 'Tomorrow, 5:30 PM – 8:00 PM',
        location: 'Memorial Glade North Lawn',
        room: 'Outdoor Amphitheater',
        description: 'Take a break from midterm grinding. Unwind with acoustic sets, artisan hot apple cider, lawn games, and meet fellow students across disciplines.',
        imageUrl: './assets/images/campus_event_concert_1792864910760.jpg',
        attendeesCount: 89,
        maxCapacity: 250,
        isRsvpd: false,
        tags: ['Live Music', 'Free Cider', 'Relaxation', 'Outdoor'],
      ),
      CampusEvent(
        id: 'evt_4',
        title: 'Operating Systems (CS 162) Threading Lab Clinic',
        organizer: 'Prof. Sarah Martinez & Tutors',
        organizerRole: 'Faculty Lead',
        category: 'Workshop',
        dateStr: 'Thursday, 3:00 PM – 5:00 PM',
        location: 'Cory Hall Systems Computing Lab',
        room: 'Lab 214',
        description: 'Hands-on debugging session for Pintos Project 1: Timer interrupts, priority scheduling, and synchronization primitives. Bring your laptops.',
        imageUrl: './assets/images/campus_quad_banner_1792864909368.jpg',
        attendeesCount: 24,
        maxCapacity: 35,
        isRsvpd: true,
        isOfficial: true,
        tags: ['CS162', 'Pintos', 'Concurrency', 'Code Clinic'],
      ),
    ];

    connections = [
      Connection(
        id: 'conn_maya',
        student: students[0],
        status: 'connected',
        lastMessage: 'Awesome! Let\'s grab a whiteboard table at Doe Stacks tomorrow at 3 PM.',
        lastMessageTime: '12m ago',
        unreadCount: 1,
      ),
      Connection(
        id: 'conn_david',
        student: students[1],
        status: 'connected',
        lastMessage: 'Want to team up for the Campus Life track this weekend?',
        lastMessageTime: '1h ago',
        unreadCount: 0,
      ),
    ];

    chatMessages = {
      'usr_maya': [
        ChatMessage(
          id: 'm1',
          senderId: 'usr_maya',
          senderName: 'Maya Patel',
          text: 'Hey Alex! Saw you\'re also reviewing CS 189 gradient derivations.',
          timestamp: '2:15 PM',
        ),
        ChatMessage(
          id: 'm2',
          senderId: 'usr_me',
          senderName: 'Alex Chen',
          text: 'Hey Maya! Yes, working on Problem 3 for the homework right now.',
          timestamp: '2:18 PM',
        ),
        ChatMessage(
          id: 'm3',
          senderId: 'usr_maya',
          senderName: 'Maya Patel',
          text: 'Awesome! Let\'s grab a whiteboard table at Doe Stacks tomorrow at 3 PM.',
          timestamp: '2:24 PM',
          isStudyInvite: true,
          inviteCourse: 'CS 189 Problem Set Review',
          inviteLocation: 'Doe Memorial Library - Level 2',
          inviteTime: 'Tomorrow at 3:00 PM',
        ),
      ],
      'usr_david': [
        ChatMessage(
          id: 'd1',
          senderId: 'usr_david',
          senderName: 'David Kim',
          text: 'Want to team up for the Campus Life track this weekend?',
          timestamp: '1:10 PM',
          isStudyInvite: true,
          inviteCourse: 'Campus Hackathon Sprint',
          inviteLocation: 'Soda Hall 3rd Floor Alcove',
          inviteTime: 'Friday 5:00 PM',
        ),
      ]
    };
  }

  void recalculateScores() {
    for (var s in students) {
      final shared = s.courses.where((c) => currentUser.courses.contains(c)).toList();
      var score = 70 + shared.length * 10;
      if (s.lookingFor == currentUser.lookingFor) score += 8;
      if (score > 99) score = 99;
      s.compatScore = score;
    }
  }

  void switchLoginRole(String role) {
    loginRoleSelection = role;
    loginError = '';
    if (role == 'student') {
      loginEmail = 'alex.chen@campus.edu';
      loginPassword = 'Password2026!';
    } else if (role == 'faculty_club') {
      if (facultyClubSubRole == 'teacher') {
        loginEmail = 'prof.martinez@eecs.campus.edu';
        loginPassword = 'FacultyPass2026!';
      } else {
        loginEmail = 'jordan.lee@clubs.campus.edu';
        loginPassword = 'ClubLead2026!';
      }
    } else {
      loginEmail = 'dean.holloway@campus.edu';
      loginPassword = 'AdminPass2026!';
    }
  }

  void switchFacultyClubSubRole(String subRole) {
    facultyClubSubRole = subRole;
    loginError = '';
    if (subRole == 'teacher') {
      loginEmail = 'prof.martinez@eecs.campus.edu';
      loginPassword = 'FacultyPass2026!';
    } else {
      loginEmail = 'jordan.lee@clubs.campus.edu';
      loginPassword = 'ClubLead2026!';
    }
  }

  void loginAsStudent() {
    isLoggedIn = true;
    userRole = 'student';
    activeSection = 'discover';
    loginError = '';
  }

  void loginAsTeacher() {
    isLoggedIn = true;
    userRole = 'teacher';
    activeSection = 'events';
    loginError = '';
  }

  void loginAsClubHead() {
    isLoggedIn = true;
    userRole = 'club_head';
    activeSection = 'events';
    loginError = '';
  }

  void loginAsAdmin() {
    isLoggedIn = true;
    userRole = 'admin';
    activeSection = 'admin';
    loginError = '';
  }

  void logout() {
    isLoggedIn = false;
    loginError = '';
    loginRoleSelection = 'student';
    facultyClubSubRole = 'teacher';
    loginEmail = 'alex.chen@campus.edu';
    loginPassword = 'Password2026!';
    showPassword = false;
  }
}

// Global App State Instance
final state = AppState();

// ==========================================
// DART UI RENDERER (DART:HTML)
// ==========================================

void main() {
  renderApp();
}

void showToast(String message) {
  final existing = querySelector('#toast-container');
  existing?.remove();

  final toast = DivElement()
    ..id = 'toast-container'
    ..className = 'fixed bottom-6 right-6 z-50 bg-slate-900 text-white px-4 py-3 rounded-xl text-xs font-semibold shadow-xl border border-slate-800 flex items-center gap-2'
    ..children = [
      SpanElement()..text = '✓ $message',
    ];

  document.body?.append(toast);
  Future.delayed(Duration(seconds: 3), () {
    toast.remove();
  });
}

void renderApp() {
  final app = querySelector('#app');
  if (app == null) return;
  app.children.clear();

  // If not logged in, render the login view
  if (!state.isLoggedIn) {
    app.append(renderLoginScreen());
    return;
  }

  // Root Container
  final root = DivElement()..className = 'min-h-screen bg-slate-50 flex flex-col font-sans selection:bg-indigo-500 selection:text-white';

  // Global Role / Permission Awareness Strip
  final roleBanner = DivElement()
    ..className = 'px-4 py-2 text-xs font-bold flex flex-wrap items-center justify-between gap-3 shadow-2xs ' +
        (state.userRole == 'teacher'
            ? 'bg-emerald-700 text-white'
            : state.userRole == 'club_head'
                ? 'bg-violet-800 text-white'
                : state.userRole == 'admin'
                    ? 'bg-amber-500 text-slate-950'
                    : 'bg-slate-900 text-slate-200 border-b border-slate-800');

  final bannerLeft = DivElement()..className = 'flex items-center gap-2 truncate';
  if (state.userRole == 'teacher') {
    bannerLeft.children = [
      SpanElement()..text = '👩‍🏫',
      SpanElement()..className = 'font-extrabold'..text = 'Faculty Portal:',
      SpanElement()..text = 'Prof. Sarah Martinez (EECS) • Verified Event Publishing Authority Active',
    ];
  } else if (state.userRole == 'club_head') {
    bannerLeft.children = [
      SpanElement()..text = '🏆',
      SpanElement()..className = 'font-extrabold'..text = 'Club Head Portal:',
      SpanElement()..text = 'Jordan Lee (President, Mobile Dev Guild) • Verified Event Publishing Authority Active',
    ];
  } else if (state.userRole == 'admin') {
    bannerLeft.children = [
      SpanElement()..text = '🛡️',
      SpanElement()..className = 'font-extrabold'..text = 'Campus Admin Console:',
      SpanElement()..text = 'Dean Marcus Holloway • Institutional Governance & Moderation',
    ];
  } else {
    bannerLeft.children = [
      SpanElement()..text = '🎓',
      SpanElement()..className = 'font-extrabold text-indigo-300'..text = 'Student Account (Alex Chen):',
      SpanElement()..className = 'text-slate-300'..text = 'Event Browsing & Study Matching Active',
      SpanElement()..className = 'px-2 py-0.5 rounded bg-amber-400/20 text-amber-300 border border-amber-400/30 text-[10px] font-bold'..text = '🔒 Event Posting Restricted',
    ];
  }

  final bannerRight = DivElement()..className = 'flex items-center gap-2 shrink-0';
  if (state.userRole == 'student') {
    bannerRight.children = [
      SpanElement()..className = 'text-[11px] text-slate-400 hidden sm:inline'..text = 'Want to post an event?',
      ButtonElement()
        ..className = 'px-2.5 py-1 bg-emerald-600 hover:bg-emerald-500 text-white rounded-lg text-[11px] font-bold cursor-pointer transition-colors'
        ..text = '👩‍🏫 Switch to Teacher'
        ..onClick.listen((_) {
          state.loginAsTeacher();
          showToast('Switched to Prof. Sarah Martinez (Teacher mode)');
          renderApp();
        }),
      ButtonElement()
        ..className = 'px-2.5 py-1 bg-violet-600 hover:bg-violet-500 text-white rounded-lg text-[11px] font-bold cursor-pointer transition-colors'
        ..text = '🏆 Switch to Club Head'
        ..onClick.listen((_) {
          state.loginAsClubHead();
          showToast('Switched to Jordan Lee (Club Head mode)');
          renderApp();
        }),
    ];
  } else {
    bannerRight.children = [
      ButtonElement()
        ..className = 'px-2.5 py-1 ${state.userRole == "admin" ? "bg-slate-900 text-amber-300 hover:bg-black" : "bg-white/20 hover:bg-white/30 text-white"} rounded-lg text-[11px] font-bold cursor-pointer transition-colors'
        ..text = '🎓 Switch to Student View'
        ..onClick.listen((_) {
          state.loginAsStudent();
          showToast('Switched to Student mode (Alex Chen)');
          renderApp();
        }),
    ];
  }

  roleBanner..append(bannerLeft)..append(bannerRight);
  root.append(roleBanner);

  // 1. Header
  root.append(renderHeader());

  // 2. Main Content
  final main = Element.tag('main')..className = 'flex-1 max-w-7xl mx-auto w-full px-4 sm:px-6 lg:px-8 py-6 sm:py-8 space-y-8';

  if (state.activeSection == 'discover') {
    main.append(renderDiscoverSection());
  } else if (state.activeSection == 'events') {
    main.append(renderEventsSection());
  } else if (state.activeSection == 'chats') {
    main.append(renderChatsSection());
  } else if (state.activeSection == 'schedule') {
    main.append(renderScheduleSection());
  } else if (state.activeSection == 'admin') {
    main.append(renderAdminConsoleSection());
  }

  root.append(main);

  // 3. Footer
  root.append(renderFooter());

  // 4. Modals
  if (state.isProfileOpen) {
    root.append(renderProfileModal());
  }
  if (state.connectModalStudent != null) {
    root.append(renderConnectModal());
  }
  if (state.isCreateEventOpen) {
    root.append(renderCreateEventModal());
  }

  app.append(root);
}

// ==========================================
// LOGIN SCREEN (STUDENT & ADMIN)
// ==========================================

Element renderLoginScreen() {
  final outer = DivElement()
    ..className = 'min-h-screen bg-slate-950 text-slate-100 flex flex-col justify-between relative overflow-hidden font-sans selection:bg-indigo-500 selection:text-white';

  // Ambient campus quad background image with dual-tone gradient overlay
  final bg = ImageElement()
    ..src = './assets/images/campus_quad_banner_1792864909368.jpg'
    ..alt = 'Campus Quad'
    ..className = 'absolute inset-0 w-full h-full object-cover opacity-20 filter blur-xs';
  final scrim = DivElement()..className = 'absolute inset-0 bg-gradient-to-br from-slate-950 via-slate-900/90 to-indigo-950/70';

  // 1. Top CampusPulse Header Bar
  final topBar = Element.tag('header')
    ..className = 'relative z-20 w-full max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-5 flex items-center justify-between gap-4 border-b border-white/10';

  final brandLink = DivElement()
    ..className = 'flex items-center gap-3'
    ..children = [
      DivElement()
        ..className = 'w-10 h-10 rounded-2xl bg-gradient-to-tr from-indigo-600 via-indigo-500 to-violet-500 text-white font-black text-xl flex items-center justify-center shadow-lg shadow-indigo-500/30'
        ..text = 'C',
      DivElement()
        ..children = [
          DivElement()
            ..className = 'flex items-center gap-2'
            ..children = [
              SpanElement()..className = 'text-xl font-extrabold tracking-tight text-white'..text = 'CampusPulse',
              SpanElement()..className = 'px-2 py-0.5 rounded-full text-[10px] font-bold bg-indigo-500/20 text-indigo-300 border border-indigo-400/30'..text = 'v2.4',
            ],
          SpanElement()
            ..className = 'text-xs text-slate-400 block font-medium'
            ..text = 'Central Campus Academic & Student Life Ecosystem',
        ]
    ];

  final statusBadge = DivElement()
    ..className = 'hidden sm:flex items-center gap-3 text-xs'
    ..children = [
      DivElement()
        ..className = 'flex items-center gap-2 bg-slate-900/80 backdrop-blur-md px-3 py-1.5 rounded-full border border-slate-700/80 text-slate-300'
        ..children = [
          SpanElement()..className = 'w-2 h-2 rounded-full bg-emerald-400 animate-pulse',
          SpanElement()..className = 'font-semibold'..text = 'Campus Network Active',
          SpanElement()..className = 'text-slate-500'..text = '•',
          SpanElement()..className = 'text-slate-400'..text = 'Fall 2026 Term',
        ],
      DivElement()
        ..className = 'hidden md:flex items-center gap-1.5 text-slate-400'
        ..children = [
          SpanElement()..text = '📞',
          SpanElement()..className = 'text-[11px]'..text = 'IT Help: (510) 642-HELP',
        ]
    ];

  topBar..append(brandLink)..append(statusBadge);

  // 2. Main Content Grid (Split screen on large displays, stacked on mobile)
  final mainContainer = DivElement()
    ..className = 'relative z-10 w-full max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-6 sm:py-10 flex-1 flex items-center';

  final grid = DivElement()
    ..className = 'w-full grid grid-cols-1 lg:grid-cols-12 gap-8 lg:gap-12 items-center';

  // --- LEFT COLUMN: Brand Identity & Campus Life Showcase ---
  final leftCol = DivElement()
    ..className = 'lg:col-span-5 hidden lg:flex flex-col space-y-8 text-white';

  final heroIntro = DivElement()
    ..className = 'space-y-4'
    ..children = [
      DivElement()
        ..className = 'inline-flex items-center gap-2 px-3 py-1 rounded-full text-xs font-bold bg-indigo-500/20 text-indigo-300 border border-indigo-400/30'
        ..children = [
          SpanElement()..text = '⚡',
          SpanElement()..text = 'CAMPUS LIFE, UPGRADED',
        ],
      HeadingElement.h1()
        ..className = 'text-4xl xl:text-5xl font-black tracking-tight leading-tight text-white'
        ..children = [
          SpanElement()..text = 'One Campus.\n',
          SpanElement()..className = 'text-transparent bg-clip-text bg-gradient-to-r from-indigo-400 via-violet-300 to-amber-300'..text = 'Infinite Connections.',
        ],
      ParagraphElement()
        ..className = 'text-sm text-slate-300 leading-relaxed max-w-md'
        ..text = 'The unified digital campus platform where students discover class study partners and live events, and university staff coordinate verified broadcasts and academic safety.',
    ];

  // Live Pulse Highlights Cards
  final tickerBox = DivElement()
    ..className = 'space-y-3'
    ..children = [
      DivElement()
        ..className = 'bg-slate-900/70 backdrop-blur-md rounded-2xl p-3.5 border border-slate-800 flex items-start gap-3.5 shadow-sm'
        ..children = [
          DivElement()
            ..className = 'w-9 h-9 rounded-xl bg-indigo-600/30 text-indigo-400 flex items-center justify-center shrink-0 text-base font-bold'
            ..text = '🎯',
          DivElement()
            ..className = 'space-y-0.5 text-xs'
            ..children = [
              DivElement()
                ..className = 'flex items-center gap-2'
                ..children = [
                  SpanElement()..className = 'font-bold text-slate-100'..text = 'Smart Course Match Engine',
                  SpanElement()..className = 'px-1.5 py-0.2 rounded bg-indigo-500/20 text-indigo-300 text-[10px] font-bold'..text = '96% Match',
                ],
              ParagraphElement()
                ..className = 'text-slate-400 text-[11px]'
                ..text = 'Maya Patel & Alex Chen paired for CS 189 Machine Learning midterms at Doe Stacks Level C.',
            ]
        ],
      DivElement()
        ..className = 'bg-slate-900/70 backdrop-blur-md rounded-2xl p-3.5 border border-slate-800 flex items-start gap-3.5 shadow-sm'
        ..children = [
          DivElement()
            ..className = 'w-9 h-9 rounded-xl bg-amber-600/30 text-amber-400 flex items-center justify-center shrink-0 text-base font-bold'
            ..text = '📢',
          DivElement()
            ..className = 'space-y-0.5 text-xs'
            ..children = [
              DivElement()
                ..className = 'flex items-center gap-2'
                ..children = [
                  SpanElement()..className = 'font-bold text-slate-100'..text = 'Official University Bulletin',
                  SpanElement()..className = 'px-1.5 py-0.2 rounded bg-amber-500/20 text-amber-300 text-[10px] font-bold'..text = 'Pinned',
                ],
              ParagraphElement()
                ..className = 'text-slate-400 text-[11px]'
                ..text = 'CalHacks 12.0 team matching board is active with 350+ enrolled students.',
            ]
        ],
    ];

  // Stats Strip
  final statsRow = DivElement()
    ..className = 'grid grid-cols-3 gap-3 pt-2'
    ..children = [
      DivElement()
        ..className = 'bg-slate-900/50 rounded-xl p-3 border border-slate-800/80 text-center'
        ..children = [
          SpanElement()..className = 'text-xl font-black text-indigo-400 block'..text = '1,420+',
          SpanElement()..className = 'text-[11px] text-slate-400 block font-medium'..text = 'Students Active',
        ],
      DivElement()
        ..className = 'bg-slate-900/50 rounded-xl p-3 border border-slate-800/80 text-center'
        ..children = [
          SpanElement()..className = 'text-xl font-black text-violet-400 block'..text = '48',
          SpanElement()..className = 'text-[11px] text-slate-400 block font-medium'..text = 'Study Tables Today',
        ],
      DivElement()
        ..className = 'bg-slate-900/50 rounded-xl p-3 border border-slate-800/80 text-center'
        ..children = [
          SpanElement()..className = 'text-xl font-black text-emerald-400 block'..text = '100%',
          SpanElement()..className = 'text-[11px] text-slate-400 block font-medium'..text = 'Verified .edu SSO',
        ],
    ];

  // Security assurance note
  final secAssurance = DivElement()
    ..className = 'flex items-center gap-2 text-xs text-slate-400'
    ..children = [
      SpanElement()..text = '🛡️',
      SpanElement()..className = 'text-[11px]'..text = 'FERPA compliant • Campus Single Sign-On (SSO) 2.0 encrypted',
    ];

  leftCol..append(heroIntro)..append(tickerBox)..append(statsRow)..append(secAssurance);

  // --- RIGHT COLUMN: Clean, Responsive Multi-Role Login Card ---
  final rightCol = DivElement()
    ..className = 'lg:col-span-7 max-w-xl mx-auto w-full';

  final card = DivElement()
    ..className = 'bg-white rounded-3xl p-6 sm:p-8 shadow-2xl border border-slate-200/90 space-y-6 text-slate-900 relative';

  final isStudent = state.loginRoleSelection == 'student';
  final isFacultyClub = state.loginRoleSelection == 'faculty_club';
  final isAdmin = state.loginRoleSelection == 'admin';

  // Step A: Header of Login Box
  final cardHeader = DivElement()
    ..className = 'space-y-1 text-center sm:text-left'
    ..children = [
      DivElement()
        ..className = 'flex items-center justify-between'
        ..children = [
          SpanElement()
            ..className = 'text-xs font-bold uppercase tracking-wider text-slate-400'
            ..text = 'CAMPUS AUTHENTICATION PORTAL',
          SpanElement()
            ..className = 'text-[11px] font-semibold text-slate-500 hidden sm:inline'
            ..text = 'Secure SSL 256-Bit',
        ],
      HeadingElement.h2()
        ..className = 'text-2xl font-black tracking-tight text-slate-900'
        ..text = isStudent
            ? 'Student Campus Hub Access'
            : isFacultyClub
                ? (state.facultyClubSubRole == 'teacher'
                    ? 'Faculty Teacher Special Portal'
                    : 'Student Club Head Special Portal')
                : 'Administrative Staff Clearance',
      ParagraphElement()
        ..className = 'text-xs text-slate-500'
        ..text = isStudent
            ? 'Sign in to match with classmates, RSVP to campus events, and collaborate in study groups. (Event posting restricted to verified faculty & club heads).'
            : isFacultyClub
                ? (state.facultyClubSubRole == 'teacher'
                    ? 'Verified academic instructor sign-in. Authorized to publish course clinics, study jams, and university symposiums.'
                    : 'Recognized student organization leadership sign-in. Authorized to publish hackathons, club meetings, and campus socials.')
                : 'Sign in to publish official university broadcasts, moderate events, and audit student directories.',
    ];

  // Step B: TRIPLE DEDICATED ENTRY POINTS (Interactive Gateway Selection Cards)
  final gatewaySelectorWrapper = DivElement()..className = 'space-y-2';
  final gatewayLabel = DivElement()
    ..className = 'text-xs font-bold text-slate-700 flex items-center justify-between'
    ..children = [
      SpanElement()..text = 'SELECT YOUR ACCESS GATEWAY:',
      SpanElement()
        ..className = 'text-[11px] font-normal text-slate-500'
        ..text = isStudent
            ? 'Students'
            : isFacultyClub
                ? 'Authorized Event Posters'
                : 'Campus Administration',
    ];

  final gatewayGrid = DivElement()
    ..className = 'grid grid-cols-1 sm:grid-cols-3 gap-2.5';

  // Gateway Card 1: Student Portal
  final studentGatewayCard = ButtonElement()
    ..className = 'text-left p-3.5 rounded-2xl transition-all cursor-pointer relative border-2 ${isStudent ? "border-indigo-600 bg-indigo-50/70 shadow-sm ring-2 ring-indigo-500/20" : "border-slate-200 bg-slate-50/80 hover:bg-slate-100 hover:border-slate-300"}'
    ..onClick.listen((_) {
      state.switchLoginRole('student');
      renderApp();
    })
    ..children = [
      DivElement()
        ..className = 'flex items-start justify-between mb-1.5'
        ..children = [
          DivElement()
            ..className = 'w-8 h-8 rounded-xl ${isStudent ? "bg-indigo-600 text-white" : "bg-indigo-100 text-indigo-700"} flex items-center justify-center font-bold text-sm shadow-xs'
            ..text = '🎓',
          if (isStudent)
            SpanElement()
              ..className = 'px-1.5 py-0.5 rounded-full text-[9px] font-extrabold bg-indigo-600 text-white shadow-2xs'
              ..text = 'ACTIVE',
        ],
      DivElement()
        ..children = [
          SpanElement()
            ..className = 'text-xs font-extrabold block text-slate-900'
            ..text = 'Student Hub',
          SpanElement()
            ..className = 'text-[10px] text-slate-500 block leading-tight font-medium mt-0.5'
            ..text = 'Undergrad & Grad',
          SpanElement()
            ..className = 'text-[9px] font-semibold ${isStudent ? "text-indigo-700" : "text-slate-400"} block mt-1.5'
            ..text = '• Study Buddies • RSVPs',
          SpanElement()
            ..className = 'inline-block mt-1 px-1.5 py-0.5 rounded text-[9px] font-bold bg-slate-200/60 text-slate-600'
            ..text = '🔒 Posting Locked',
        ]
    ];

  // Gateway Card 2: Faculty & Club Head Special Portal (Authorized to Post Events)
  final facultyClubGatewayCard = ButtonElement()
    ..className = 'text-left p-3.5 rounded-2xl transition-all cursor-pointer relative border-2 ${isFacultyClub ? "border-violet-600 bg-violet-50/70 shadow-sm ring-2 ring-violet-500/20" : "border-slate-200 bg-slate-50/80 hover:bg-slate-100 hover:border-slate-300"}'
    ..onClick.listen((_) {
      state.switchLoginRole('faculty_club');
      renderApp();
    })
    ..children = [
      DivElement()
        ..className = 'flex items-start justify-between mb-1.5'
        ..children = [
          DivElement()
            ..className = 'w-8 h-8 rounded-xl ${isFacultyClub ? "bg-violet-600 text-white" : "bg-violet-100 text-violet-700"} flex items-center justify-center font-bold text-sm shadow-xs'
            ..text = '✨',
          if (isFacultyClub)
            SpanElement()
              ..className = 'px-1.5 py-0.5 rounded-full text-[9px] font-extrabold bg-violet-600 text-white shadow-2xs'
              ..text = 'ACTIVE',
        ],
      DivElement()
        ..children = [
          SpanElement()
            ..className = 'text-xs font-extrabold block text-slate-900'
            ..text = 'Faculty & Club',
          SpanElement()
            ..className = 'text-[10px] text-slate-500 block leading-tight font-medium mt-0.5'
            ..text = 'Teachers & Club Heads',
          SpanElement()
            ..className = 'text-[9px] font-semibold ${isFacultyClub ? "text-violet-700" : "text-slate-400"} block mt-1.5'
            ..text = '• Post Events • Seminars',
          SpanElement()
            ..className = 'inline-block mt-1 px-1.5 py-0.5 rounded text-[9px] font-bold bg-violet-200/80 text-violet-800'
            ..text = '⚡ Event Posters',
        ]
    ];

  // Gateway Card 3: Administrative Staff Portal
  final adminGatewayCard = ButtonElement()
    ..className = 'text-left p-3.5 rounded-2xl transition-all cursor-pointer relative border-2 ${isAdmin ? "border-amber-600 bg-amber-50/70 shadow-sm ring-2 ring-amber-500/20" : "border-slate-200 bg-slate-50/80 hover:bg-slate-100 hover:border-slate-300"}'
    ..onClick.listen((_) {
      state.switchLoginRole('admin');
      renderApp();
    })
    ..children = [
      DivElement()
        ..className = 'flex items-start justify-between mb-1.5'
        ..children = [
          DivElement()
            ..className = 'w-8 h-8 rounded-xl ${isAdmin ? "bg-amber-600 text-slate-950 font-bold" : "bg-amber-100 text-amber-800 font-bold"} flex items-center justify-center text-sm shadow-xs'
            ..text = '🛡️',
          if (isAdmin)
            SpanElement()
              ..className = 'px-1.5 py-0.5 rounded-full text-[9px] font-extrabold bg-amber-600 text-slate-950 shadow-2xs'
              ..text = 'ACTIVE',
        ],
      DivElement()
        ..children = [
          SpanElement()
            ..className = 'text-xs font-extrabold block text-slate-900'
            ..text = 'Campus Admin',
          SpanElement()
            ..className = 'text-[10px] text-slate-500 block leading-tight font-medium mt-0.5'
            ..text = 'Deans & Governance',
          SpanElement()
            ..className = 'text-[9px] font-semibold ${isAdmin ? "text-amber-800" : "text-slate-400"} block mt-1.5'
            ..text = '• Moderation • Broadcasts',
          SpanElement()
            ..className = 'inline-block mt-1 px-1.5 py-0.5 rounded text-[9px] font-bold bg-amber-200/80 text-amber-900'
            ..text = '🏛️ Oversight',
        ]
    ];

  gatewayGrid..append(studentGatewayCard)..append(facultyClubGatewayCard)..append(adminGatewayCard);
  gatewaySelectorWrapper..append(gatewayLabel)..append(gatewayGrid);

  // Sub-Selector for Faculty & Club Head Gateway
  DivElement? subRoleCard;
  if (isFacultyClub) {
    subRoleCard = DivElement()
      ..className = 'p-3 bg-gradient-to-r from-violet-50 to-indigo-50 rounded-2xl border border-violet-200 space-y-2'
      ..children = [
        DivElement()
          ..className = 'flex items-center justify-between'
          ..children = [
            SpanElement()
              ..className = 'text-[11px] font-bold text-violet-900'
              ..text = '⚡ SPECIAL CLEARANCE: SELECT YOUR PUBLISHING ROLE',
            SpanElement()
              ..className = 'text-[10px] font-semibold text-emerald-700 bg-emerald-100 px-2 py-0.5 rounded-full'
              ..text = '✓ Authorized to Post Events',
          ],
        DivElement()
          ..className = 'grid grid-cols-1 sm:grid-cols-2 gap-2'
          ..children = [
            ButtonElement()
              ..className = 'p-2.5 rounded-xl border-2 text-left cursor-pointer transition-all ${state.facultyClubSubRole == "teacher" ? "border-emerald-600 bg-white shadow-xs ring-1 ring-emerald-500/20" : "border-violet-200/70 bg-white/60 hover:bg-white"}'
              ..onClick.listen((_) {
                state.switchFacultyClubSubRole('teacher');
                renderApp();
              })
              ..children = [
                DivElement()
                  ..className = 'flex items-center justify-between mb-1'
                  ..children = [
                    SpanElement()..className = 'font-bold text-xs text-slate-900'..text = '👩‍🏫 Faculty Teacher',
                    if (state.facultyClubSubRole == 'teacher')
                      SpanElement()..className = 'w-2 h-2 rounded-full bg-emerald-500 animate-pulse',
                  ],
                SpanElement()
                  ..className = 'text-[10px] text-slate-500 block leading-tight'
                  ..text = 'Prof. Sarah Martinez (EECS)',
                SpanElement()
                  ..className = 'text-[9px] font-semibold text-emerald-700 block mt-1'
                  ..text = 'Post study jams, reviews & clinics',
              ],
            ButtonElement()
              ..className = 'p-2.5 rounded-xl border-2 text-left cursor-pointer transition-all ${state.facultyClubSubRole == "club_head" ? "border-violet-600 bg-white shadow-xs ring-1 ring-violet-500/20" : "border-violet-200/70 bg-white/60 hover:bg-white"}'
              ..onClick.listen((_) {
                state.facultyClubSubRole = 'club_head';
                state.switchFacultyClubSubRole('club_head');
                renderApp();
              })
              ..children = [
                DivElement()
                  ..className = 'flex items-center justify-between mb-1'
                  ..children = [
                    SpanElement()..className = 'font-bold text-xs text-slate-900'..text = '🏆 Student Club Head',
                    if (state.facultyClubSubRole == 'club_head')
                      SpanElement()..className = 'w-2 h-2 rounded-full bg-violet-500 animate-pulse',
                  ],
                SpanElement()
                  ..className = 'text-[10px] text-slate-500 block leading-tight'
                  ..text = 'Jordan Lee (President, Mobile Guild)',
                SpanElement()
                  ..className = 'text-[9px] font-semibold text-violet-700 block mt-1'
                  ..text = 'Post hackathons & club meetings',
              ],
          ]
      ];
  }

  // Step C: Contextual Gateway Notification
  final contextBadge = DivElement()
    ..className = 'p-3 rounded-xl flex items-center gap-3 text-xs ${isStudent ? "bg-indigo-50/80 text-indigo-900 border border-indigo-200/80" : isFacultyClub ? "bg-violet-50 text-violet-950 border border-violet-200/80" : "bg-amber-50 text-amber-950 border border-amber-200/80"}'
    ..children = [
      SpanElement()
        ..className = 'text-base'
        ..text = isStudent ? '🎓' : isFacultyClub ? (state.facultyClubSubRole == 'teacher' ? '👩‍🏫' : '🏆') : '🛡️',
      DivElement()
        ..className = 'flex-1 leading-snug'
        ..children = [
          SpanElement()
            ..className = 'font-bold block'
            ..text = isStudent
                ? 'Student Account Access Portal'
                : isFacultyClub
                    ? (state.facultyClubSubRole == 'teacher'
                        ? 'Faculty Teacher Clearance: Prof. Sarah Martinez (EECS)'
                        : 'Student Club Head Clearance: Jordan Lee (Mobile Dev Guild)')
                    : 'Official Campus Administration Zone',
          SpanElement()
            ..className = 'text-[11px] ${isStudent ? "text-indigo-700" : isFacultyClub ? "text-violet-800" : "text-amber-900"}'
            ..text = isStudent
                ? 'Authorized for enrolled students. Study buddy matching and event RSVPs active. (Note: Event posting is restricted to verified teachers and club heads).'
                : isFacultyClub
                    ? (state.facultyClubSubRole == 'teacher'
                        ? 'Academic faculty clearance verified. Authorized to post exam reviews, office hours clinics, and academic lectures.'
                        : 'Recognized student organization executive status verified. Authorized to post hackathons, meetings, and club mixers.')
                    : 'Institutional clearance required. Multi-factor administrative tokens verified.',
        ]
    ];

  // Quick-fill credentials shortcut button
  final quickFillBtn = ButtonElement()
    ..className = 'w-full py-2 px-3 rounded-xl border border-dashed ${isStudent ? "border-indigo-300 bg-indigo-50/40 text-indigo-700 hover:bg-indigo-50" : isFacultyClub ? "border-violet-300 bg-violet-50/40 text-violet-800 hover:bg-violet-50" : "border-amber-300 bg-amber-50/40 text-amber-900 hover:bg-amber-50"} text-xs font-semibold flex items-center justify-center gap-2 cursor-pointer transition-colors'
    ..text = isStudent
        ? '⚡ Autofill Alex Chen\'s Student Credentials (alex.chen@campus.edu)'
        : isFacultyClub
            ? (state.facultyClubSubRole == 'teacher'
                ? '⚡ Autofill Prof. Martinez\'s Teacher Credentials (prof.martinez@eecs.campus.edu)'
                : '⚡ Autofill Jordan Lee\'s Club Head Credentials (jordan.lee@clubs.campus.edu)')
            : '⚡ Autofill Dean Holloway\'s Admin Credentials (dean.holloway@campus.edu)'
    ..onClick.listen((_) {
      if (isStudent) {
        state.loginEmail = 'alex.chen@campus.edu';
        state.loginPassword = 'Password2026!';
        showToast('Filled Alex Chen\'s student credentials');
      } else if (isFacultyClub) {
        if (state.facultyClubSubRole == 'teacher') {
          state.loginEmail = 'prof.martinez@eecs.campus.edu';
          state.loginPassword = 'FacultyPass2026!';
          showToast('Filled Prof. Sarah Martinez\'s faculty teacher credentials');
        } else {
          state.loginEmail = 'jordan.lee@clubs.campus.edu';
          state.loginPassword = 'ClubLead2026!';
          showToast('Filled Jordan Lee\'s student club head credentials');
        }
      } else {
        state.loginEmail = 'dean.holloway@campus.edu';
        state.loginPassword = 'AdminPass2026!';
        showToast('Filled Dean Holloway\'s admin credentials');
      }
      state.loginError = '';
      renderApp();
    });

  // Step D: Form Fields
  final form = FormElement()..className = 'space-y-4 text-xs';

  // Inline error message if any
  if (state.loginError.isNotEmpty) {
    final errBanner = DivElement()
      ..className = 'p-3 rounded-xl bg-red-50 text-red-800 border border-red-200 text-xs font-semibold flex items-center justify-between'
      ..children = [
        SpanElement()..text = '⚠️ ${state.loginError}',
        ButtonElement()
          ..className = 'text-red-600 hover:text-red-900 text-xs font-bold cursor-pointer'
          ..text = '✕'
          ..onClick.listen((_) {
            state.loginError = '';
            renderApp();
          })
      ];
    form.append(errBanner);
  }

  // 1. Email input
  final emailGroup = DivElement()
    ..className = 'space-y-1.5'
    ..children = [
      DivElement()
        ..className = 'flex items-center justify-between'
        ..children = [
          LabelElement()
            ..className = 'font-bold text-slate-700 block'
            ..text = isStudent
                ? 'Student University Email or Student ID'
                : isFacultyClub
                    ? (state.facultyClubSubRole == 'teacher'
                        ? 'Faculty Professor Email'
                        : 'Student Club Head Email')
                    : 'Administrative Faculty / Staff Email',
          SpanElement()
            ..className = 'text-[11px] text-slate-400 font-medium'
            ..text = isStudent
                ? '@campus.edu'
                : isFacultyClub
                    ? (state.facultyClubSubRole == 'teacher' ? '@eecs.campus.edu' : '@clubs.campus.edu')
                    : '@staff.campus.edu',
        ],
      DivElement()
        ..className = 'relative flex items-center'
        ..children = [
          SpanElement()
            ..className = 'absolute left-3.5 text-slate-400 text-sm select-none'
            ..text = isStudent
                ? '✉️'
                : isFacultyClub
                    ? (state.facultyClubSubRole == 'teacher' ? '👩‍🏫' : '🏆')
                    : '🏛️',
          InputElement()
            ..type = 'text'
            ..value = state.loginEmail
            ..placeholder = isStudent
                ? 'alex.chen@campus.edu or 30349281'
                : isFacultyClub
                    ? (state.facultyClubSubRole == 'teacher'
                        ? 'prof.martinez@eecs.campus.edu'
                        : 'jordan.lee@clubs.campus.edu')
                    : 'dean.holloway@campus.edu'
            ..className = 'w-full pl-10 pr-4 py-3 bg-slate-50 border border-slate-200 rounded-xl focus:outline-none focus:ring-2 ${isStudent ? "focus:ring-indigo-500 focus:border-indigo-500" : isFacultyClub ? "focus:ring-violet-500 focus:border-violet-500" : "focus:ring-amber-500 focus:border-amber-500"} text-slate-900 font-medium text-xs transition-all'
            ..onInput.listen((e) {
              state.loginEmail = (e.target as InputElement).value ?? '';
              state.loginError = '';
            })
        ]
    ];

  // 2. Password input
  final passGroup = DivElement()
    ..className = 'space-y-1.5'
    ..children = [
      DivElement()
        ..className = 'flex items-center justify-between'
        ..children = [
          LabelElement()
            ..className = 'font-bold text-slate-700 block'
            ..text = isStudent
                ? 'Student Account Password'
                : isFacultyClub
                    ? 'Authorized Publisher Passphrase'
                    : 'Administrative Security Passphrase',
          SpanElement()
            ..className = 'text-[11px] text-slate-400'
            ..text = 'SSO 2FA Protected',
        ],
      DivElement()
        ..className = 'relative flex items-center'
        ..children = [
          SpanElement()
            ..className = 'absolute left-3.5 text-slate-400 text-sm select-none'
            ..text = '🔒',
          InputElement()
            ..type = state.showPassword ? 'text' : 'password'
            ..value = state.loginPassword
            ..placeholder = 'Enter password'
            ..className = 'w-full pl-10 pr-20 py-3 bg-slate-50 border border-slate-200 rounded-xl focus:outline-none focus:ring-2 ${isStudent ? "focus:ring-indigo-500 focus:border-indigo-500" : isFacultyClub ? "focus:ring-violet-500 focus:border-violet-500" : "focus:ring-amber-500 focus:border-amber-500"} text-slate-900 font-medium text-xs transition-all'
            ..onInput.listen((e) {
              state.loginPassword = (e.target as InputElement).value ?? '';
              state.loginError = '';
            }),
          ButtonElement()
            ..type = 'button'
            ..className = 'absolute right-2 px-2.5 py-1 text-[11px] font-semibold text-slate-500 hover:text-slate-800 bg-slate-200/60 hover:bg-slate-200 rounded-lg cursor-pointer transition-colors'
            ..text = state.showPassword ? '🙈 Hide' : '👁️ Show'
            ..onClick.listen((e) {
              e.preventDefault();
              state.showPassword = !state.showPassword;
              renderApp();
            })
        ]
    ];

  // 3. Remember Me & Forgot Password Row
  final optionsRow = DivElement()
    ..className = 'flex items-center justify-between pt-1 text-xs'
    ..children = [
      LabelElement()
        ..className = 'flex items-center gap-2 cursor-pointer text-slate-600 select-none'
        ..children = [
          InputElement()
            ..type = 'checkbox'
            ..checked = state.rememberMe
            ..className = 'rounded border-slate-300 text-indigo-600 focus:ring-indigo-500 cursor-pointer'
            ..onChange.listen((e) {
              state.rememberMe = (e.target as InputElement).checked ?? true;
            }),
          SpanElement()..text = 'Remember this device',
        ],
      ButtonElement()
        ..type = 'button'
        ..className = 'text-xs font-semibold ${isStudent ? "text-indigo-600 hover:text-indigo-800" : isFacultyClub ? "text-violet-700 hover:text-violet-900" : "text-amber-800 hover:text-amber-950"} hover:underline cursor-pointer'
        ..text = 'Need help signing in?'
        ..onClick.listen((e) {
          e.preventDefault();
          state.isForgotPasswordOpen = true;
          state.forgotPasswordEmail = state.loginEmail;
          state.forgotPasswordSent = false;
          renderApp();
        })
    ];

  // 4. Primary Sign In Submit Button
  final submitBtn = ButtonElement()
    ..type = 'submit'
    ..className = 'w-full py-3.5 rounded-xl font-extrabold text-sm shadow-md transition-all cursor-pointer flex items-center justify-center gap-2 ${isStudent ? "bg-indigo-600 hover:bg-indigo-700 text-white shadow-indigo-500/25 active:scale-[0.99]" : isFacultyClub ? "bg-violet-700 hover:bg-violet-800 text-white shadow-violet-600/25 active:scale-[0.99]" : "bg-slate-900 hover:bg-slate-800 text-amber-300 border border-amber-500/30 shadow-slate-900/30 active:scale-[0.99]"}'
    ..children = [
      SpanElement()
        ..text = isStudent
            ? 'Sign in to Student Campus Hub'
            : isFacultyClub
                ? (state.facultyClubSubRole == 'teacher'
                    ? 'Authenticate as Faculty Teacher (Event Poster)'
                    : 'Authenticate as Student Club Head (Event Poster)')
                : 'Authenticate to Admin Console',
      SpanElement()..className = 'text-base font-normal'..text = '→',
    ];

  form.onSubmit.listen((e) {
    e.preventDefault();
    if (state.loginEmail.trim().isEmpty) {
      state.loginError = 'Please enter your university email or ID.';
      renderApp();
      return;
    }
    if (state.loginPassword.trim().isEmpty) {
      state.loginError = 'Please enter your password.';
      renderApp();
      return;
    }

    if (state.loginRoleSelection == 'admin') {
      state.loginAsAdmin();
      showToast('Welcome, Dean Marcus Holloway (Campus Administrator)');
    } else if (state.loginRoleSelection == 'faculty_club') {
      if (state.facultyClubSubRole == 'teacher') {
        state.loginAsTeacher();
        showToast('Welcome, Prof. Sarah Martinez (Faculty Teacher - Event Publisher)');
      } else {
        state.loginAsClubHead();
        showToast('Welcome, Jordan Lee (Student Club Head - Event Publisher)');
      }
    } else {
      state.loginAsStudent();
      showToast('Welcome back, Alex Chen (EECS Junior)');
    }
    renderApp();
  });

  form..append(emailGroup)..append(passGroup)..append(optionsRow)..append(submitBtn);

  // Step E: One-Click Instant Evaluator Access (No Password Required)
  final demoBox = DivElement()
    ..className = 'pt-4 border-t border-slate-100 space-y-2.5 text-center'
    ..children = [
      DivElement()
        ..className = 'relative flex items-center justify-center'
        ..children = [
          DivElement()..className = 'absolute inset-0 flex items-center'..children = [DivElement()..className = 'w-full border-t border-slate-200'],
          SpanElement()
            ..className = 'relative px-3 bg-white text-[10px] font-bold text-slate-400 uppercase tracking-widest'
            ..text = 'ONE-CLICK INSTANT DEMO ACCESS',
        ],
      DivElement()
        ..className = 'grid grid-cols-1 sm:grid-cols-2 gap-2.5 pt-1'
        ..children = [
          // 1. Student Demo
          ButtonElement()
            ..className = 'p-3 rounded-xl border border-indigo-200 bg-indigo-50/60 hover:bg-indigo-100/80 text-left transition-colors cursor-pointer group'
            ..onClick.listen((_) {
              state.loginAsStudent();
              showToast('Logged in as Alex Chen (Student: RSVPs Only)');
              renderApp();
            })
            ..children = [
              DivElement()
                ..className = 'flex items-center justify-between'
                ..children = [
                  SpanElement()..className = 'font-bold text-xs text-indigo-900'..text = '🎓 Normal Student',
                  SpanElement()..className = 'text-[10px] font-bold text-indigo-600 group-hover:translate-x-0.5 transition-transform'..text = 'Enter →',
                ],
              SpanElement()
                ..className = 'text-[11px] text-indigo-700 block mt-0.5 truncate'
                ..text = 'Alex Chen (Junior, CS & Data Science)',
              SpanElement()
                ..className = 'text-[9px] font-semibold text-slate-500 block mt-0.5'
                ..text = 'Browsing & RSVPs (Posting Locked)',
            ],
          // 2. Teacher Demo (Special Login)
          ButtonElement()
            ..className = 'p-3 rounded-xl border border-emerald-300 bg-emerald-50/80 hover:bg-emerald-100 text-left transition-colors cursor-pointer group shadow-2xs'
            ..onClick.listen((_) {
              state.loginAsTeacher();
              showToast('Special Login: Prof. Sarah Martinez (Teacher - Authorized to Post Events)');
              renderApp();
            })
            ..children = [
              DivElement()
                ..className = 'flex items-center justify-between'
                ..children = [
                  SpanElement()..className = 'font-bold text-xs text-emerald-950 flex items-center gap-1'..children = [
                    SpanElement()..text = '👩‍🏫 Faculty Teacher',
                    SpanElement()..className = 'px-1 rounded bg-emerald-200 text-emerald-800 text-[9px] font-bold'..text = 'POSTS',
                  ],
                  SpanElement()..className = 'text-[10px] font-bold text-emerald-700 group-hover:translate-x-0.5 transition-transform'..text = 'Enter →',
                ],
              SpanElement()
                ..className = 'text-[11px] text-emerald-800 block mt-0.5 truncate font-medium'
                ..text = 'Prof. Sarah Martinez (EECS Faculty)',
              SpanElement()
                ..className = 'text-[9px] font-bold text-emerald-700 block mt-0.5'
                ..text = '✓ Special Login: Post Campus Events',
            ],
          // 3. Club Head Demo (Special Login)
          ButtonElement()
            ..className = 'p-3 rounded-xl border border-violet-300 bg-violet-50/80 hover:bg-violet-100 text-left transition-colors cursor-pointer group shadow-2xs'
            ..onClick.listen((_) {
              state.loginAsClubHead();
              showToast('Special Login: Jordan Lee (Club Head - Authorized to Post Events)');
              renderApp();
            })
            ..children = [
              DivElement()
                ..className = 'flex items-center justify-between'
                ..children = [
                  SpanElement()..className = 'font-bold text-xs text-violet-950 flex items-center gap-1'..children = [
                    SpanElement()..text = '🏆 Student Club Head',
                    SpanElement()..className = 'px-1 rounded bg-violet-200 text-violet-800 text-[9px] font-bold'..text = 'POSTS',
                  ],
                  SpanElement()..className = 'text-[10px] font-bold text-violet-700 group-hover:translate-x-0.5 transition-transform'..text = 'Enter →',
                ],
              SpanElement()
                ..className = 'text-[11px] text-violet-800 block mt-0.5 truncate font-medium'
                ..text = 'Jordan Lee (President, Mobile Guild)',
              SpanElement()
                ..className = 'text-[9px] font-bold text-violet-700 block mt-0.5'
                ..text = '✓ Special Login: Post Campus Events',
            ],
          // 4. Admin Demo (Full Upload & Governance Authority)
          ButtonElement()
            ..className = 'p-3 rounded-xl border border-amber-300 bg-amber-50/80 hover:bg-amber-100 text-left transition-colors cursor-pointer group shadow-2xs'
            ..onClick.listen((_) {
              state.loginAsAdmin();
              showToast('Logged in as Dean Holloway (Campus Administrator - Event Upload Power)');
              renderApp();
            })
            ..children = [
              DivElement()
                ..className = 'flex items-center justify-between'
                ..children = [
                  SpanElement()..className = 'font-bold text-xs text-amber-950 flex items-center gap-1'..children = [
                    SpanElement()..text = '🛡️ Campus Admin',
                    SpanElement()..className = 'px-1 rounded bg-amber-200 text-amber-900 text-[9px] font-bold'..text = 'UPLOADS',
                  ],
                  SpanElement()..className = 'text-[10px] font-bold text-amber-700 group-hover:translate-x-0.5 transition-transform'..text = 'Enter →',
                ],
              SpanElement()
                ..className = 'text-[11px] text-amber-800 block mt-0.5 truncate font-medium'
                ..text = 'Dean Holloway (Student Affairs)',
              SpanElement()
                ..className = 'text-[9px] font-bold text-amber-700 block mt-0.5'
                ..text = '✓ Admin Power: Upload & Broadcast Events',
            ],
        ]
    ];

  // Step F: Help & Institutional Footer
  final cardFooter = DivElement()
    ..className = 'pt-2 text-center text-[11px] text-slate-400 space-y-1'
    ..children = [
      ParagraphElement()
        ..text = 'CampusPulse is the official student life and academic collaboration service.',
      DivElement()
        ..className = 'flex items-center justify-center gap-3 text-slate-500'
        ..children = [
          SpanElement()..text = 'Student Privacy (FERPA)',
          SpanElement()..text = '•',
          SpanElement()..text = 'IT Status',
          SpanElement()..text = '•',
          SpanElement()..text = 'Accessibility',
        ]
    ];

  card..append(cardHeader)
      ..append(gatewaySelectorWrapper);

  if (subRoleCard != null) {
    card.append(subRoleCard);
  }

  card..append(contextBadge)
      ..append(quickFillBtn)
      ..append(form)
      ..append(demoBox)
      ..append(cardFooter);

  rightCol.append(card);

  grid..append(leftCol)..append(rightCol);
  mainContainer.append(grid);

  // 3. Bottom Minimal Brand Footer
  final bottomFooter = Element.tag('footer')
    ..className = 'relative z-20 w-full max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-4 flex flex-col sm:flex-row items-center justify-between gap-2 text-xs text-slate-400 border-t border-white/5'
    ..children = [
      SpanElement()..text = '© 2026 CampusPulse • University Campus Life & Academic Collaboration Platform',
      DivElement()
        ..className = 'flex items-center gap-4 text-[11px]'
        ..children = [
          SpanElement()..className = 'text-slate-500'..text = 'Built with pure Dart & HTML',
          SpanElement()..className = 'text-slate-500'..text = '•',
          SpanElement()..className = 'text-emerald-400 font-semibold'..text = 'Serverpod Protocol Ready',
        ]
    ];

  outer..append(bg)..append(scrim)..append(topBar)..append(mainContainer)..append(bottomFooter);

  // Overlay Forgot Password Modal if triggered
  if (state.isForgotPasswordOpen) {
    outer.append(renderForgotPasswordModal());
  }

  return outer;
}

// ==========================================
// FORGOT PASSWORD / ACCESS RECOVERY MODAL
// ==========================================

Element renderForgotPasswordModal() {
  final overlay = DivElement()
    ..className = 'fixed inset-0 z-50 bg-slate-950/80 backdrop-blur-sm flex items-center justify-center p-4';

  final modal = DivElement()
    ..className = 'bg-white text-slate-900 rounded-3xl max-w-md w-full p-6 sm:p-8 shadow-2xl border border-slate-200 space-y-5';

  final header = DivElement()
    ..className = 'space-y-1 text-center'
    ..children = [
      DivElement()
        ..className = 'w-12 h-12 rounded-2xl bg-indigo-50 text-indigo-600 font-black text-2xl mx-auto flex items-center justify-center border border-indigo-100 shadow-xs'
        ..text = '🔑',
      HeadingElement.h3()
        ..className = 'text-xl font-black text-slate-900 tracking-tight'
        ..text = 'Campus Access Recovery',
      ParagraphElement()
        ..className = 'text-xs text-slate-500'
        ..text = 'Enter your university email address to receive password recovery instructions or single-sign-on verification link.',
    ];

  final body = DivElement()..className = 'space-y-4 text-xs';

  if (state.forgotPasswordSent) {
    final successCard = DivElement()
      ..className = 'p-4 rounded-2xl bg-emerald-50 border border-emerald-200 text-emerald-900 space-y-2 text-center'
      ..children = [
        SpanElement()..className = 'text-2xl block'..text = '✉️',
        SpanElement()..className = 'font-bold block text-sm'..text = 'Recovery Link Dispatched!',
        ParagraphElement()
          ..className = 'text-xs text-emerald-800'
          ..text = 'We sent a verification link and temporary 6-digit access token to ${state.forgotPasswordEmail}. Check your university inbox and spam folder.',
      ];
    body.append(successCard);

    final doneBtn = ButtonElement()
      ..className = 'w-full py-3 bg-slate-900 hover:bg-slate-800 text-white font-bold rounded-xl text-xs cursor-pointer'
      ..text = 'Back to Sign In'
      ..onClick.listen((_) {
        state.isForgotPasswordOpen = false;
        state.forgotPasswordSent = false;
        renderApp();
      });
    body.append(doneBtn);
  } else {
    final emailInput = DivElement()
      ..className = 'space-y-1'
      ..children = [
        LabelElement()..className = 'font-bold text-slate-700 block'..text = 'Institutional University Email',
        InputElement()
          ..type = 'email'
          ..value = state.forgotPasswordEmail.isNotEmpty ? state.forgotPasswordEmail : state.loginEmail
          ..placeholder = 'name@campus.edu or staff@campus.edu'
          ..className = 'w-full p-3 bg-slate-50 border border-slate-200 rounded-xl focus:outline-none focus:ring-2 focus:ring-indigo-500 text-xs'
          ..onInput.listen((e) {
            state.forgotPasswordEmail = (e.target as InputElement).value ?? '';
          })
      ];

    final helpNotice = DivElement()
      ..className = 'p-3 rounded-xl bg-slate-50 border border-slate-200 text-slate-600 space-y-1 text-[11px]'
      ..children = [
        SpanElement()..className = 'font-bold block text-slate-800'..text = 'Campus IT Helpdesk Guidelines:',
        ParagraphElement()..text = '• Student accounts use your CalNet/Campus ID.\n• Administrative staff require institutional 2-Factor approval.\n• IT emergency phone: (510) 642-HELP.',
      ];

    final btnRow = DivElement()
      ..className = 'grid grid-cols-2 gap-3 pt-2'
      ..children = [
        ButtonElement()
          ..type = 'button'
          ..className = 'py-3 bg-slate-100 hover:bg-slate-200 text-slate-700 font-bold rounded-xl text-xs cursor-pointer transition-colors'
          ..text = 'Cancel'
          ..onClick.listen((_) {
            state.isForgotPasswordOpen = false;
            renderApp();
          }),
        ButtonElement()
          ..type = 'button'
          ..className = 'py-3 bg-indigo-600 hover:bg-indigo-700 text-white font-bold rounded-xl text-xs cursor-pointer shadow-xs transition-colors'
          ..text = 'Send Reset Link'
          ..onClick.listen((_) {
            state.forgotPasswordSent = true;
            renderApp();
          }),
      ];

    body..append(emailInput)..append(helpNotice)..append(btnRow);
  }

  modal..append(header)..append(body);
  overlay.append(modal);
  return overlay;
}

// ==========================================
// APP HEADER (WITH ROLE & SIGNOUT)
// ==========================================

Element renderHeader() {
  final header = Element.tag('header')..className = 'sticky top-0 z-40 bg-white/95 backdrop-blur-md border-b border-slate-200';
  final container = DivElement()..className = 'max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 flex items-center justify-between gap-6 h-16';

  // Zone 1: Wordmark
  final brand = ButtonElement()
    ..className = 'flex items-center gap-2.5 text-left cursor-pointer group focus:outline-none'
    ..onClick.listen((_) {
      state.activeSection = state.userRole == 'admin' ? 'admin' : state.canPostEvents ? 'events' : 'discover';
      renderApp();
    })
    ..children = [
      DivElement()
        ..className = 'w-9 h-9 rounded-xl ${state.userRole == "teacher" ? "bg-emerald-600" : state.userRole == "club_head" ? "bg-violet-600" : state.userRole == "admin" ? "bg-amber-600" : "bg-indigo-600"} flex items-center justify-center text-white font-bold text-base shadow-xs transition-colors'
        ..text = state.userRole == 'teacher'
            ? '👩‍🏫'
            : state.userRole == 'club_head'
                ? '🏆'
                : state.userRole == 'admin'
                    ? '🛡️'
                    : 'C',
      DivElement()
        ..children = [
          SpanElement()
            ..className = 'text-xl font-extrabold tracking-tight text-slate-900 block leading-tight'
            ..text = 'CampusPulse',
          SpanElement()
            ..className = 'text-[11px] text-slate-500 font-medium block'
            ..text = state.userRole == 'teacher'
                ? 'Faculty Academic & Event Portal'
                : state.userRole == 'club_head'
                    ? 'Student Club Leadership Portal'
                    : state.userRole == 'admin'
                        ? 'Administrator Console'
                        : 'Student Community Hub',
        ]
    ];

  // Zone 2: Navigation Links
  final nav = Element.tag('nav')..className = 'hidden md:flex items-center gap-6 text-sm font-medium';

  final navItems = state.userRole == 'admin'
      ? [
          {'id': 'admin', 'label': 'Admin Console'},
          {'id': 'events', 'label': 'Campus Events & Bulletin'},
          {'id': 'discover', 'label': 'Student Directory'},
        ]
      : state.canPostEvents
          ? [
              {'id': 'events', 'label': 'Campus Events & Bulletin'},
              {'id': 'discover', 'label': 'Student Directory'},
              {'id': 'chats', 'label': 'Campus Chats'},
              {'id': 'schedule', 'label': 'My Schedule'},
            ]
          : [
              {'id': 'discover', 'label': 'Find Study Buddies'},
              {'id': 'events', 'label': 'Campus Events & Feed'},
              {'id': 'chats', 'label': 'Study Chats'},
              {'id': 'schedule', 'label': 'My Study Schedule'},
            ];

  for (var item in navItems) {
    final isSelected = state.activeSection == item['id'];
    final activeColorClass = state.userRole == 'teacher'
        ? 'text-emerald-700 font-bold border-b-2 border-emerald-600'
        : state.userRole == 'club_head'
            ? 'text-violet-700 font-bold border-b-2 border-violet-600'
            : state.userRole == 'admin'
                ? 'text-amber-700 font-bold border-b-2 border-amber-600'
                : 'text-indigo-600 font-bold border-b-2 border-indigo-600';

    final btn = ButtonElement()
      ..className = 'transition-colors whitespace-nowrap pb-1 cursor-pointer font-medium ${isSelected ? activeColorClass : "text-slate-600 hover:text-slate-900"}'
      ..text = item['label']!
      ..onClick.listen((_) {
        state.activeSection = item['id']!;
        renderApp();
      });
    nav.append(btn);
  }

  // Zone 3: CTA, Profile & Sign Out
  final actions = DivElement()..className = 'flex items-center gap-2.5 shrink-0';

  // Role-enforced Event Posting Button vs Restriction Badge
  if (state.canPostEvents) {
    final postBtnColor = state.userRole == 'teacher'
        ? 'bg-emerald-600 hover:bg-emerald-700'
        : state.userRole == 'club_head'
            ? 'bg-violet-600 hover:bg-violet-700'
            : 'bg-amber-600 hover:bg-amber-700';

    final postBtnText = state.userRole == 'teacher'
        ? '+ Post Faculty Event'
        : state.userRole == 'club_head'
            ? '+ Post Club Event'
            : '+ Broadcast Notice';

    final postBtn = ButtonElement()
      ..className = 'px-3.5 py-2 $postBtnColor text-white text-xs font-bold rounded-xl flex items-center gap-1.5 shadow-xs transition-colors cursor-pointer whitespace-nowrap'
      ..text = postBtnText
      ..onClick.listen((_) {
        state.isCreateEventOpen = true;
        renderApp();
      });
    actions.append(postBtn);
  } else {
    // Normal students are strictly not allowed to post events: display informative locked button
    final restrictedBtn = ButtonElement()
      ..className = 'px-3 py-1.5 bg-slate-100 hover:bg-amber-50 text-slate-600 hover:text-amber-900 text-xs font-semibold rounded-xl flex items-center gap-1.5 border border-slate-200 hover:border-amber-300 transition-colors cursor-pointer whitespace-nowrap'
      ..children = [
        SpanElement()..text = '🔒',
        SpanElement()..text = 'Post Event (Staff Only)',
      ]
      ..title = 'Event posting is restricted to verified Teachers and Club Heads. Normal students can browse & RSVP.'
      ..onClick.listen((_) {
        showToast('🔒 Event posting restricted: Only verified Teachers and Club Heads can publish events.');
      });
    actions.append(restrictedBtn);
  }

  // Profile Button with Role Tag
  final roleChipText = state.userRole == 'teacher'
      ? 'Faculty'
      : state.userRole == 'club_head'
          ? 'Club Head'
          : state.userRole == 'admin'
              ? 'Admin'
              : 'Student';

  final roleChipColor = state.userRole == 'teacher'
      ? 'bg-emerald-100 text-emerald-800'
      : state.userRole == 'club_head'
          ? 'bg-violet-100 text-violet-800'
          : state.userRole == 'admin'
              ? 'bg-amber-100 text-amber-900'
              : 'bg-indigo-100 text-indigo-800';

  final profileBtn = ButtonElement()
    ..className = 'flex items-center gap-2 pl-1.5 pr-2.5 py-1.5 rounded-full border border-slate-200 hover:border-slate-300 hover:bg-slate-50 transition-colors cursor-pointer text-left focus:outline-none'
    ..onClick.listen((_) {
      state.isProfileOpen = true;
      renderApp();
    })
    ..children = [
      ImageElement()
        ..src = state.activeUser.avatar
        ..alt = state.activeUser.name
        ..className = 'w-7 h-7 rounded-full object-cover border border-slate-200',
      DivElement()
        ..className = 'hidden lg:flex items-center gap-1.5'
        ..children = [
          SpanElement()
            ..className = 'text-xs font-semibold text-slate-800 max-w-[90px] truncate'
            ..text = state.activeUser.name.split(' ')[0],
          SpanElement()
            ..className = 'px-1.5 py-0.5 rounded text-[9px] font-bold $roleChipColor'
            ..text = roleChipText,
        ]
    ];

  final signOutBtn = ButtonElement()
    ..className = 'px-2.5 py-1.5 text-xs text-slate-500 hover:text-red-600 hover:bg-red-50 rounded-lg transition-colors cursor-pointer font-medium'
    ..text = 'Sign Out'
    ..onClick.listen((_) {
      state.logout();
      showToast('Signed out of CampusPulse');
      renderApp();
    });

  actions..append(profileBtn)..append(signOutBtn);

  container..append(brand)..append(nav)..append(actions);
  header.append(container);
  return header;
}

// ==========================================
// ADMIN CONSOLE SECTION
// ==========================================

Element renderAdminConsoleSection() {
  final wrapper = DivElement()..className = 'space-y-8 max-w-6xl mx-auto';

  // Admin Welcome Strip
  final welcome = DivElement()
    ..className = 'bg-white rounded-3xl p-6 sm:p-8 border border-slate-200 shadow-xs flex flex-col md:flex-row md:items-center justify-between gap-6'
    ..children = [
      DivElement()
        ..className = 'space-y-1.5 max-w-xl'
        ..children = [
          DivElement()..className = 'text-xs font-bold text-amber-700 uppercase tracking-wider'..text = 'Campus Oversight & Moderation Dashboard',
          HeadingElement.h1()..className = 'text-2xl sm:text-3xl font-extrabold text-slate-900'..text = 'Campus Administrator Portal',
          ParagraphElement()..className = 'text-xs sm:text-sm text-slate-500'..text = 'Review and moderate student events, verify academic profiles, and broadcast university announcements.',
        ],
      DivElement()
        ..className = 'flex gap-3 shrink-0'
        ..children = [
          ButtonElement()
            ..className = 'px-4 py-2.5 bg-amber-600 hover:bg-amber-700 text-white text-xs font-bold rounded-xl shadow-xs cursor-pointer'
            ..text = '+ Official Notice'
            ..onClick.listen((_) {
              state.isCreateEventOpen = true;
              renderApp();
            }),
          ButtonElement()
            ..className = 'px-4 py-2.5 bg-slate-900 hover:bg-slate-800 text-white text-xs font-bold rounded-xl shadow-xs cursor-pointer'
            ..text = 'View Student Directory'
            ..onClick.listen((_) {
              state.activeSection = 'discover';
              renderApp();
            })
        ]
    ];
  wrapper.append(welcome);

  // Analytics Metric Strip
  final metrics = DivElement()..className = 'grid grid-cols-2 md:grid-cols-4 gap-4';

  final stats = [
    {'label': 'Registered Students', 'val': '1,420', 'sub': '+28 this week'},
    {'label': 'Campus Bulletin Posts', 'val': '${state.events.length}', 'sub': 'All active'},
    {'label': 'Study Groups Formed', 'val': '84', 'sub': 'Across 14 courses'},
    {'label': 'Total Event RSVPs', 'val': '${state.events.fold<int>(0, (sum, e) => sum + e.attendeesCount)}', 'sub': 'Real-time'},
  ];

  for (var s in stats) {
    metrics.append(
      DivElement()
        ..className = 'bg-white p-5 rounded-2xl border border-slate-200 shadow-2xs space-y-1 text-center sm:text-left'
        ..children = [
          SpanElement()..className = 'text-xs text-slate-500 font-medium'..text = s['label']!,
          HeadingElement.h3()..className = 'text-2xl font-black text-slate-900 tabular-nums'..text = s['val']!,
          SpanElement()..className = 'text-[11px] text-emerald-600 font-semibold'..text = s['sub']!,
        ]
    );
  }
  wrapper.append(metrics);

  // Manage Events Table
  final eventMgmt = DivElement()..className = 'bg-white rounded-3xl border border-slate-200 p-6 space-y-4 shadow-xs';
  eventMgmt.append(
    DivElement()
      ..className = 'flex items-center justify-between pb-3 border-b border-slate-100'
      ..children = [
        DivElement()..children = [
          HeadingElement.h2()..className = 'text-base font-bold text-slate-900'..text = 'Manage Campus Bulletin & Study Events',
          ParagraphElement()..className = 'text-xs text-slate-500'..text = 'Feature quality events or remove reported listings',
        ],
        SpanElement()..className = 'text-xs text-slate-400'..text = '${state.events.length} listings'
      ]
  );

  final eventList = DivElement()..className = 'divide-y divide-slate-100';
  for (var evt in state.events) {
    final row = DivElement()
      ..className = 'py-3.5 flex flex-col sm:flex-row sm:items-center justify-between gap-3'
      ..children = [
        DivElement()
          ..className = 'space-y-1'
          ..children = [
            DivElement()
              ..className = 'flex items-center gap-2'
              ..children = [
                HeadingElement.h4()..className = 'text-sm font-bold text-slate-900'..text = evt.title,
                if (evt.isFeatured)
                  SpanElement()..className = 'text-[10px] bg-amber-100 text-amber-800 font-bold px-2 py-0.5 rounded'..text = 'Featured',
              ],
            ParagraphElement()..className = 'text-xs text-slate-500'..text = 'Organizer: ${evt.organizer} (${evt.organizerRole}) · ${evt.dateStr} · ${evt.attendeesCount} attendees',
          ],
        DivElement()
          ..className = 'flex items-center gap-2 shrink-0'
          ..children = [
            ButtonElement()
              ..className = 'px-3 py-1.5 text-xs font-semibold rounded-lg border border-slate-200 hover:bg-slate-50 transition-colors cursor-pointer'
              ..text = evt.isFeatured ? 'Unfeature' : '⭐ Feature'
              ..onClick.listen((_) {
                evt.isFeatured = !evt.isFeatured;
                showToast(evt.isFeatured ? 'Event marked as Featured' : 'Removed from Featured');
                renderApp();
              }),
            ButtonElement()
              ..className = 'px-3 py-1.5 text-xs font-semibold text-red-600 hover:bg-red-50 rounded-lg transition-colors cursor-pointer'
              ..text = 'Delete'
              ..onClick.listen((_) {
                state.events.removeWhere((e) => e.id == evt.id);
                showToast('Event removed by Administrator');
                renderApp();
              }),
          ]
      ];
    eventList.append(row);
  }

  eventMgmt.append(eventList);
  wrapper.append(eventMgmt);

  return wrapper;
}

// ==========================================
// DISCOVER SECTION
// ==========================================

Element renderDiscoverSection() {
  final wrapper = DivElement()..className = 'space-y-8';

  // Hero Banner
  final hero = DivElement()..className = 'relative rounded-3xl overflow-hidden border border-slate-200 shadow-xs bg-slate-900 min-h-[280px] sm:min-h-[320px] flex items-center';
  
  final heroImg = ImageElement()
    ..src = './assets/images/campus_quad_banner_1792864909368.jpg'
    ..className = 'absolute inset-0 w-full h-full object-cover opacity-50';

  final scrim = DivElement()..className = 'absolute inset-0 bg-gradient-to-r from-slate-950 via-slate-950/80 to-transparent';

  final heroContent = DivElement()..className = 'relative z-10 p-6 sm:p-10 max-w-2xl space-y-3';
  
  final tag = DivElement()
    ..className = 'inline-flex items-center gap-1.5 px-3 py-1 rounded-full bg-indigo-500/20 text-indigo-300 text-xs font-semibold backdrop-blur-md'
    ..text = '★ Campus Life Upgraded · Fall 2026';

  final title = HeadingElement.h1()
    ..className = 'text-2xl sm:text-4xl font-extrabold text-white tracking-tight leading-tight'
    ..text = 'Find your study crew. Ace your classes together.';

  final subtitle = ParagraphElement()
    ..className = 'text-xs sm:text-sm text-slate-200 leading-relaxed max-w-lg'
    ..text = 'Connect with classmates taking your exact courses, form hackathon teams, and reserve library study tables.';

  // Search input
  final searchContainer = DivElement()..className = 'pt-2 max-w-xl space-y-2';
  final searchInput = InputElement()
    ..type = 'text'
    ..placeholder = 'Search by course (e.g. CS 189), major, or study style...'
    ..value = state.searchQuery
    ..className = 'w-full px-4 py-2.5 text-xs sm:text-sm bg-white text-slate-900 rounded-xl border border-white/20 shadow-md focus:outline-none'
    ..onInput.listen((e) {
      state.searchQuery = (e.target as InputElement).value ?? '';
      state.cardIndex = 0;
      renderApp();
    });

  // Quick tags
  final quickTagsRow = DivElement()..className = 'flex items-center gap-2 overflow-x-auto scrollbar-none text-xs';
  final quickLabel = SpanElement()..className = 'text-slate-300 text-[11px] shrink-0'..text = 'Popular courses:';
  quickTagsRow.append(quickLabel);

  for (var c in ['CS 189', 'CS 162', 'MATH 53', 'DATA 100', 'Hackathon Team']) {
    final qBtn = ButtonElement()
      ..className = 'px-2 py-0.5 bg-white/10 hover:bg-white/20 text-white rounded text-[11px] cursor-pointer'
      ..text = c
      ..onClick.listen((_) {
        state.searchQuery = c;
        state.cardIndex = 0;
        renderApp();
      });
    quickTagsRow.append(qBtn);
  }

  searchContainer..append(searchInput)..append(quickTagsRow);
  heroContent..append(tag)..append(title)..append(subtitle)..append(searchContainer);
  hero..append(heroImg)..append(scrim)..append(heroContent);
  wrapper.append(hero);

  // Filter Categories bar
  final filterBar = DivElement()..className = 'bg-white p-4 rounded-2xl border border-slate-200 shadow-2xs flex items-center justify-between gap-4 flex-wrap';
  final cats = ['All', 'Study Buddy', 'Hackathon Team', 'Project Collaborator', 'Exam Prep'];

  final catButtons = DivElement()..className = 'flex items-center gap-1.5 overflow-x-auto scrollbar-none';
  for (var cat in cats) {
    final isSelected = state.selectedCategory == cat;
    final btn = ButtonElement()
      ..className = 'px-3 py-1.5 rounded-lg text-xs font-semibold whitespace-nowrap cursor-pointer transition-colors ${isSelected ? 'bg-slate-900 text-white shadow-xs' : 'bg-slate-100 text-slate-700 hover:bg-slate-200'}'
      ..text = cat
      ..onClick.listen((_) {
        state.selectedCategory = cat;
        state.cardIndex = 0;
        renderApp();
      });
    catButtons.append(btn);
  }

  filterBar.append(catButtons);
  wrapper.append(filterBar);

  // Filter candidates
  final filtered = state.students.where((s) {
    if (state.selectedCategory != 'All' && s.lookingFor != state.selectedCategory) return false;
    if (state.searchQuery.trim().isNotEmpty) {
      final q = state.searchQuery.toLowerCase();
      final hasCourse = s.courses.any((c) => c.toLowerCase().contains(q));
      final hasMajor = s.major.toLowerCase().contains(q);
      final hasName = s.name.toLowerCase().contains(q);
      if (!hasCourse && !hasMajor && !hasName) return false;
    }
    return true;
  }).toList();

  if (filtered.isEmpty) {
    final empty = DivElement()
      ..className = 'bg-white rounded-3xl p-12 text-center border border-slate-200 space-y-2'
      ..children = [
        HeadingElement.h3()..className = 'text-base font-bold text-slate-800'..text = 'No student profiles matched your query',
        ParagraphElement()..className = 'text-xs text-slate-500'..text = 'Try selecting "All" categories or clearing your course query.',
        ButtonElement()
          ..className = 'mt-2 px-4 py-2 bg-slate-900 text-white text-xs font-semibold rounded-xl cursor-pointer'
          ..text = 'Reset Filters'
          ..onClick.listen((_) {
            state.selectedCategory = 'All';
            state.searchQuery = '';
            renderApp();
          })
      ];
    wrapper.append(empty);
    return wrapper;
  }

  final current = filtered[state.cardIndex % filtered.length];

  // Featured Student Card
  final card = DivElement()..className = 'max-w-2xl mx-auto bg-white rounded-3xl border border-slate-200 shadow-sm overflow-hidden';
  
  // Header strip
  final cardHeader = DivElement()
    ..className = 'px-6 py-4 bg-gradient-to-r from-slate-900 to-indigo-950 text-white flex items-center justify-between'
    ..children = [
      SpanElement()..className = 'text-xs font-semibold text-amber-300 uppercase tracking-wider'..text = '${current.lookingFor} · ${current.semester}',
      DivElement()
        ..className = 'bg-white/10 backdrop-blur-md px-3 py-1 rounded-full text-xs font-semibold text-emerald-400'
        ..text = '★ ${current.compatScore}% Match Score',
    ];

  final cardBody = DivElement()..className = 'p-6 sm:p-8 space-y-6';

  // Identity
  final identity = DivElement()
    ..className = 'flex items-center gap-4'
    ..children = [
      ImageElement()
        ..src = current.avatar
        ..alt = current.name
        ..className = 'w-16 h-16 rounded-2xl object-cover border border-slate-200 shadow-xs',
      DivElement()
        ..children = [
          HeadingElement.h2()..className = 'text-xl sm:text-2xl font-bold text-slate-900'..text = current.name,
          ParagraphElement()..className = 'text-xs sm:text-sm text-slate-600 font-medium'..text = current.major,
          SpanElement()..className = 'text-xs text-slate-400'..text = '${current.department} · ${current.year}',
        ]
    ];

  // Bio
  final bioBox = DivElement()
    ..className = 'bg-slate-50 p-4 rounded-xl border border-slate-100 text-xs sm:text-sm text-slate-700 leading-relaxed'
    ..text = '"${current.bio}"';

  // Match reasons
  final matchBox = DivElement()..className = 'space-y-2';
  matchBox.append(HeadingElement.h4()..className = 'text-xs font-semibold text-slate-500 uppercase tracking-wider'..text = 'Why You Two Are a Great Study Match');

  final matchGrid = DivElement()..className = 'grid grid-cols-1 sm:grid-cols-2 gap-2';
  for (var r in current.matchReasons) {
    matchGrid.append(
      DivElement()
        ..className = 'flex items-center gap-2 text-xs text-indigo-900 bg-indigo-50/70 border border-indigo-100 px-3 py-2 rounded-lg'
        ..children = [
          SpanElement()..className = 'text-indigo-600 font-bold'..text = '✓',
          SpanElement()..className = 'truncate'..text = r,
        ]
    );
  }
  matchBox.append(matchGrid);

  // Courses
  final coursesBox = DivElement()..className = 'space-y-2';
  coursesBox.append(HeadingElement.h4()..className = 'text-xs font-semibold text-slate-500 uppercase tracking-wider'..text = 'Current Semester Courses');

  final coursesWrap = DivElement()..className = 'flex flex-wrap gap-2';
  for (var crs in current.courses) {
    final isShared = state.currentUser.courses.contains(crs);
    coursesWrap.append(
      SpanElement()
        ..className = 'text-xs px-2.5 py-1 rounded-md font-medium ${isShared ? 'bg-indigo-600 text-white font-semibold' : 'bg-slate-100 text-slate-700'}'
        ..text = '$crs ${isShared ? "✓ Shared" : ""}'
    );
  }
  coursesBox.append(coursesWrap);

  // Action buttons
  final actionsRow = DivElement()..className = 'pt-4 border-t border-slate-100 flex items-center gap-3';
  
  final passBtn = ButtonElement()
    ..className = 'flex-1 py-3 rounded-xl border border-slate-200 hover:bg-slate-50 text-slate-700 text-xs font-semibold cursor-pointer transition-colors'
    ..text = '✕ Pass'
    ..onClick.listen((_) {
      state.cardIndex = (state.cardIndex + 1) % filtered.length;
      showToast('Passed candidate. Next student loaded.');
      renderApp();
    });

  final connectBtn = ButtonElement()
    ..className = 'flex-1 py-3 rounded-xl bg-indigo-600 hover:bg-indigo-700 text-white text-xs font-semibold cursor-pointer shadow-xs transition-colors'
    ..text = '♥ Connect & Study'
    ..onClick.listen((_) {
      state.connectModalStudent = current;
      state.connectNote = 'Hey ${current.name.split(" ")[0]}! Saw we are both taking ${current.courses[0]} - want to study together?';
      renderApp();
    });

  actionsRow..append(passBtn)..append(connectBtn);

  cardBody..append(identity)..append(bioBox)..append(matchBox)..append(coursesBox)..append(actionsRow);
  card..append(cardHeader)..append(cardBody);
  wrapper.append(card);

  return wrapper;
}

// ==========================================
// EVENTS SECTION
// ==========================================

// ==========================================
// RESPONSIVE EVENT CARD COMPONENT & EVENTS SECTION
// ==========================================

/// Responsive 'Event Card' Component in Dart
/// Displays event details: title, date, location, organizer, tags, capacity,
/// and an interactive 'Registration' button with rich hover transitions and feedback.
Element renderEventCard(CampusEvent evt) {
  final card = DivElement()
    ..className = 'group relative bg-white rounded-3xl border border-slate-200 hover:border-indigo-300 shadow-xs hover:shadow-xl transition-all duration-300 flex flex-col justify-between overflow-hidden hover:-translate-y-1.5';

  // 1. Media Header with Badges & Date Ribbon
  final mediaWrapper = DivElement()
    ..className = 'relative h-48 sm:h-52 w-full overflow-hidden bg-slate-900 select-none';

  final img = ImageElement()
    ..src = evt.imageUrl
    ..alt = evt.title
    ..className = 'w-full h-full object-cover group-hover:scale-108 transition-transform duration-500 ease-out opacity-90';

  final scrim = DivElement()
    ..className = 'absolute inset-0 bg-gradient-to-t from-slate-950/80 via-transparent to-slate-950/40 pointer-events-none';

  // Top-left Badges (Category + Featured/Official)
  final topLeftBadges = DivElement()
    ..className = 'absolute top-3 left-3 flex flex-wrap items-center gap-1.5 z-10';

  // Category badge with dynamic color palette
  final catBadge = SpanElement()
    ..className = 'px-2.5 py-1 rounded-full text-[11px] font-bold backdrop-blur-md shadow-xs ${evt.category == "Hackathon" ? "bg-amber-500/90 text-slate-950" : evt.category == "Study Sesh" ? "bg-indigo-600/90 text-white" : evt.category == "Workshop" ? "bg-cyan-600/90 text-white" : "bg-emerald-600/90 text-white"}'
    ..text = evt.category;
  topLeftBadges.append(catBadge);

  if (evt.isFeatured) {
    final featBadge = SpanElement()
      ..className = 'px-2 py-1 rounded-full text-[10px] font-extrabold bg-amber-400 text-slate-950 shadow-xs backdrop-blur-md flex items-center gap-1'
      ..text = '⭐ FEATURED';
    topLeftBadges.append(featBadge);
  }

  if (evt.isOfficial) {
    final offBadge = SpanElement()
      ..className = 'px-2 py-1 rounded-full text-[10px] font-extrabold bg-slate-900/90 text-amber-300 border border-amber-400/30 shadow-xs backdrop-blur-md'
      ..text = '🛡️ OFFICIAL';
    topLeftBadges.append(offBadge);
  }

  // Top-right Registration status pill
  final statusPill = DivElement()
    ..className = 'absolute top-3 right-3 z-10';
  if (evt.isRsvpd) {
    statusPill.append(
      SpanElement()
        ..className = 'px-2.5 py-1 rounded-full text-[11px] font-bold bg-emerald-500 text-white shadow-md flex items-center gap-1.5 backdrop-blur-md'
        ..children = [
          SpanElement()..className = 'w-1.5 h-1.5 rounded-full bg-white animate-pulse',
          SpanElement()..text = 'Spot Reserved',
        ]
    );
  } else {
    final spotsLeft = (evt.maxCapacity ?? 100) - evt.attendeesCount;
    statusPill.append(
      SpanElement()
        ..className = 'px-2.5 py-1 rounded-full text-[10px] font-bold bg-slate-900/80 text-slate-200 border border-white/20 backdrop-blur-md'
        ..text = spotsLeft > 0 ? '$spotsLeft Spots Open' : 'Waitlist Only'
    );
  }

  // Bottom-left Date Overlay Ribbon
  final dateRibbon = DivElement()
    ..className = 'absolute bottom-3 left-3 z-10 flex items-center gap-2 bg-slate-950/80 backdrop-blur-md px-3 py-1 rounded-full border border-white/15 text-white text-xs font-semibold'
    ..children = [
      SpanElement()..text = '📅',
      SpanElement()..text = evt.dateStr.split("–")[0].trim(),
    ];

  mediaWrapper..append(img)..append(scrim)..append(topLeftBadges)..append(statusPill)..append(dateRibbon);

  // 2. Card Content Body
  final body = DivElement()
    ..className = 'p-5 sm:p-6 space-y-4 flex-1 flex flex-col justify-between';

  final mainDetails = DivElement()..className = 'space-y-3';

  // Organizer info with verified badges for Teachers and Club Heads
  final isFacultyOrg = evt.organizerRole.contains('Faculty') || evt.organizerRole.contains('Professor') || evt.organizerRole.contains('Lead');
  final isClubOrg = evt.organizerRole.contains('Club') || evt.organizerRole.contains('President') || evt.organizerRole.contains('Guild');
  final isAdminOrg = evt.isOfficial || evt.organizerRole.contains('Official') || evt.organizerRole.contains('Administration');

  final organizerRow = DivElement()
    ..className = 'flex items-center justify-between text-xs text-slate-500'
    ..children = [
      DivElement()
        ..className = 'flex items-center gap-1.5 truncate max-w-[65%]'
        ..children = [
          SpanElement()..className = 'text-slate-400'..text = 'Posted by',
          SpanElement()..className = 'font-bold text-slate-800 truncate'..text = evt.organizer,
        ],
      if (isFacultyOrg)
        SpanElement()
          ..className = 'px-2 py-0.5 rounded-full text-[10px] font-extrabold bg-emerald-100 text-emerald-800 flex items-center gap-1 shrink-0 shadow-2xs'
          ..text = '👩‍🏫 Verified Faculty'
      else if (isClubOrg)
        SpanElement()
          ..className = 'px-2 py-0.5 rounded-full text-[10px] font-extrabold bg-violet-100 text-violet-800 flex items-center gap-1 shrink-0 shadow-2xs'
          ..text = '🏆 Verified Club Head'
      else if (isAdminOrg)
        SpanElement()
          ..className = 'px-2 py-0.5 rounded-full text-[10px] font-extrabold bg-amber-100 text-amber-900 flex items-center gap-1 shrink-0 shadow-2xs'
          ..text = '🛡️ University Official'
      else
        SpanElement()
          ..className = 'text-[10px] font-semibold text-slate-400 shrink-0'
          ..text = evt.organizerRole,
    ];

  // Event Title
  final titleEl = HeadingElement.h3()
    ..className = 'text-lg sm:text-xl font-black text-slate-900 group-hover:text-indigo-600 transition-colors leading-snug tracking-tight'
    ..text = evt.title;

  // Date & Time Row
  final dateTimeRow = DivElement()
    ..className = 'flex items-start gap-2.5 text-xs text-slate-700 bg-slate-50 p-2.5 rounded-xl border border-slate-100'
    ..children = [
      SpanElement()..className = 'text-sm select-none'..text = '🕒',
      DivElement()
        ..children = [
          SpanElement()..className = 'font-bold text-slate-900 block'..text = evt.dateStr,
          SpanElement()..className = 'text-[11px] text-slate-500'..text = 'Calendar synced with Fall 2026 semester',
        ]
    ];

  // Location Row
  final locationRow = DivElement()
    ..className = 'flex items-start gap-2.5 text-xs text-slate-700'
    ..children = [
      SpanElement()..className = 'text-sm select-none shrink-0'..text = '📍',
      DivElement()
        ..className = 'flex-1 leading-snug'
        ..children = [
          SpanElement()..className = 'font-bold text-slate-900 block'..text = evt.location,
          if (evt.room != null)
            SpanElement()
              ..className = 'text-[11px] text-indigo-700 font-semibold block'
              ..text = 'Designated Area: ${evt.room!}',
        ],
      ButtonElement()
        ..type = 'button'
        ..className = 'text-[11px] text-indigo-600 hover:text-indigo-800 font-semibold cursor-pointer underline hover:no-underline shrink-0'
        ..text = 'Map'
        ..onClick.listen((e) {
          e.stopPropagation();
          showToast('Campus Venue: ${evt.location} (${evt.room ?? "Main Entrance"})');
        })
    ];

  // Description
  final descEl = ParagraphElement()
    ..className = 'text-xs text-slate-600 leading-relaxed line-clamp-2'
    ..text = evt.description;

  // Tags row
  final tagsRow = DivElement()..className = 'flex flex-wrap gap-1.5 pt-1';
  for (var t in evt.tags) {
    tagsRow.append(
      SpanElement()
        ..className = 'px-2 py-0.5 rounded-md text-[10px] font-semibold bg-slate-100 text-slate-600 hover:bg-slate-200 transition-colors'
        ..text = '#$t'
    );
  }

  mainDetails..append(organizerRow)..append(titleEl)..append(dateTimeRow)..append(locationRow)..append(descEl)..append(tagsRow);

  // Capacity & Progress Bar
  final capacityBox = DivElement()..className = 'space-y-1.5 pt-2 border-t border-slate-100';
  final capacityRatio = evt.maxCapacity != null ? (evt.attendeesCount / evt.maxCapacity!).clamp(0.0, 1.0) : 0.6;
  final capacityPercent = (capacityRatio * 100).toInt();

  final capHeader = DivElement()
    ..className = 'flex items-center justify-between text-xs'
    ..children = [
      SpanElement()
        ..className = 'font-semibold text-slate-700'
        ..text = '${evt.attendeesCount} Registered ${evt.maxCapacity != null ? "of " + evt.maxCapacity.toString() + " max" : ""}',
      SpanElement()
        ..className = 'font-bold text-[11px] ${capacityPercent >= 85 ? "text-amber-700" : "text-slate-500"}'
        ..text = '$capacityPercent% Full',
    ];

  final progressBar = DivElement()
    ..className = 'w-full bg-slate-100 rounded-full h-1.5 overflow-hidden'
    ..children = [
      DivElement()
        ..className = 'h-full transition-all duration-500 rounded-full ${capacityPercent >= 90 ? "bg-rose-500" : capacityPercent >= 75 ? "bg-amber-500" : "bg-gradient-to-r from-indigo-500 to-emerald-500"}'
        ..style.width = '$capacityPercent%'
    ];

  capacityBox..append(capHeader)..append(progressBar);

  body..append(mainDetails)..append(capacityBox);

  // 3. Card Footer with 'Registration' Button & Hover Effects
  final footer = DivElement()
    ..className = 'p-5 pt-3.5 border-t border-slate-100 flex items-center justify-between gap-3 bg-slate-50/70';

  // Left status or RSVP badge
  final statusInfo = DivElement()
    ..className = 'text-xs text-slate-500'
    ..children = [
      SpanElement()
        ..className = 'font-bold text-slate-800 block text-xs'
        ..text = evt.isRsvpd ? '✓ Registered' : 'Open Registration',
      SpanElement()
        ..className = 'text-[11px] text-slate-400 block'
        ..text = evt.isRsvpd ? 'Ticket in calendar' : 'Instant admission',
    ];

  // Actions group
  final actionsGroup = DivElement()..className = 'flex items-center gap-2';

  // Share / Save Icon Button
  final shareBtn = ButtonElement()
    ..type = 'button'
    ..className = 'w-9 h-9 rounded-xl border border-slate-200 hover:border-slate-300 hover:bg-white text-slate-500 hover:text-slate-800 flex items-center justify-center text-sm transition-all cursor-pointer shadow-2xs hover:scale-105'
    ..title = 'Share event or add to calendar'
    ..text = '🔗'
    ..onClick.listen((e) {
      e.stopPropagation();
      showToast('Event link copied & added to your calendar!');
    });

  // Dedicated 'Registration' Button with Hover Effects
  final regBtn = ButtonElement()
    ..type = 'button'
    ..className = evt.isRsvpd
        ? 'group/btn relative px-4 py-2.5 rounded-xl font-bold text-xs text-white bg-emerald-600 hover:bg-rose-600 shadow-sm hover:shadow-rose-500/20 transition-all duration-200 cursor-pointer flex items-center gap-1.5 hover:scale-[1.02] active:scale-[0.98]'
        : 'group/btn relative px-4 py-2.5 rounded-xl font-extrabold text-xs text-white bg-slate-900 hover:bg-gradient-to-r hover:from-indigo-600 hover:to-violet-600 shadow-sm hover:shadow-lg hover:shadow-indigo-500/25 transition-all duration-200 cursor-pointer flex items-center gap-1.5 hover:scale-[1.02] active:scale-[0.98]';

  final regBtnLabel = SpanElement()
    ..text = evt.isRsvpd ? '✓ Registered' : 'Registration';

  final regBtnIcon = SpanElement()
    ..className = 'transition-transform duration-200 group-hover/btn:translate-x-1'
    ..text = evt.isRsvpd ? '' : '→';

  // Interactive dynamic hover text toggle for registered events
  if (evt.isRsvpd) {
    regBtn.onMouseEnter.listen((_) {
      regBtnLabel.text = '✕ Cancel Registration';
    });
    regBtn.onMouseLeave.listen((_) {
      regBtnLabel.text = '✓ Registered';
    });
  }

  regBtn.onClick.listen((e) {
    e.stopPropagation();
    evt.isRsvpd = !evt.isRsvpd;
    evt.attendeesCount += evt.isRsvpd ? 1 : -1;
    if (evt.isRsvpd) {
      showToast('Registration Confirmed for "${evt.title}"!');
    } else {
      showToast('Registration Cancelled for "${evt.title}".');
    }
    renderApp();
  });

  regBtn..append(regBtnLabel)..append(regBtnIcon);

  actionsGroup..append(shareBtn)..append(regBtn);
  footer..append(statusInfo)..append(actionsGroup);

  card..append(mediaWrapper)..append(body)..append(footer);
  return card;
}

/// Events Section featuring Category Filters, Search, and the Responsive Event Card Grid
Element renderEventsSection() {
  final wrapper = DivElement()..className = 'space-y-8 max-w-7xl mx-auto';

  // 1. Section Header & Actions
  final header = DivElement()
    ..className = 'flex flex-col md:flex-row md:items-center justify-between gap-4 pb-2 border-b border-slate-200/80';

  final headerText = DivElement()
    ..className = 'space-y-1'
    ..children = [
      DivElement()
        ..className = 'flex items-center gap-2'
        ..children = [
          SpanElement()..className = 'text-xs font-bold uppercase tracking-wider text-indigo-600'..text = 'Campus Life Upgraded',
          SpanElement()..className = 'w-1.5 h-1.5 rounded-full bg-slate-300',
          SpanElement()..className = 'text-xs text-slate-500 font-semibold'..text = '${state.events.length} Events Scheduled',
        ],
      HeadingElement.h2()
        ..className = 'text-2xl sm:text-3xl font-black text-slate-900 tracking-tight'
        ..text = 'Campus Events & Bulletin Board',
      ParagraphElement()
        ..className = 'text-xs sm:text-sm text-slate-500 max-w-2xl'
        ..text = 'Discover upcoming study jams, competitive hackathons, department clinics, and social meetups across campus.',
    ];

  final headerActions = DivElement()
    ..className = 'flex flex-wrap items-center gap-2.5 shrink-0';

  if (state.canPostEvents) {
    final btnBg = state.userRole == 'teacher'
        ? 'bg-emerald-600 hover:bg-emerald-700'
        : state.userRole == 'club_head'
            ? 'bg-violet-600 hover:bg-violet-700'
            : 'bg-amber-600 hover:bg-amber-700';

    final btnText = state.userRole == 'teacher'
        ? '+ Post Faculty Event'
        : state.userRole == 'club_head'
            ? '+ Post Club Event'
            : '+ Broadcast Notice';

    final postBtn = ButtonElement()
      ..className = 'px-4 py-2.5 $btnBg text-white text-xs font-bold rounded-xl cursor-pointer shadow-xs hover:shadow-md transition-all flex items-center gap-2'
      ..children = [
        SpanElement()..text = state.userRole == 'teacher' ? '👩‍🏫' : state.userRole == 'club_head' ? '🏆' : '🛡️',
        SpanElement()..text = btnText,
      ]
      ..onClick.listen((_) {
        state.isCreateEventOpen = true;
        renderApp();
      });
    headerActions.append(postBtn);
  } else {
    // Normal students cannot post events: show restriction chip with quick switch
    final restrictedChip = DivElement()
      ..className = 'px-3 py-2 bg-amber-50 border border-amber-200/80 rounded-xl flex items-center gap-2 text-xs text-amber-900 shadow-2xs'
      ..children = [
        SpanElement()..className = 'text-sm'..text = '🔒',
        DivElement()
          ..children = [
            SpanElement()..className = 'font-bold block text-[11px]'..text = 'Event Posting Restricted',
            SpanElement()..className = 'text-[10px] text-amber-800'..text = 'Teachers & Club Heads only',
          ],
        ButtonElement()
          ..className = 'ml-1 px-2 py-1 bg-emerald-600 hover:bg-emerald-700 text-white text-[10px] font-bold rounded-lg cursor-pointer transition-colors whitespace-nowrap'
          ..text = '👩‍🏫 As Teacher'
          ..onClick.listen((_) {
            state.loginAsTeacher();
            showToast('Switched to Prof. Sarah Martinez (Teacher mode)');
            renderApp();
          }),
        ButtonElement()
          ..className = 'px-2 py-1 bg-violet-600 hover:bg-violet-700 text-white text-[10px] font-bold rounded-lg cursor-pointer transition-colors whitespace-nowrap'
          ..text = '🏆 As Club Head'
          ..onClick.listen((_) {
            state.loginAsClubHead();
            showToast('Switched to Jordan Lee (Club Head mode)');
            renderApp();
          }),
      ];
    headerActions.append(restrictedChip);
  }

  header..append(headerText)..append(headerActions);
  wrapper.append(header);

  // Policy & Clearance Banner
  if (!state.canPostEvents) {
    final policyBanner = DivElement()
      ..className = 'p-4 rounded-2xl bg-slate-900 text-white flex flex-col md:flex-row md:items-center justify-between gap-4 border border-slate-800 shadow-sm'
      ..children = [
        DivElement()
          ..className = 'flex items-start gap-3.5'
          ..children = [
            DivElement()
              ..className = 'w-10 h-10 rounded-xl bg-amber-400/20 text-amber-300 flex items-center justify-center font-bold text-lg shrink-0 border border-amber-400/30'
              ..text = '🔒',
            DivElement()
              ..className = 'space-y-0.5'
              ..children = [
                DivElement()
                  ..className = 'flex items-center gap-2'
                  ..children = [
                    SpanElement()..className = 'font-bold text-sm text-white'..text = 'Event Creation Policy: Faculty & Club Heads Only',
                    SpanElement()..className = 'px-2 py-0.5 rounded text-[10px] font-extrabold bg-amber-400/20 text-amber-300 border border-amber-400/30'..text = 'FERPA ENFORCED',
                  ],
                ParagraphElement()
                  ..className = 'text-xs text-slate-300 leading-relaxed max-w-2xl'
                  ..text = 'Normal students are not allowed to post campus events to keep the bulletin reliable and spam-free. You have full access to explore, filter, and register for any event below. To test event publishing, switch to an authorized role:',
              ]
          ],
        DivElement()
          ..className = 'flex items-center gap-2 shrink-0'
          ..children = [
            ButtonElement()
              ..className = 'px-3 py-2 bg-emerald-600 hover:bg-emerald-500 text-white rounded-xl text-xs font-bold cursor-pointer transition-colors flex items-center gap-1.5 shadow-xs'
              ..children = [
                SpanElement()..text = '👩‍🏫',
                SpanElement()..text = 'Login as Teacher',
              ]
              ..onClick.listen((_) {
                state.loginAsTeacher();
                showToast('Switched to Prof. Sarah Martinez (Authorized Faculty Teacher)');
                renderApp();
              }),
            ButtonElement()
              ..className = 'px-3 py-2 bg-violet-600 hover:bg-violet-500 text-white rounded-xl text-xs font-bold cursor-pointer transition-colors flex items-center gap-1.5 shadow-xs'
              ..children = [
                SpanElement()..text = '🏆',
                SpanElement()..text = 'Login as Club Head',
              ]
              ..onClick.listen((_) {
                state.loginAsClubHead();
                showToast('Switched to Jordan Lee (Authorized Student Club Head)');
                renderApp();
              }),
          ]
      ];
    wrapper.append(policyBanner);
  } else if (state.userRole == 'teacher') {
    final teacherClearanceBanner = DivElement()
      ..className = 'p-3.5 rounded-2xl bg-emerald-50 border border-emerald-200/90 flex flex-col sm:flex-row sm:items-center justify-between gap-3 text-xs shadow-2xs'
      ..children = [
        DivElement()
          ..className = 'flex items-center gap-3'
          ..children = [
            DivElement()..className = 'w-9 h-9 rounded-xl bg-emerald-600 text-white flex items-center justify-center font-bold text-base shrink-0 shadow-xs'..text = '👩‍🏫',
            DivElement()
              ..children = [
                SpanElement()..className = 'font-extrabold text-emerald-950 block text-xs'..text = 'Verified Faculty Publishing Authority: Prof. Sarah Martinez (EECS)',
                SpanElement()..className = 'text-emerald-800 text-[11px]'..text = 'Authorized to publish department clinics, exam review jams, guest lectures, and research seminars.',
              ]
          ],
        ButtonElement()
          ..className = 'px-3.5 py-1.5 bg-emerald-600 hover:bg-emerald-700 text-white text-xs font-bold rounded-xl cursor-pointer shadow-xs transition-colors shrink-0'
          ..text = '+ Publish Faculty Event'
          ..onClick.listen((_) {
            state.isCreateEventOpen = true;
            renderApp();
          })
      ];
    wrapper.append(teacherClearanceBanner);
  } else if (state.userRole == 'club_head') {
    final clubClearanceBanner = DivElement()
      ..className = 'p-3.5 rounded-2xl bg-violet-50 border border-violet-200/90 flex flex-col sm:flex-row sm:items-center justify-between gap-3 text-xs shadow-2xs'
      ..children = [
        DivElement()
          ..className = 'flex items-center gap-3'
          ..children = [
            DivElement()..className = 'w-9 h-9 rounded-xl bg-violet-600 text-white flex items-center justify-center font-bold text-base shrink-0 shadow-xs'..text = '🏆',
            DivElement()
              ..children = [
                SpanElement()..className = 'font-extrabold text-violet-950 block text-xs'..text = 'Verified Club Head Publishing Authority: Jordan Lee (President, Mobile Guild)',
                SpanElement()..className = 'text-violet-800 text-[11px]'..text = 'Authorized to publish competitive hackathons, general body meetings, workshops, and student socials.',
              ]
          ],
        ButtonElement()
          ..className = 'px-3.5 py-1.5 bg-violet-600 hover:bg-violet-700 text-white text-xs font-bold rounded-xl cursor-pointer shadow-xs transition-colors shrink-0'
          ..text = '+ Publish Club Event'
          ..onClick.listen((_) {
            state.isCreateEventOpen = true;
            renderApp();
          })
      ];
    wrapper.append(clubClearanceBanner);
  }

  // 2. Search & Category Filters Bar
  final controlsBar = DivElement()
    ..className = 'bg-white rounded-2xl p-4 border border-slate-200/90 shadow-2xs space-y-3';

  // Search input
  final searchInput = InputElement()
    ..type = 'text'
    ..value = state.eventSearchQuery
    ..placeholder = 'Search events by title, course (e.g. CS 189), location, or keyword...'
    ..className = 'w-full px-4 py-2.5 bg-slate-50 border border-slate-200 rounded-xl text-xs sm:text-sm focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:bg-white transition-all text-slate-800'
    ..onInput.listen((e) {
      state.eventSearchQuery = (e.target as InputElement).value ?? '';
      renderApp();
    });

  // Filter Tabs
  final filterTabsRow = DivElement()
    ..className = 'flex items-center gap-2 overflow-x-auto pb-1 scrollbar-none text-xs';

  final categories = ['All', 'Study Sesh', 'Hackathon', 'Workshop', 'Social', 'My Registrations'];

  for (var cat in categories) {
    final isSelected = state.selectedEventCategory == cat;
    final catBtn = ButtonElement()
      ..className = 'px-3.5 py-1.5 rounded-xl font-bold whitespace-nowrap cursor-pointer transition-all ${isSelected ? "bg-indigo-600 text-white shadow-xs" : "bg-slate-100 text-slate-600 hover:bg-slate-200 hover:text-slate-900"}'
      ..text = cat == 'My Registrations' ? '✓ Registered (${state.events.where((e) => e.isRsvpd).length})' : cat
      ..onClick.listen((_) {
        state.selectedEventCategory = cat;
        renderApp();
      });
    filterTabsRow.append(catBtn);
  }

  controlsBar..append(searchInput)..append(filterTabsRow);
  wrapper.append(controlsBar);

  // 3. Filtered Events List
  var filtered = state.events.where((e) {
    // Category filter
    if (state.selectedEventCategory == 'My Registrations') {
      if (!e.isRsvpd) return false;
    } else if (state.selectedEventCategory != 'All') {
      if (e.category != state.selectedEventCategory) return false;
    }

    // Search query filter
    if (state.eventSearchQuery.trim().isNotEmpty) {
      final q = state.eventSearchQuery.toLowerCase();
      final matchTitle = e.title.toLowerCase().contains(q);
      final matchLoc = e.location.toLowerCase().contains(q);
      final matchOrg = e.organizer.toLowerCase().contains(q);
      final matchTags = e.tags.any((t) => t.toLowerCase().contains(q));
      if (!matchTitle && !matchLoc && !matchOrg && !matchTags) return false;
    }

    return true;
  }).toList();

  // 4. Responsive Grid of Event Cards
  if (filtered.isEmpty) {
    final emptyState = DivElement()
      ..className = 'bg-white rounded-3xl p-12 text-center border border-slate-200 space-y-4 max-w-md mx-auto shadow-2xs'
      ..children = [
        DivElement()..className = 'w-16 h-16 rounded-2xl bg-indigo-50 text-indigo-600 text-3xl mx-auto flex items-center justify-center'..text = '📅',
        HeadingElement.h3()..className = 'text-lg font-bold text-slate-800'..text = 'No campus events match your search',
        ParagraphElement()..className = 'text-xs text-slate-500'..text = 'Try choosing a different category or clearing the search terms to explore all campus events.',
        ButtonElement()
          ..className = 'px-4 py-2 bg-slate-900 text-white text-xs font-semibold rounded-xl cursor-pointer hover:bg-slate-800'
          ..text = 'Show All Events'
          ..onClick.listen((_) {
            state.selectedEventCategory = 'All';
            state.eventSearchQuery = '';
            renderApp();
          })
      ];
    wrapper.append(emptyState);
  } else {
    final grid = DivElement()
      ..className = 'grid grid-cols-1 md:grid-cols-2 lg:grid-cols-2 xl:grid-cols-3 gap-6 sm:gap-8';

    for (var evt in filtered) {
      grid.append(renderEventCard(evt));
    }
    wrapper.append(grid);
  }

  return wrapper;
}

// ==========================================
// CHATS SECTION
// ==========================================

Element renderChatsSection() {
  final wrapper = DivElement()..className = 'bg-white rounded-3xl border border-slate-200 shadow-xs overflow-hidden h-[640px] flex flex-col md:flex-row';

  // Left Sidebar
  final sidebar = DivElement()..className = 'w-full md:w-80 border-r border-slate-200 bg-slate-50/50 p-4 space-y-2 overflow-y-auto';
  sidebar.append(HeadingElement.h3()..className = 'text-xs font-bold text-slate-500 uppercase tracking-wider mb-2'..text = 'Study Connections');

  for (var conn in state.connections) {
    final isSelected = state.activeChatStudentId == conn.student.id;
    final row = ButtonElement()
      ..className = 'w-full p-3 rounded-xl flex items-center gap-3 text-left transition-colors cursor-pointer ${isSelected ? 'bg-white shadow-xs border border-slate-200' : 'hover:bg-slate-100'}'
      ..onClick.listen((_) {
        state.activeChatStudentId = conn.student.id;
        renderApp();
      })
      ..children = [
        ImageElement()
          ..src = conn.student.avatar
          ..alt = conn.student.name
          ..className = 'w-10 h-10 rounded-full object-cover border border-slate-200',
        DivElement()
          ..className = 'truncate flex-1'
          ..children = [
            HeadingElement.h4()..className = 'text-xs font-bold text-slate-900 truncate'..text = conn.student.name,
            ParagraphElement()..className = 'text-[11px] text-slate-500 truncate mt-0.5'..text = conn.lastMessage,
          ]
      ];
    sidebar.append(row);
  }

  // Right Chat Window
  final right = DivElement()..className = 'flex-1 flex flex-col bg-white';
  final activeConn = state.connections.firstWhere((c) => c.student.id == state.activeChatStudentId, orElse: () => state.connections.first);
  final msgs = state.chatMessages[activeConn.student.id] ?? [];

  // Chat Header
  final chatHeader = DivElement()
    ..className = 'p-4 border-b border-slate-200 flex items-center justify-between'
    ..children = [
      DivElement()
        ..className = 'flex items-center gap-3'
        ..children = [
          ImageElement()..src = activeConn.student.avatar..className = 'w-9 h-9 rounded-full object-cover',
          DivElement()..children = [
            HeadingElement.h3()..className = 'text-sm font-bold text-slate-900'..text = activeConn.student.name,
            ParagraphElement()..className = 'text-[11px] text-slate-500'..text = '${activeConn.student.major} · ${activeConn.student.preferredLocation}',
          ]
        ],
      ButtonElement()
        ..className = 'px-3 py-1.5 bg-indigo-50 hover:bg-indigo-100 text-indigo-700 text-xs font-semibold rounded-lg cursor-pointer'
        ..text = '📅 Propose Study Sesh'
        ..onClick.listen((_) {
          state.isInviteModalOpen = true;
          renderApp();
        })
    ];

  // Messages
  final msgStream = DivElement()..className = 'flex-1 p-4 sm:p-6 space-y-3 overflow-y-auto bg-slate-50/40';
  for (var m in msgs) {
    final isMe = m.senderId == state.currentUser.id;
    final bubbleContainer = DivElement()..className = 'flex flex-col ${isMe ? "items-end" : "items-start"}';

    bubbleContainer.append(SpanElement()..className = 'text-[10px] text-slate-400 mb-0.5'..text = '${m.senderName} · ${m.timestamp}');

    if (m.isStudyInvite) {
      final inviteCard = DivElement()
        ..className = 'bg-gradient-to-br from-indigo-900 to-slate-900 text-white rounded-2xl p-4 max-w-sm space-y-2 shadow-sm text-xs'
        ..children = [
          SpanElement()..className = 'text-[10px] font-bold text-amber-300 uppercase tracking-wider block'..text = 'Study Session Invite',
          HeadingElement.h4()..className = 'font-bold text-white'..text = m.inviteCourse ?? 'Study Session',
          ParagraphElement()..className = 'text-slate-300 text-[11px]'..text = '🕒 ${m.inviteTime} at 📍 ${m.inviteLocation}',
          ButtonElement()
            ..className = 'w-full py-1.5 bg-indigo-600 hover:bg-indigo-500 text-white rounded-lg font-semibold text-[11px] cursor-pointer'
            ..text = 'Confirm & Add to Schedule'
            ..onClick.listen((_) {
              showToast('Study session confirmed on your campus calendar!');
            })
        ];
      bubbleContainer.append(inviteCard);
    } else {
      bubbleContainer.append(
        DivElement()
          ..className = 'p-3 rounded-2xl text-xs sm:text-sm max-w-md ${isMe ? "bg-indigo-600 text-white rounded-tr-xs" : "bg-white text-slate-800 border border-slate-200 rounded-tl-xs shadow-2xs"}'
          ..text = m.text
      );
    }

    msgStream.append(bubbleContainer);
  }

  // Input
  final inputForm = FormElement()..className = 'p-3 border-t border-slate-200 flex gap-2';
  final txtInput = InputElement()
    ..type = 'text'
    ..placeholder = 'Message ${activeConn.student.name.split(" ")[0]}...'
    ..className = 'flex-1 px-4 py-2.5 text-xs sm:text-sm bg-slate-50 border border-slate-200 rounded-xl focus:outline-none focus:ring-2 focus:ring-indigo-500';

  final sendBtn = ButtonElement()
    ..type = 'submit'
    ..className = 'px-5 py-2.5 bg-indigo-600 hover:bg-indigo-700 text-white text-xs font-semibold rounded-xl cursor-pointer'
    ..text = 'Send';

  inputForm.onSubmit.listen((e) {
    e.preventDefault();
    final txt = txtInput.value?.trim() ?? '';
    if (txt.isEmpty) return;

    final newM = ChatMessage(
      id: 'm_${DateTime.now().millisecondsSinceEpoch}',
      senderId: state.currentUser.id,
      senderName: state.currentUser.name,
      text: txt,
      timestamp: 'Just now',
    );

    state.chatMessages.putIfAbsent(activeConn.student.id, () => []).add(newM);
    activeConn.lastMessage = txt;
    renderApp();
  });

  inputForm..append(txtInput)..append(sendBtn);
  right..append(chatHeader)..append(msgStream)..append(inputForm);
  wrapper..append(sidebar)..append(right);

  // Invite modal inside chats
  if (state.isInviteModalOpen) {
    wrapper.append(renderStudyInviteModal(activeConn.student));
  }

  return wrapper;
}

// ==========================================
// SCHEDULE SECTION
// ==========================================

Element renderScheduleSection() {
  final wrapper = DivElement()..className = 'space-y-8 max-w-5xl mx-auto';

  final banner = DivElement()
    ..className = 'bg-white rounded-3xl p-6 sm:p-8 border border-slate-200 shadow-xs flex flex-col md:flex-row md:items-center justify-between gap-6'
    ..children = [
      DivElement()
        ..children = [
          HeadingElement.h1()..className = 'text-2xl sm:text-3xl font-extrabold text-slate-900'..text = 'My Study Schedule',
          ParagraphElement()..className = 'text-xs sm:text-sm text-slate-500'..text = 'Your upcoming peer study sessions and RSVP\'d campus events',
        ],
      DivElement()
        ..className = 'flex gap-3'
        ..children = [
          DivElement()..className = 'bg-slate-50 p-3 rounded-xl border border-slate-100 text-center'..children = [
            HeadingElement.h4()..className = 'text-xl font-bold text-slate-900'..text = '2',
            SpanElement()..className = 'text-[11px] text-slate-500'..text = 'Confirmed Meets',
          ],
          DivElement()..className = 'bg-slate-50 p-3 rounded-xl border border-slate-100 text-center'..children = [
            HeadingElement.h4()..className = 'text-xl font-bold text-slate-900'..text = '${state.events.where((e) => e.isRsvpd).length}',
            SpanElement()..className = 'text-[11px] text-slate-500'..text = 'RSVP\'d Events',
          ]
        ]
    ];
  wrapper.append(banner);

  // Confirmed Meets
  final meetsHeader = HeadingElement.h2()..className = 'text-lg font-bold text-slate-900'..text = 'Upcoming Study Sessions';
  wrapper.append(meetsHeader);

  final meetsGrid = DivElement()..className = 'grid grid-cols-1 md:grid-cols-2 gap-4';
  final sampleMeets = [
    {'name': 'Maya Patel', 'course': 'CS 189: Intro to Machine Learning', 'time': 'Tomorrow at 3:00 PM', 'loc': 'Doe Library - Level 2 (Whiteboards)'},
    {'name': 'David Kim', 'course': 'Hackathon Team Sprint', 'time': 'Friday at 5:00 PM', 'loc': 'Soda Hall 3rd Floor Alcove'},
  ];

  for (var m in sampleMeets) {
    meetsGrid.append(
      DivElement()
        ..className = 'bg-white p-5 rounded-2xl border border-slate-200 shadow-2xs space-y-2'
        ..children = [
          DivElement()..className = 'flex items-center justify-between'..children = [
            HeadingElement.h3()..className = 'text-sm font-bold text-slate-900'..text = m['name']!,
            SpanElement()..className = 'text-[10px] bg-emerald-50 text-emerald-700 px-2 py-0.5 rounded font-semibold'..text = 'Confirmed',
          ],
          ParagraphElement()..className = 'text-xs text-indigo-600 font-semibold'..text = m['course']!,
          ParagraphElement()..className = 'text-xs text-slate-600'..text = '🕒 ${m['time']!} · 📍 ${m['loc']!}',
        ]
    );
  }
  wrapper.append(meetsGrid);

  // RSVP'd events
  final rsvpHeader = HeadingElement.h2()..className = 'text-lg font-bold text-slate-900'..text = 'My RSVP\'d Campus Events';
  wrapper.append(rsvpHeader);

  final rsvpdList = state.events.where((e) => e.isRsvpd).toList();
  final rsvpGrid = DivElement()..className = 'grid grid-cols-1 md:grid-cols-2 gap-4';

  for (var evt in rsvpdList) {
    rsvpGrid.append(
      DivElement()
        ..className = 'bg-white p-5 rounded-2xl border border-slate-200 shadow-2xs flex items-center justify-between gap-4'
        ..children = [
          DivElement()..children = [
            HeadingElement.h4()..className = 'text-sm font-bold text-slate-900'..text = evt.title,
            ParagraphElement()..className = 'text-xs text-slate-500'..text = '🕒 ${evt.dateStr} · 📍 ${evt.location}',
          ],
          ButtonElement()
            ..className = 'text-xs text-slate-400 hover:text-red-600 cursor-pointer'
            ..text = 'Cancel RSVP'
            ..onClick.listen((_) {
              evt.isRsvpd = false;
              evt.attendeesCount--;
              showToast('Cancelled RSVP for ${evt.title}');
              renderApp();
            })
        ]
    );
  }
  wrapper.append(rsvpGrid);

  return wrapper;
}

// ==========================================
// FOOTER
// ==========================================

Element renderFooter() {
  final footer = Element.tag('footer')..className = 'border-t border-slate-200 bg-white py-6 mt-12 text-xs text-slate-500';
  final container = DivElement()..className = 'max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 flex flex-col sm:flex-row items-center justify-between gap-4';

  container.children = [
    SpanElement()..text = 'CampusPulse · Built with Dart + HTML for Campus Life Upgraded',
    DivElement()..className = 'flex items-center gap-4'..children = [
      ButtonElement()..className = 'hover:text-indigo-600 cursor-pointer'..text = 'Study Buddies'..onClick.listen((_) { state.activeSection = 'discover'; renderApp(); }),
      SpanElement()..text = '·',
      ButtonElement()..className = 'hover:text-indigo-600 cursor-pointer'..text = 'Campus Events'..onClick.listen((_) { state.activeSection = 'events'; renderApp(); }),
      SpanElement()..text = '·',
      ButtonElement()..className = 'hover:text-indigo-600 cursor-pointer'..text = 'Switch Account'..onClick.listen((_) { state.logout(); renderApp(); }),
    ]
  ];

  footer.append(container);
  return footer;
}

// ==========================================
// MODALS
// ==========================================

Element renderConnectModal() {
  final student = state.connectModalStudent!;
  final backdrop = DivElement()..className = 'fixed inset-0 z-50 bg-black/50 backdrop-blur-xs flex items-center justify-center p-4';
  
  final modal = DivElement()
    ..className = 'bg-white rounded-3xl max-w-lg w-full p-6 space-y-4 border border-slate-200 shadow-xl'
    ..children = [
      DivElement()
        ..className = 'flex items-center justify-between'
        ..children = [
          HeadingElement.h3()..className = 'text-base font-bold text-slate-900'..text = 'Connect with ${student.name}',
          ButtonElement()
            ..className = 'text-slate-400 hover:text-slate-600 p-1 cursor-pointer'
            ..text = '✕'
            ..onClick.listen((_) {
              state.connectModalStudent = null;
              renderApp();
            })
        ],
      ParagraphElement()..className = 'text-xs text-slate-500'..text = 'Send an invitation to study together for ${student.courses[0]}',
      TextAreaElement()
        ..rows = 3
        ..value = state.connectNote
        ..className = 'w-full p-3 text-xs bg-slate-50 border border-slate-200 rounded-xl focus:outline-none focus:ring-2 focus:ring-indigo-500'
        ..onInput.listen((e) {
          state.connectNote = (e.target as TextAreaElement).value ?? '';
        }),
      DivElement()
        ..className = 'flex justify-end gap-2 pt-2 border-t border-slate-100'
        ..children = [
          ButtonElement()
            ..className = 'px-3 py-1.5 text-xs text-slate-600 hover:bg-slate-100 rounded-lg cursor-pointer'
            ..text = 'Cancel'
            ..onClick.listen((_) {
              state.connectModalStudent = null;
              renderApp();
            }),
          ButtonElement()
            ..className = 'px-4 py-2 bg-indigo-600 hover:bg-indigo-700 text-white text-xs font-semibold rounded-xl cursor-pointer shadow-xs'
            ..text = 'Send Request'
            ..onClick.listen((_) {
              state.connectModalStudent = null;
              showToast('Study invitation sent to ${student.name}!');
              renderApp();
            })
        ]
    ];

  backdrop.append(modal);
  return backdrop;
}

Element renderStudyInviteModal(StudentProfile student) {
  final backdrop = DivElement()..className = 'fixed inset-0 z-50 bg-black/50 backdrop-blur-xs flex items-center justify-center p-4';
  
  final courseInput = InputElement()..type = 'text'..value = 'CS 189: Intro to Machine Learning'..className = 'w-full p-2 text-xs bg-slate-50 border border-slate-200 rounded-xl';
  final locInput = InputElement()..type = 'text'..value = 'Doe Memorial Library - Level 2'..className = 'w-full p-2 text-xs bg-slate-50 border border-slate-200 rounded-xl';
  final timeInput = InputElement()..type = 'text'..value = 'Tomorrow at 3:30 PM'..className = 'w-full p-2 text-xs bg-slate-50 border border-slate-200 rounded-xl';

  final modal = DivElement()
    ..className = 'bg-white rounded-3xl max-w-md w-full p-6 space-y-4 border border-slate-200 shadow-xl'
    ..children = [
      HeadingElement.h3()..className = 'text-base font-bold text-slate-900'..text = 'Propose Study Sesh with ${student.name.split(" ")[0]}',
      DivElement()..className = 'space-y-1'..children = [
        LabelElement()..className = 'text-xs font-semibold text-slate-700'..text = 'Subject / Course',
        courseInput,
      ],
      DivElement()..className = 'space-y-1'..children = [
        LabelElement()..className = 'text-xs font-semibold text-slate-700'..text = 'Location',
        locInput,
      ],
      DivElement()..className = 'space-y-1'..children = [
        LabelElement()..className = 'text-xs font-semibold text-slate-700'..text = 'Time',
        timeInput,
      ],
      DivElement()
        ..className = 'flex justify-end gap-2 pt-2'
        ..children = [
          ButtonElement()
            ..className = 'px-3 py-1.5 text-xs text-slate-600 hover:bg-slate-100 rounded-lg cursor-pointer'
            ..text = 'Cancel'
            ..onClick.listen((_) {
              state.isInviteModalOpen = false;
              renderApp();
            }),
          ButtonElement()
            ..className = 'px-4 py-2 bg-indigo-600 hover:bg-indigo-700 text-white text-xs font-semibold rounded-xl cursor-pointer'
            ..text = 'Post Invite Card'
            ..onClick.listen((_) {
              final newM = ChatMessage(
                id: 'm_${DateTime.now().millisecondsSinceEpoch}',
                senderId: state.currentUser.id,
                senderName: state.currentUser.name,
                text: 'Study session invite: ${courseInput.value}',
                timestamp: 'Just now',
                isStudyInvite: true,
                inviteCourse: courseInput.value,
                inviteLocation: locInput.value,
                inviteTime: timeInput.value,
              );
              state.chatMessages.putIfAbsent(student.id, () => []).add(newM);
              state.isInviteModalOpen = false;
              showToast('Study session invite card dropped into chat!');
              renderApp();
            })
        ]
    ];

  backdrop.append(modal);
  return backdrop;
}

Element renderCreateEventModal() {
  final backdrop = DivElement()..className = 'fixed inset-0 z-50 bg-black/60 backdrop-blur-xs flex items-center justify-center p-4';

  // Strict Permission Check: Normal students cannot post campus events
  if (!state.canPostEvents) {
    final modal = DivElement()
      ..className = 'bg-white rounded-3xl max-w-md w-full p-6 sm:p-7 space-y-4 border border-slate-200 shadow-2xl text-center'
      ..children = [
        DivElement()
          ..className = 'w-14 h-14 rounded-2xl bg-amber-100 text-amber-800 text-2xl mx-auto flex items-center justify-center font-bold shadow-xs'
          ..text = '🔒',
        HeadingElement.h3()
          ..className = 'text-lg font-black text-slate-900 tracking-tight'
          ..text = 'Event Creation Restricted',
        ParagraphElement()
          ..className = 'text-xs text-slate-600 leading-relaxed'
          ..text = 'Normal students are strictly not allowed to post campus events. Event publishing is restricted to verified Faculty Teachers and recognized Student Club Heads to maintain verified bulletin quality and safety.',
        DivElement()
          ..className = 'p-3.5 rounded-2xl bg-slate-50 border border-slate-200 text-xs text-slate-700 text-left space-y-1.5'
          ..children = [
            SpanElement()..className = 'font-bold block text-[11px] text-slate-900 uppercase tracking-wider'..text = 'WHO CAN POST CAMPUS EVENTS:',
            SpanElement()..className = 'block text-[11px] text-emerald-800 font-semibold'..text = '• Verified Faculty Teachers (Prof. Sarah Martinez, EECS)',
            SpanElement()..className = 'block text-[11px] text-violet-800 font-semibold'..text = '• Recognized Student Club Heads (Jordan Lee, Mobile Dev Guild)',
            SpanElement()..className = 'block text-[11px] text-amber-800 font-semibold'..text = '• Campus Administration (Dean Marcus Holloway)',
          ],
        DivElement()
          ..className = 'space-y-2 pt-2'
          ..children = [
            ButtonElement()
              ..className = 'w-full py-2.5 bg-emerald-600 hover:bg-emerald-700 text-white rounded-xl text-xs font-bold cursor-pointer transition-colors flex items-center justify-center gap-2 shadow-xs'
              ..children = [
                SpanElement()..text = '👩‍🏫',
                SpanElement()..text = 'Switch to Teacher Account to Post',
              ]
              ..onClick.listen((_) {
                state.loginAsTeacher();
                state.isCreateEventOpen = true;
                showToast('Switched to Prof. Sarah Martinez (Teacher mode)');
                renderApp();
              }),
            ButtonElement()
              ..className = 'w-full py-2.5 bg-violet-600 hover:bg-violet-700 text-white rounded-xl text-xs font-bold cursor-pointer transition-colors flex items-center justify-center gap-2 shadow-xs'
              ..children = [
                SpanElement()..text = '🏆',
                SpanElement()..text = 'Switch to Club Head Account to Post',
              ]
              ..onClick.listen((_) {
                state.loginAsClubHead();
                state.isCreateEventOpen = true;
                showToast('Switched to Jordan Lee (Club Head mode)');
                renderApp();
              }),
            ButtonElement()
              ..className = 'w-full py-2 text-slate-500 hover:text-slate-800 text-xs font-semibold cursor-pointer'
              ..text = 'Cancel & Return to Events'
              ..onClick.listen((_) {
                state.isCreateEventOpen = false;
                renderApp();
              })
          ]
      ];
    backdrop.append(modal);
    return backdrop;
  }

  // Authorized Creation Form for Teachers, Club Heads, and Admins
  final titleInput = InputElement()
    ..type = 'text'
    ..placeholder = state.userRole == 'teacher'
        ? 'e.g. CS 189 Final Exam Problem Jam & Office Hours'
        : state.userRole == 'club_head'
            ? 'e.g. 24hr Campus Flutter Hackathon & Design Sprint'
            : 'e.g. Official Campus Safety & Health Notice'
    ..className = 'w-full px-3 py-2 text-xs bg-slate-50 border border-slate-200 rounded-xl focus:outline-none focus:ring-2 focus:ring-indigo-500';

  final categorySelect = SelectElement()
    ..className = 'w-full px-3 py-2 text-xs bg-slate-50 border border-slate-200 rounded-xl focus:outline-none focus:ring-2 focus:ring-indigo-500';

  final defaultCats = state.userRole == 'teacher'
      ? ['Study Sesh', 'Workshop', 'Exam Review', 'Guest Lecture', 'Clinic']
      : state.userRole == 'club_head'
          ? ['Hackathon', 'Workshop', 'Social', 'Club Meeting', 'Study Sesh']
          : ['Announcement', 'Workshop', 'Campus Life'];

  for (var c in defaultCats) {
    categorySelect.append(OptionElement()..value = c..text = c);
  }

  final locInput = InputElement()
    ..type = 'text'
    ..placeholder = state.userRole == 'teacher' ? 'Soda Hall - Wozniak Lounge 430' : 'Jacobs Hall Makerspace Studio 1'
    ..value = state.userRole == 'teacher' ? 'Soda Hall Faculty Suite' : 'Jacobs Hall Makerspace'
    ..className = 'w-full px-3 py-2 text-xs bg-slate-50 border border-slate-200 rounded-xl focus:outline-none focus:ring-2 focus:ring-indigo-500';

  final timeInput = InputElement()
    ..type = 'text'
    ..placeholder = 'e.g. This Thursday, 5:00 PM – 7:30 PM'
    ..value = 'Thursday, 4:30 PM – 6:30 PM'
    ..className = 'w-full px-3 py-2 text-xs bg-slate-50 border border-slate-200 rounded-xl focus:outline-none focus:ring-2 focus:ring-indigo-500';

  final capInput = InputElement()
    ..type = 'number'
    ..value = state.userRole == 'teacher' ? '45' : '150'
    ..className = 'w-full px-3 py-2 text-xs bg-slate-50 border border-slate-200 rounded-xl focus:outline-none focus:ring-2 focus:ring-indigo-500';

  final descInput = TextAreaElement()
    ..rows = 2
    ..placeholder = 'What will be covered? What should attendees bring?'
    ..value = state.userRole == 'teacher'
        ? 'In-depth problem breakdown of exam topics, gradient derivations, and Q&A with course staff. Refreshments provided.'
        : 'Team formation, live coding sprints, mentor office hours, and prize presentations. All skill levels welcome!'
    ..className = 'w-full px-3 py-2 text-xs bg-slate-50 border border-slate-200 rounded-xl focus:outline-none focus:ring-2 focus:ring-indigo-500';

  final tagsInput = InputElement()
    ..type = 'text'
    ..value = state.userRole == 'teacher' ? 'CS189, MidtermPrep, Whiteboard, FacultyLead' : 'Hackathon, Flutter, Dart, Prizes, Networking'
    ..className = 'w-full px-3 py-2 text-xs bg-slate-50 border border-slate-200 rounded-xl focus:outline-none focus:ring-2 focus:ring-indigo-500';

  // Publisher Identity Card
  final publisherCard = DivElement()
    ..className = 'p-3 rounded-2xl flex items-center justify-between gap-3 text-xs border ' +
        (state.userRole == 'teacher'
            ? 'bg-emerald-50/70 border-emerald-200'
            : state.userRole == 'club_head'
                ? 'bg-violet-50/70 border-violet-200'
                : 'bg-amber-50/70 border-amber-200')
    ..children = [
      DivElement()
        ..className = 'flex items-center gap-2.5 truncate'
        ..children = [
          ImageElement()
            ..src = state.activeUser.avatar
            ..alt = state.activeUser.name
            ..className = 'w-9 h-9 rounded-full object-cover border border-white shadow-xs',
          DivElement()
            ..className = 'truncate'
            ..children = [
              SpanElement()..className = 'font-bold text-slate-900 block truncate text-xs'..text = state.activeUser.name,
              SpanElement()..className = 'text-[11px] text-slate-600 block truncate'..text = state.activeUser.department,
            ]
        ],
      SpanElement()
        ..className = 'px-2 py-0.5 rounded-full text-[10px] font-extrabold shrink-0 ' +
            (state.userRole == 'teacher'
                ? 'bg-emerald-600 text-white shadow-2xs'
                : state.userRole == 'club_head'
                    ? 'bg-violet-600 text-white shadow-2xs'
                    : 'bg-amber-600 text-slate-950 shadow-2xs')
        ..text = state.userRole == 'teacher'
            ? '✓ Verified Faculty'
            : state.userRole == 'club_head'
                ? '✓ Verified Club Head'
                : '✓ Institutional Admin',
    ];

  final modal = DivElement()
    ..className = 'bg-white rounded-3xl max-w-lg w-full p-6 sm:p-7 space-y-4 border border-slate-200 shadow-2xl max-h-[90vh] overflow-y-auto'
    ..children = [
      DivElement()
        ..className = 'flex items-center justify-between pb-1'
        ..children = [
          HeadingElement.h3()
            ..className = 'text-base sm:text-lg font-black text-slate-900 tracking-tight flex items-center gap-2'
            ..children = [
              SpanElement()..text = state.userRole == 'teacher' ? '👩‍🏫' : state.userRole == 'club_head' ? '🏆' : '🛡️',
              SpanElement()..text = state.userRole == 'teacher'
                  ? 'Post Faculty Academic Event'
                  : state.userRole == 'club_head'
                      ? 'Post Student Club Event'
                      : 'Broadcast Institutional Notice',
            ],
          ButtonElement()
            ..className = 'text-slate-400 hover:text-slate-600 text-sm p-1 cursor-pointer'
            ..text = '✕'
            ..onClick.listen((_) {
              state.isCreateEventOpen = false;
              renderApp();
            })
        ],
      publisherCard,
      DivElement()..className = 'space-y-1'..children = [
        LabelElement()..className = 'text-xs font-bold text-slate-700'..text = 'Event Title *',
        titleInput,
      ],
      DivElement()
        ..className = 'grid grid-cols-1 sm:grid-cols-2 gap-3'
        ..children = [
          DivElement()..className = 'space-y-1'..children = [
            LabelElement()..className = 'text-xs font-bold text-slate-700'..text = 'Category',
            categorySelect,
          ],
          DivElement()..className = 'space-y-1'..children = [
            LabelElement()..className = 'text-xs font-bold text-slate-700'..text = 'Max Capacity (RSVP)',
            capInput,
          ],
        ],
      DivElement()
        ..className = 'grid grid-cols-1 sm:grid-cols-2 gap-3'
        ..children = [
          DivElement()..className = 'space-y-1'..children = [
            LabelElement()..className = 'text-xs font-bold text-slate-700'..text = 'Location *',
            locInput,
          ],
          DivElement()..className = 'space-y-1'..children = [
            LabelElement()..className = 'text-xs font-bold text-slate-700'..text = 'Date & Time *',
            timeInput,
          ],
        ],
      DivElement()..className = 'space-y-1'..children = [
        LabelElement()..className = 'text-xs font-bold text-slate-700'..text = 'Description & Agenda',
        descInput,
      ],
      DivElement()..className = 'space-y-1'..children = [
        LabelElement()..className = 'text-xs font-bold text-slate-700'..text = 'Tags (comma separated)',
        tagsInput,
      ],
      DivElement()
        ..className = 'flex items-center justify-between pt-2 border-t border-slate-100'
        ..children = [
          SpanElement()
            ..className = 'text-[11px] text-slate-400 font-medium'
            ..text = 'Posts directly to Fall 2026 Campus Bulletin',
          DivElement()
            ..className = 'flex gap-2'
            ..children = [
              ButtonElement()
                ..className = 'px-3 py-2 text-xs font-semibold text-slate-600 hover:bg-slate-100 rounded-xl cursor-pointer'
                ..text = 'Cancel'
                ..onClick.listen((_) {
                  state.isCreateEventOpen = false;
                  renderApp();
                }),
              ButtonElement()
                ..className = 'px-4 py-2.5 text-xs font-extrabold text-white rounded-xl cursor-pointer shadow-md transition-all ' +
                    (state.userRole == 'teacher'
                        ? 'bg-emerald-600 hover:bg-emerald-700 shadow-emerald-500/20'
                        : state.userRole == 'club_head'
                            ? 'bg-violet-600 hover:bg-violet-700 shadow-violet-500/20'
                            : 'bg-amber-600 hover:bg-amber-700 shadow-amber-500/20')
                ..text = state.userRole == 'teacher'
                    ? 'Publish Faculty Event'
                    : state.userRole == 'club_head'
                        ? 'Publish Club Event'
                        : 'Broadcast Notice'
                ..onClick.listen((_) {
                  final t = titleInput.value?.trim() ?? '';
                  if (t.isEmpty) {
                    showToast('Please enter an event title');
                    return;
                  }

                  final parsedTags = (tagsInput.value ?? '')
                      .split(',')
                      .map((s) => s.trim())
                      .where((s) => s.isNotEmpty)
                      .toList();

                  final parsedCap = int.tryParse(capInput.value ?? '') ?? 50;

                  state.events.insert(
                    0,
                    CampusEvent(
                      id: 'evt_${DateTime.now().millisecondsSinceEpoch}',
                      title: t,
                      organizer: state.activeUser.name,
                      organizerRole: state.userRole == 'teacher'
                          ? 'Faculty Professor (EECS)'
                          : state.userRole == 'club_head'
                              ? 'Student Club President'
                              : 'University Official',
                      category: categorySelect.value ?? 'Study Sesh',
                      dateStr: timeInput.value?.trim() ?? 'Upcoming',
                      location: locInput.value?.trim() ?? 'Campus Hall',
                      room: state.userRole == 'teacher' ? 'Suite 524' : 'Studio 1',
                      description: descInput.value?.trim() ?? 'Campus event posted by authorized university affiliate.',
                      imageUrl: state.userRole == 'teacher'
                          ? './assets/images/library_study_hub_1792864911583.jpg'
                          : state.userRole == 'club_head'
                              ? './assets/images/hackathon_team_jam_1792864909538.jpg'
                              : './assets/images/campus_quad_banner_1792864909368.jpg',
                      attendeesCount: 1,
                      maxCapacity: parsedCap,
                      isRsvpd: true,
                      isFeatured: true,
                      isOfficial: state.userRole == 'teacher' || state.userRole == 'admin',
                      tags: parsedTags.isNotEmpty ? parsedTags : ['Campus', 'Fall2026'],
                    ),
                  );

                  state.isCreateEventOpen = false;
                  showToast(state.userRole == 'teacher'
                      ? 'Faculty event published with verified teacher badge!'
                      : state.userRole == 'club_head'
                          ? 'Club event published with verified club head badge!'
                          : 'Official university notice broadcast to campus!');
                  renderApp();
                })
            ]
        ]
    ];

  backdrop.append(modal);
  return backdrop;
}

Element renderProfileModal() {
  final backdrop = DivElement()..className = 'fixed inset-0 z-50 bg-black/50 backdrop-blur-xs flex items-center justify-center p-4';
  
  final courseInput = InputElement()..type = 'text'..placeholder = 'e.g. EECS 126'..className = 'flex-1 p-2 text-xs bg-slate-50 border border-slate-200 rounded-xl';

  final user = state.activeUser;

  final modal = DivElement()
    ..className = 'bg-white rounded-3xl max-w-lg w-full p-6 space-y-4 border border-slate-200 shadow-xl max-h-[90vh] overflow-y-auto'
    ..children = [
      DivElement()
        ..className = 'flex items-center justify-between'
        ..children = [
          DivElement()..className = 'flex items-center gap-3'..children = [
            ImageElement()..src = user.avatar..className = 'w-12 h-12 rounded-xl object-cover border border-slate-200 shadow-xs',
            DivElement()..children = [
              HeadingElement.h3()..className = 'text-base font-bold text-slate-900'..text = user.name,
              ParagraphElement()..className = 'text-xs text-slate-500'..text = '${user.major} · ${user.year}',
            ]
          ],
          ButtonElement()..className = 'text-slate-400 hover:text-slate-600 p-1 cursor-pointer'..text = '✕'..onClick.listen((_) { state.isProfileOpen = false; renderApp(); })
        ],
      // Bio & Role accreditation
      DivElement()
        ..className = 'p-3 bg-slate-50 rounded-xl border border-slate-100 text-xs space-y-1'
        ..children = [
          SpanElement()..className = 'font-bold text-slate-700 block'..text = 'Bio & Campus Role',
          ParagraphElement()..className = 'text-slate-600 text-[11px] leading-relaxed'..text = user.bio,
          SpanElement()
            ..className = 'inline-block mt-1 px-2 py-0.5 rounded text-[10px] font-bold ' +
                (state.userRole == 'teacher'
                    ? 'bg-emerald-100 text-emerald-800'
                    : state.userRole == 'club_head'
                        ? 'bg-violet-100 text-violet-800'
                        : state.userRole == 'admin'
                            ? 'bg-amber-100 text-amber-900'
                            : 'bg-indigo-100 text-indigo-800')
            ..text = state.canPostEvents
                ? '⚡ Authorized Campus Event Publisher'
                : '🔒 Student: Event Browsing & RSVPs Only',
        ],
      DivElement()
        ..className = 'space-y-2'
        ..children = [
          LabelElement()..className = 'text-xs font-semibold text-slate-700'..text = state.userRole == 'teacher' ? 'Courses Taught & Clinics' : 'Enrolled Courses & Workshops',
          DivElement()
            ..className = 'flex flex-wrap gap-1.5'
            ..children = user.courses.map((c) => 
              SpanElement()
                ..className = 'bg-indigo-50 text-indigo-700 border border-indigo-200 text-xs px-2.5 py-1 rounded-lg font-medium'
                ..text = c
            ).toList(),
          if (state.userRole == 'student')
            DivElement()
              ..className = 'flex gap-2 pt-1'
              ..children = [
                courseInput,
                ButtonElement()
                  ..className = 'px-3 py-2 bg-slate-100 hover:bg-slate-200 text-slate-700 rounded-xl text-xs font-semibold cursor-pointer'
                  ..text = 'Add'
                  ..onClick.listen((_) {
                    final v = courseInput.value?.trim() ?? '';
                    if (v.isNotEmpty && !state.currentUser.courses.contains(v)) {
                      state.currentUser.courses.add(v);
                      state.recalculateScores();
                      renderApp();
                    }
                  })
              ]
        ],
      DivElement()
        ..className = 'pt-2 flex justify-end'
        ..children = [
          ButtonElement()
            ..className = 'px-4 py-2 bg-indigo-600 hover:bg-indigo-700 text-white rounded-xl text-xs font-semibold cursor-pointer'
            ..text = 'Done'
            ..onClick.listen((_) {
              state.isProfileOpen = false;
              renderApp();
            })
        ]
    ];

  backdrop.append(modal);
  return backdrop;
}
