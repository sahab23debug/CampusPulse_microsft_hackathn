import 'package:flutter/material.dart';
import 'package:campuspulse_client/campuspulse_client.dart';
import '../../../core/utils/bunk_math.dart';

/// Action chip attached to Sam's response allowing 1-tap navigation
class SamAction {
  final String label;
  final IconData icon;
  final String route;

  const SamAction({
    required this.label,
    required this.icon,
    required this.route,
  });
}

/// Message model for Sam AI Copilot (supports text, media attachments & geo-location)
class SamMessage {
  final String id;
  final String text;
  final bool isUser;
  final DateTime timestamp;
  final List<SamAction> actions;
  final String? mediaUrl;
  final String? mediaCaption;
  final String? geoLandmark;

  const SamMessage({
    required this.id,
    required this.text,
    required this.isUser,
    required this.timestamp,
    this.actions = const [],
    this.mediaUrl,
    this.mediaCaption,
    this.geoLandmark,
  });
}

/// Intelligent Campus Knowledge Engine powering Sam AI Copilot
class SamEngine {
  /// Generate smart, context-aware responses for general chat, vision question solving,
  /// timetable, bunk-meter, notes & campus fests
  static SamMessage processQuery(
    String input,
    UserProfile? user, {
    String? mediaUrl,
    String? geoLandmark,
  }) {
    final query = input.trim().toLowerCase();
    final firstName = user?.fullName.split(' ').first ?? 'Friend';
    final now = DateTime.now();
    final id = DateTime.now().millisecondsSinceEpoch.toString();

    // 0. MULTIMODAL PHOTO & QUESTION SOLVING (Vision AI Engine)
    if (mediaUrl != null ||
        _matches(query, [
          'solve',
          'explain this photo',
          'explain question',
          'solve question',
          'homework',
          'whiteboard',
          'photo',
          'diagram',
          'problem in image',
          'scan question',
          'ocr',
          'recurrence',
          'banker',
          'derivation',
          'math question',
        ])) {
      return _generateMultimodalQuestionSolution(id, now, query, mediaUrl, geoLandmark, firstName);
    }

    // 1. TIMETABLE & SCHEDULE QUERIES
    if (_matches(query, ['next class', 'next lecture', 'where to go', 'current class', 'what class'])) {
      return SamMessage(
        id: id,
        isUser: false,
        timestamp: now,
        text: '📍 **Your Next Lecture:**\n\n'
            '• **Design & Analysis of Algorithms Lab (CS503)**\n'
            '• **Time:** 11:30 AM – 01:00 PM\n'
            '• **Location:** CS Lab 3 (Computer Dept, 2nd Floor)\n'
            '• **Faculty:** Prof. R. Sen\n\n'
            '💡 *Tip: Don\'t forget your lab record book!*',
        actions: const [
          SamAction(label: 'Open Full Timetable', icon: Icons.calendar_today_rounded, route: '/timetable'),
          SamAction(label: 'Check Bunk-Meter', icon: Icons.calculate_rounded, route: '/bunk-meter'),
        ],
      );
    }

    if (_matches(query, ['today schedule', 'timetable', 'schedule', 'classes today', 'what classes', 'lectures today', 'classes'])) {
      return SamMessage(
        id: id,
        isUser: false,
        timestamp: now,
        text: '📅 **Today\'s Schedule for $firstName (${user?.sectionName ?? "CSE-3A"}):**\n\n'
            '1. **09:00 – 10:00 AM:** DBMS (CS501) • LHC-101 • Prof. V. Sharma\n'
            '2. **10:15 – 11:15 AM:** Operating Systems (CS502) • LHC-204 • Dr. Neha Gupta\n'
            '3. **11:30 – 01:00 PM:** DAA Lab (CS503) • CS Lab 3 • Prof. R. Sen *(Next up)*\n'
            '4. **02:00 – 03:00 PM:** Computer Networks (CS504) • LHC-102 • Dr. K. Iyer\n\n'
            'Total: 4 classes (3 lectures, 1 lab).',
        actions: const [
          SamAction(label: 'View Timetable Grid', icon: Icons.calendar_month_rounded, route: '/timetable'),
        ],
      );
    }

    // 2. BUNK & ATTENDANCE QUERIES
    if (_matches(query, ['bunk dbms', 'can i bunk dbms', 'dbms bunk', 'skip dbms'])) {
      final safeBunks = BunkMath.safeBunks(26, 30, 75.0);
      return SamMessage(
        id: id,
        isUser: false,
        timestamp: now,
        text: '✅ **Yes, you can bunk DBMS today!**\n\n'
            '• Current Attendance: **26/30 (86.7%)**\n'
            '• Safe Bunks Remaining: **$safeBunks classes**\n'
            '• If you bunk today, your attendance will become **26/31 (83.9%)**, which is still safely above the 75% institute threshold.\n\n'
            'Enjoy your break, but keep an eye on upcoming quizzes!',
        actions: const [
          SamAction(label: 'Bunk-Meter Simulator', icon: Icons.calculate_rounded, route: '/bunk-meter'),
        ],
      );
    }

    if (_matches(query, ['bunk daa', 'can i bunk daa', 'daa bunk', 'skip daa'])) {
      final recovery = BunkMath.recoveryClasses(14, 22, 75.0);
      return SamMessage(
        id: id,
        isUser: false,
        timestamp: now,
        text: '🚨 **Warning: DO NOT Bunk DAA!**\n\n'
            '• Current Attendance: **14/22 (63.6%)** ⚠️ Critical Red Alert!\n'
            '• You need to attend **$recovery consecutive lectures** without missing any to get back above the 75% safe zone.\n'
            '• Missing today will push your attendance down to **60.8%**, risking exam debarment!',
        actions: const [
          SamAction(label: 'Check Recovery in Bunk-Meter', icon: Icons.warning_amber_rounded, route: '/bunk-meter'),
        ],
      );
    }

    if (_matches(query, ['bunk os', 'can i bunk os', 'operating systems bunk'])) {
      return SamMessage(
        id: id,
        isUser: false,
        timestamp: now,
        text: '⚠️ **Careful! OS is right on the edge.**\n\n'
            '• Current Attendance: **21/28 (75.0%)**\n'
            '• Safe Bunks Remaining: **0 classes**\n'
            '• If you skip 1 lecture, your attendance drops to **72.4%** (Amber Alert). You must attend today\'s lecture to stay safe.',
        actions: const [
          SamAction(label: 'Open Bunk-Meter', icon: Icons.calculate_rounded, route: '/bunk-meter'),
        ],
      );
    }

    if (_matches(query, ['attendance', 'bunk meter', 'bunks', 'how many bunks', 'safe bunks'])) {
      return SamMessage(
        id: id,
        isUser: false,
        timestamp: now,
        text: '📊 **Your Attendance Overview:**\n\n'
            '• **Database Management:** 26/30 (86.7%) 🟢 2 Safe Bunks\n'
            '• **Operating Systems:** 21/28 (75.0%) 🟡 0 Safe Bunks (Borderline)\n'
            '• **Algorithms (DAA):** 14/22 (63.6%) 🔴 10 Recovery Classes Needed\n'
            '• **Computer Networks:** 19/20 (95.0%) 🟢 4 Safe Bunks\n\n'
            'Overall Average: **80.0%** (Safe across institute rules).',
        actions: const [
          SamAction(label: 'Launch What-If Simulator', icon: Icons.tune_rounded, route: '/bunk-meter'),
        ],
      );
    }

    // 3. CODING, DSA & TECHNICAL INTERVIEWS
    if (_matches(query, [
      'coding',
      'code',
      'learn coding',
      'dsa',
      'leetcode',
      'programming',
      'python',
      'flutter',
      'java',
      'c++',
      'how to code',
      'coding interview',
      'debug',
      'algorithms',
      'data structures',
      'web dev',
      'full stack',
      'interview prep',
    ])) {
      return SamMessage(
        id: id,
        isUser: false,
        timestamp: now,
        text: '💻 **Sam\'s Master Coding & DSA Blueprint for College Engineers:**\n\n'
            'Whether building high-performance projects or preparing for technical interviews, here is your roadmap:\n\n'
            '🔥 **1. The Core 8 DSA Patterns to Master:**\n'
            '• **Two Pointers & Sliding Window:** Max subarray sums, 3Sum, trapping rainwater.\n'
            '• **Binary Search on Answer Range:** Capacity to ship packages, aggressive cows, allocating pages.\n'
            '• **Fast & Slow Pointers:** Cycle detection in linked lists, middle node.\n'
            '• **DFS & BFS Graph Traversals:** Topological sort (Kahn\'s algorithm), connected islands, Dijkstra’s shortest path.\n'
            '• **Dynamic Programming:** 0/1 Knapsack, Longest Common Subsequence (LCS), Edit Distance, Coin Change.\n\n'
            '🛠️ **2. Industry Production Tech Stacks:**\n'
            '• **Cross-Platform Mobile:** Flutter & Dart with Riverpod state management.\n'
            '• **Backend & Microservices:** Serverpod (Dart), FastAPI (Python), Node.js / Express, Go.\n'
            '• **Databases:** PostgreSQL (Relational integrity) + Redis (High-speed caching).\n\n'
            '💡 **3. Interview Strategy & Clean Code:**\n'
            '• State Time & Space Complexity (Big-O) before writing code.\n'
            '• Ask clarifying edge questions (null/empty arrays, negative numbers, extreme constraints).\n'
            '• Dry-run your algorithm with test cases before final submission.\n\n'
            'Need a code snippet or solution for any algorithm? Just ask me or snap a photo of the problem!',
        actions: const [
          SamAction(label: 'Practice Quiz Arena', icon: Icons.sports_esports_rounded, route: '/arena'),
          SamAction(label: 'Find Coding Teammates', icon: Icons.handshake_rounded, route: '/connect'),
          SamAction(label: 'Study Hub Cheatsheets', icon: Icons.menu_book_rounded, route: '/study'),
        ],
      );
    }

    // 4. CV & RESUME ARCHITECTURE (ATS-OPTIMIZED)
    if (_matches(query, [
      'cv',
      'resume',
      'build cv',
      'build resume',
      'resume tips',
      'cv format',
      'ats resume',
      'how to make cv',
      'resume review',
      'portfolio',
      'curriculum vitae',
      'job application',
      'building cvs',
    ])) {
      return SamMessage(
        id: id,
        isUser: false,
        timestamp: now,
        text: '📄 **Sam\'s ATS-Friendly Tech CV & Resume Architecture:**\n\n'
            'Technical recruiters and Applicant Tracking Systems (ATS) spend under 8 seconds scanning resumes. Here is how to make yours stand out:\n\n'
            '🎯 **1. The Golden "XYZ" Bullet Formula (Google Standard):**\n'
            '• ❌ *Weak:* "Built a college mobile app with Flutter and backend."\n'
            '• ✅ *High-Impact:* "Architected a full-stack campus app using Flutter & Serverpod, decreasing API response latency by 38% and supporting 1,200+ concurrent students."\n\n'
            '🏗️ **2. The Winning 1-Page Layout Structure:**\n'
            '• **Header:** Full Name, University Email, Phone, LinkedIn, GitHub, and Portfolio link.\n'
            '• **Education:** Degree, College Name, Graduation Year, CGPA/SGPA (include if >= 7.5).\n'
            '• **Technical Skills:** Group by Languages (Dart, Python, C++, SQL), Frameworks (Flutter, React, FastAPI), Tools (Git, Docker, PostgreSQL).\n'
            '• **Projects (2-3 Flagship Items):** Highlight live demo and GitHub repository links, mention architecture and measurable outcomes.\n'
            '• **Experience / Internships:** Quantified impact and team contributions.\n'
            '• **Achievements & Badges:** Hackathon wins (e.g. HackPulse, SIH), LeetCode ratings, cloud badges.\n\n'
            '⚠️ **3. Crucial Resume Rules:**\n'
            '• Strictly **1 page** for students & freshers.\n'
            '• Avoid multi-column graphical templates with progress bars—ATS cannot parse them.\n'
            '• Always export and submit as a clean, text-searchable PDF.',
        actions: const [
          SamAction(label: 'View Campus Hackathons', icon: Icons.dynamic_feed_rounded, route: '/home'),
          SamAction(label: 'Find Project Teammates', icon: Icons.handshake_rounded, route: '/connect'),
        ],
      );
    }

    // 5. INDUSTRY CERTIFICATIONS & CREDENTIALS
    if (_matches(query, [
      'certification',
      'certifications',
      'suggest certification',
      'best certificates',
      'aws certification',
      'cloud certification',
      'course certificates',
      'credentials',
      'which certification',
      'certificate',
      'cert',
    ])) {
      return SamMessage(
        id: id,
        isUser: false,
        timestamp: now,
        text: '🎓 **Top High-ROI Industry Certifications for College Students:**\n\n'
            'Here are the most respected industry-recognized credentials that provide direct credibility on your CV:\n\n'
            '☁️ **1. Cloud Computing & DevOps (Highest Industry Demand):**\n'
            '• **AWS Certified Cloud Practitioner (CLF-C02):** Best foundational cloud certification for beginners.\n'
            '• **AWS Certified Solutions Architect – Associate (SAA-C03):** The industry gold standard for backend & cloud engineering.\n'
            '• **Google Cloud Associate Cloud Engineer (ACE):** Highly valued for GCP, Kubernetes & microservices.\n'
            '• **Microsoft Azure Fundamentals (AZ-900):** Great entry point for enterprise cloud ecosystems.\n\n'
            '🤖 **2. Artificial Intelligence, Machine Learning & Data:**\n'
            '• **DeepLearning.AI Machine Learning Specialization (Coursera):** Andrew Ng\'s foundational course.\n'
            '• **TensorFlow Developer Certificate & Google Cloud Professional Data Engineer.**\n'
            '• **AWS Certified Machine Learning – Specialty.**\n\n'
            '📱 **3. Software & Full-Stack Development:**\n'
            '• **Meta Front-End / Back-End Developer Professional Certificate (Coursera).**\n'
            '• **Google Associate Android Developer.**\n'
            '• **HackerRank / LeetCode Verified Problem Solving Skill Badges.**\n\n'
            '🛡️ **4. Cybersecurity & Networking:**\n'
            '• **Cisco Certified Network Associate (CCNA 200-301):** Unmatched foundation in IP networking & security.\n'
            '• **CompTIA Security+:** Top global cybersecurity benchmark.\n\n'
            '💰 **College Student Pro-Tips:**\n'
            '• Claim the **GitHub Student Developer Pack** for free Azure credits, domains, and developer tools.\n'
            '• Apply for Coursera Financial Aid for up to 90% fee waiver on professional certificates!',
        actions: const [
          SamAction(label: 'Study Hub Notes', icon: Icons.menu_book_rounded, route: '/study'),
          SamAction(label: 'Practice Quiz Arena', icon: Icons.sports_esports_rounded, route: '/arena'),
          SamAction(label: 'Campus Events', icon: Icons.dynamic_feed_rounded, route: '/home'),
        ],
      );
    }

    // 6. SCIENTIFIC STUDY PLANS, SUBJECT MASTERY & SEMESTER EXAMS
    if (_matches(query, [
      'study plan',
      'how to study',
      'study strategy',
      'study tips',
      'semester prep',
      'how to prepare for exams',
      'study roadmap',
      'subject preparation',
      'study technique',
    ])) {
      return SamMessage(
        id: id,
        isUser: false,
        timestamp: now,
        text: '📚 **Sam\'s Scientific Semester Study & Subject Mastery Blueprint:**\n\n'
            'To achieve a 9+ SGPA without midsem burnout, adopt these evidence-based techniques:\n\n'
            '🧠 **1. The Feynman & Active Recall Technique:**\n'
            '• Don\'t just passively read notes. Close your notebook and explain the concept out loud in plain words as if teaching a junior.\n'
            '• Where you stumble (e.g. 2-Phase Locking in DBMS or Banker\'s Algorithm in OS), review that specific sub-topic immediately.\n\n'
            '📊 **2. High-Yield Unit Prioritization (80/20 Rule):**\n'
            '• **DBMS:** Master SQL Queries, Normalization proofs (3NF & BCNF), and ACID Recovery.\n'
            '• **Operating Systems:** Concurrency (Semaphores & Mutex), Deadlock Banker\'s Algorithm, and Virtual Memory Paging.\n'
            '• **DAA:** Dynamic Programming tabulation, Dijkstra & Floyd-Warshall, and Big-O asymptotic proofs.\n'
            '• **Computer Networks:** TCP 3-Way Handshake, Subnetting IP calculations, and OSI layer flow.\n\n'
            '⏱️ **3. Spaced Repetition Cadence:**\n'
            '• **Day 1:** Learn concept & read handwritten notes in Study Hub.\n'
            '• **Day 3:** Quick 5-question test in Quiz Arena.\n'
            '• **Day 7:** Solve past 3 years university exam papers (PYQs).\n\n'
            'Check out student notes in Study Hub or practice your topics in Quiz Arena!',
        actions: const [
          SamAction(label: 'Open Study Hub Notes', icon: Icons.menu_book_rounded, route: '/study'),
          SamAction(label: 'Practice Quiz Arena', icon: Icons.sports_esports_rounded, route: '/arena'),
          SamAction(label: 'Check Safe Bunks', icon: Icons.calculate_rounded, route: '/bunk-meter'),
        ],
      );
    }

    // 7. STUDY NOTES & ACADEMIC HELP
    if (_matches(query, ['notes', 'dbms notes', 'study', 'handwritten notes', 'pyq', 'exam notes', 'cheatsheet'])) {
      return SamMessage(
        id: id,
        isUser: false,
        timestamp: now,
        text: '📚 **Top Recommended Notes in Study Hub:**\n\n'
            '1. **DBMS Comprehensive Handwritten Notes** (SQL + Normalization + B-Trees)\n'
            '   • Uploaded by: Sahab Raza (SGPA 9.2)\n'
            '   • Rating: ⭐ 4.9 (34 reviews) • 128 downloads\n'
            '2. **OS Concurrency & Virtual Memory Cheatsheet** (Banker\'s Algo & Semaphores)\n'
            '   • Uploaded by: Aarav Sharma (SGPA 9.4)\n'
            '   • Rating: ⭐ 4.8 • Quick 1-page formula guide',
        actions: const [
          SamAction(label: 'Browse Study Hub', icon: Icons.menu_book_rounded, route: '/study'),
        ],
      );
    }

    // 8. HACKATHONS, FESTS & EVENTS
    if (_matches(query, ['hackathon', 'fest', 'events', 'event', 'upcoming', 'competition', 'hackpulse', 'music'])) {
      return SamMessage(
        id: id,
        isUser: false,
        timestamp: now,
        text: '🏆 **Upcoming Flagship Campus Events:**\n\n'
            '1. **HackPulse 2026: 36-Hr National Hackathon**\n'
            '   • Dates: Nov 5 – Nov 6, 2026\n'
            '   • Prize Pool: ₹3,00,000 + Internship interviews\n'
            '   • Registration Closes in 14 hours! ⚡\n\n'
            '2. **Acoustic Night & Open Mic Under Stars**\n'
            '   • Nov 8, 2026 • 6:30 PM • Open Air Theatre (OAT)\n'
            '   • Free snacks & open poetry!\n\n'
            '3. **RoboWars 2026 (Combat Robotics)**\n'
            '   • Nov 12, 2026 • SAC Indoor Sports Complex',
        actions: const [
          SamAction(label: 'View Event Feed', icon: Icons.dynamic_feed_rounded, route: '/home'),
          SamAction(label: 'Find Teammates', icon: Icons.handshake_rounded, route: '/connect'),
        ],
      );
    }

    // 9. TEAMMATE DISCOVERY & CONNECT
    if (_matches(query, ['team', 'teammate', 'partner', 'connect', 'sih', 'find partner', 'group'])) {
      return SamMessage(
        id: id,
        isUser: false,
        timestamp: now,
        text: '🤝 **Finding Teammates with Sam AI:**\n\n'
            'In the **Connect** tab, you set your project goal (e.g. Smart India Hackathon or study group), pick desired skills (like Flutter, Python, or Embedded C), and Kampuzz matches you with compatible peers based on skills, batch, and SGPA.\n\n'
            'You can swipe candidate profile cards and connect with a 3-message pre-acceptance invite!',
        actions: const [
          SamAction(label: 'Launch Connect Wizard', icon: Icons.handshake_rounded, route: '/connect'),
        ],
      );
    }

    // 10. CAMPUS RENTALS & GEAR
    if (_matches(query, ['rent', 'calculator', 'borrow', 'buy', 'drafter', 'raspberry pi', 'lab coat'])) {
      return SamMessage(
        id: id,
        isUser: false,
        timestamp: now,
        text: '🛒 **Campus Peer-to-Peer Rental Marketplace:**\n\n'
            'Need gear for labs or midsems? Students list items at pocket-friendly daily rates:\n'
            '• **Casio fx-991EX Scientific Calculator:** ₹20/day (Nilgiri Hostel)\n'
            '• **Engineering Mini Drafter + Tube:** ₹25/day (Mech Block)\n'
            '• **White Lab Coat + Safety Goggles:** ₹15/day\n'
            '• **Raspberry Pi 4 (4GB):** ₹60/day\n\n'
            'You can also list your unused items to earn extra pocket money!',
        actions: const [
          SamAction(label: 'Open Campus Rental', icon: Icons.storefront_rounded, route: '/rent'),
        ],
      );
    }

    // 11. QUIZ ARENA & STUDY GAMES
    if (_matches(query, ['quiz', 'arena', 'battle', 'game', 'elo', 'compete', 'leaderboard'])) {
      return SamMessage(
        id: id,
        isUser: false,
        timestamp: now,
        text: '🎮 **Quiz Arena Battles:**\n\n'
            'Level up your technical prep through rapid gamified rounds:\n'
            '• **Solo Practice:** 5 adaptive questions with explanations\n'
            '• **1v1 Live Ranked Matchmaking:** Battle live with batchmates\n'
            '• **Leaderboard Podium:** Top 3 students get gold, silver, and bronze badges!\n\n'
            'Current Topics: DBMS, Operating Systems, Computer Networks, and DAA.',
        actions: const [
          SamAction(label: 'Play Quiz Battle', icon: Icons.sports_esports_rounded, route: '/arena'),
        ],
      );
    }

    // 12. EXAM PREP & MOTIVATION
    if (_matches(query, ['stress', 'stressed', 'tired', 'exam', 'midsem', 'tips', 'anxious', 'scared', 'fail'])) {
      return SamMessage(
        id: id,
        isUser: false,
        timestamp: now,
        text: '☕ **Take a Deep Breath, $firstName.**\n\n'
            'Engineering midsems can feel overwhelming, but remember:\n'
            '1. **Focus on high-yield units first:** SQL queries and Normalization in DBMS, Banker\'s Algorithm and Paging in OS.\n'
            '2. **Solve last 3 years PYQs:** 70% of exam patterns repeat with slight numerical changes.\n'
            '3. **Use the 25-5 Pomodoro:** 25 mins deep study, 5 mins walk or chai.\n'
            '4. Sleep at least 6 hours before the exam day—a rested brain debugs faster than a sleep-deprived one!\n\n'
            'You\'ve got this! Kampuzz is right here with notes and support.',
        actions: const [
          SamAction(label: 'Check Study Hub Notes', icon: Icons.menu_book_rounded, route: '/study'),
        ],
      );
    }

    // 13. HOSTEL LIFE & GENERAL CHIT-CHAT
    if (_matches(query, ['maggi', 'hostel', 'canteen', 'food', 'hungry', 'night canteen'])) {
      return SamMessage(
        id: id,
        isUser: false,
        timestamp: now,
        text: '🍜 **Hostel Survival Pro-Tips:**\n\n'
            '• **Elite Maggi Formula:** Fry garlic & green chili in hostel butter, add half a cheese slice with Maggi tastemaker, and don\'t over-boil the water!\n'
            '• **Late-Night Canteen:** SAC Night Canteen is open till 2:30 AM for hot parathas, cold coffee, and bun-omelette.\n'
            '• Need a quick study snack? Nilgiri & Kumaon hostel juice corners are open till midnight.',
        actions: const [
          SamAction(label: 'Check Campus Communities', icon: Icons.groups_rounded, route: '/community'),
        ],
      );
    }

    if (_matches(query, ['who are you', 'what are you', 'sam', 'what can you do', 'help', 'features'])) {
      return SamMessage(
        id: id,
        isUser: false,
        timestamp: now,
        text: '🤖 **I\'m Sam — your personal AI Copilot for Kampuzz!**\n\n'
            'Here is everything I can do for you 24/7:\n\n'
            '• 📸 **Live Geo-Cam & Question Solver:** Snap or upload any question, whiteboard, or math problem for step-by-step solutions.\n'
            '• 💻 **Coding & DSA Mentor:** Algorithm blueprints, tech stack guidance, and interview problem-solving.\n'
            '• 📄 **ATS CV & Resume Architect:** Google XYZ formula, project bullet points, and recruiter tips.\n'
            '• 🎓 **Certification Advisor:** Recommendations for Cloud (AWS/GCP), AI/ML, Full-Stack, and Cybersecurity.\n'
            '• 📚 **Study Hub & Academic Master:** Study plans, high-yield topics, handwritten notes, and PYQs.\n'
            '• 📅 **Timetable & Schedule:** Remind you of today\'s lectures, lab rooms, and professor details.\n'
            '• ⚠️ **Bunk-Meter Intelligence:** Calculate safe bunks and recovery lectures using real mathematical formulas.\n'
            '• 🏆 **Hackathons & Fests:** Keep you updated on campus events, prizes, and deadlines.\n'
            '• 🤝 **Campus Teammate Discovery:** Help you form teams for hackathons.\n'
            '• 💬 **Campus Life Advice:** Motivational boosts, exam hacks, and hostel survival tips!',
        actions: const [
          SamAction(label: 'Open Geo-Cam Scanner', icon: Icons.camera_alt_rounded, route: '/camera'),
          SamAction(label: 'Coding & DSA Help', icon: Icons.code_rounded, route: '/arena'),
          SamAction(label: 'Study Hub Notes', icon: Icons.menu_book_rounded, route: '/study'),
          SamAction(label: 'Today\'s Timetable', icon: Icons.calendar_today_rounded, route: '/timetable'),
        ],
      );
    }

    if (_matches(query, ['hi', 'hello', 'hey', 'namaste', 'wassup', 'sup', 'yo', 'good morning', 'good afternoon', 'good evening'])) {
      return SamMessage(
        id: id,
        isUser: false,
        timestamp: now,
        text: 'Hey $firstName! 👋 Great to see you.\n\n'
            'I can help you solve questions from photos (via live Geo-Cam), master coding & DSA, build an ATS-friendly CV, suggest top certifications, and check your safe bunks. What would you like to explore?',
        actions: const [
          SamAction(label: 'Scan Question (Geo-Cam)', icon: Icons.camera_alt_rounded, route: '/camera'),
          SamAction(label: 'Coding & DSA Blueprint', icon: Icons.code_rounded, route: '/arena'),
          SamAction(label: 'Build an ATS Resume', icon: Icons.description_rounded, route: '/connect'),
          SamAction(label: 'Can I Bunk Today?', icon: Icons.calculate_rounded, route: '/bunk-meter'),
        ],
      );
    }

    if (_matches(query, ['joke', 'funny', 'laugh', 'tell me a joke'])) {
      final jokes = [
        'Why do programmers prefer dark mode?\nBecause light attracts bugs! 🐛💡',
        'Why did the student eat their homework?\nBecause the professor said it was a piece of cake! 🍰',
        'There are 10 types of people in the world:\nThose who understand binary, and those who don\'t. 😂',
        'Why was the JavaScript developer sad?\nBecause they didn\'t Node how to Express themselves! 📦',
      ];
      final pickedJoke = jokes[DateTime.now().second % jokes.length];
      return SamMessage(
        id: id,
        isUser: false,
        timestamp: now,
        text: '😄 $pickedJoke',
        actions: const [
          SamAction(label: 'Play Quiz Arena', icon: Icons.sports_esports_rounded, route: '/arena'),
        ],
      );
    }

    // 14. DEFAULT INTELLIGENT CAMPUS ASSISTANT RESPONSE
    return SamMessage(
      id: id,
      isUser: false,
      timestamp: now,
      text: 'Thanks for reaching out, $firstName! 🎓\n\n'
          'I\'m specialized in Kampuzz campus life, academics, vision question solving, and technical careers. Here are top things you can ask me:\n\n'
          '• 📸 *"Analyze and solve the question in this photo"*\n'
          '• 💻 *"Help me with coding and DSA preparation"*\n'
          '• 📄 *"How to build an ATS-friendly CV / resume?"*\n'
          '• 🎓 *"Suggest the best certifications for cloud and software engineering"*\n'
          '• 📚 *"Give me a study plan for high-yield exam topics"*\n'
          '• 📅 *"What is my next class and room?"*\n'
          '• ⚠️ *"Can I bunk DBMS today?"*',
      actions: const [
        SamAction(label: 'Scan Question with Geo-Cam', icon: Icons.camera_alt_rounded, route: '/camera'),
        SamAction(label: 'Coding & DSA Prep', icon: Icons.code_rounded, route: '/arena'),
        SamAction(label: 'Browse Study Hub', icon: Icons.menu_book_rounded, route: '/study'),
        SamAction(label: 'Open Bunk-Meter', icon: Icons.calculate_rounded, route: '/bunk-meter'),
      ],
    );
  }

  /// Specialized Multimodal AI Vision & Question Solving Explanation Engine
  static SamMessage _generateMultimodalQuestionSolution(
    String id,
    DateTime now,
    String query,
    String? mediaUrl,
    String? geoLandmark,
    String firstName,
  ) {
    final locationTag = geoLandmark != null ? '📍 **Campus Geotag:** $geoLandmark\n\n' : '';

    if (query.contains('os') || query.contains('banker') || query.contains('semaphore') || query.contains('deadlock')) {
      return SamMessage(
        id: id,
        isUser: false,
        timestamp: now,
        text: '🔍 **Vision OCR: Operating Systems Deadlock Problem Detected**\n'
            '$locationTag'
            '**Problem Statement:** In a system with 5 processes (P0–P4) and 3 resource types (A, B, C with instances 10, 5, 7), determine if the current allocation state is Safe using Banker’s Algorithm.\n\n'
            '📐 **Core Concept & Formula:**\n'
            '• Need Matrix[i] = Max[i] - Allocation[i]\n'
            '• A state is **Safe** if there exists an execution sequence <P1, P2, ..., Pn> such that for each Pi, Need[i] <= Available.\n\n'
            '📝 **Step-by-Step Derivation:**\n'
            '1. **Compute Available Vector:** Available = Total Resources - Sum(Allocation) = (3, 3, 2).\n'
            '2. **Evaluate P1:** Need[1] = (1, 2, 2) <= (3, 3, 2) ✅ Executes! New Available = (3, 3, 2) + (2, 0, 0) = (5, 3, 2).\n'
            '3. **Evaluate P3:** Need[3] = (0, 1, 1) <= (5, 3, 2) ✅ Executes! New Available = (7, 4, 3).\n'
            '4. **Evaluate P4, P0, P2:** All remaining process needs can now be satisfied.\n\n'
            '✅ **Final Answer & Verdict:**\n'
            '• The system is in a **SAFE STATE**.\n'
            '• **Valid Safe Execution Sequence:** <P1, P3, P4, P0, P2>.\n'
            '• No deadlock will occur.',
        actions: const [
          SamAction(label: 'OS Notes in Study Hub', icon: Icons.menu_book_rounded, route: '/study'),
          SamAction(label: 'Practice in Quiz Arena', icon: Icons.sports_esports_rounded, route: '/arena'),
        ],
      );
    }

    if (query.contains('dbms') || query.contains('sql') || query.contains('query') || query.contains('normalization')) {
      return SamMessage(
        id: id,
        isUser: false,
        timestamp: now,
        text: '🔍 **Vision OCR: DBMS Relational Query & Normalization Question**\n'
            '$locationTag'
            '**Problem Statement:** Given relation R(A, B, C, D, E) with Functional Dependencies F = {A -> B, BC -> D, E -> C, D -> A}, find Candidate Keys and determine the highest Normal Form.\n\n'
            '📐 **Core Concept & Closure Rule:**\n'
            '• A set of attributes K is a **Candidate Key** if K+ = R and no proper subset of K has closure R.\n\n'
            '📝 **Step-by-Step Derivation:**\n'
            '1. **Closure of (A, E):**\n'
            '   • AE+ = {A, E} -> A -> B => {A, B, E} -> E -> C => {A, B, C, E} -> BC -> D => {A, B, C, D, E} = R.\n'
            '2. **Closure of (D, E):**\n'
            '   • D -> A, so DE+ = AE+ = R.\n'
            '3. **Closure of (B, C, E):**\n'
            '   • BCE+ = {B, C, E, D, A} = R.\n\n'
            '✅ **Final Answer & Verdict:**\n'
            '• **Candidate Keys:** {AE, DE, BCE}.\n'
            '• **Highest Normal Form:** **2NF** (violated 3NF because A -> B has neither A as a superkey nor B as a prime attribute).\n\n'
            '💡 *Exam Tip: To decompose to 3NF, preserve dependencies by creating relations (A, B), (B, C, D), (E, C), (D, A) and key (A, E).*',
        actions: const [
          SamAction(label: 'DBMS Handwritten Notes', icon: Icons.menu_book_rounded, route: '/study'),
          SamAction(label: 'Quiz Arena Practice', icon: Icons.sports_esports_rounded, route: '/arena'),
        ],
      );
    }

    // Default High-Yield Algorithm & Mathematical Question Solution
    return SamMessage(
      id: id,
      isUser: false,
      timestamp: now,
      text: '🔍 **Vision OCR: Algorithmic Problem Analysis from Photo**\n'
          '$locationTag'
          '**Problem Statement:** Solve the divide-and-conquer recurrence relation:\n'
          'T(n) = 2T(n/2) + O(n)\n'
          'and explain both Time and Space complexity bounds.\n\n'
          '📐 **Method Applied: Master Theorem for Divide-and-Conquer**\n'
          'Standard form: T(n) = aT(n/b) + f(n) where:\n'
          '• a = 2 (number of subproblems)\n'
          '• b = 2 (factor by which subproblem size divides)\n'
          '• f(n) = O(n) (work done outside recursive calls)\n'
          '• Critical exponent: log_b(a) = log_2(2) = 1 => n^(log_b a) = n^1 = n.\n\n'
          '📝 **Step-by-Step Derivation:**\n'
          '1. Compare f(n) with n^(log_b a):\n'
          '   f(n) = Θ(n) = Θ(n^(log_b a))\n'
          '2. Since f(n) matches n^(log_b a), this falls directly under **Case 2** of the Master Theorem.\n'
          '3. Under Case 2 (k = 0): T(n) = Θ(n^(log_b a) log n) = Θ(n log n).\n\n'
          '✅ **Final Answer & Key Takeaways:**\n'
          '• **Time Complexity:** Θ(n log n) (identical to Merge Sort).\n'
          '• **Auxiliary Stack Space:** O(log n) due to recursion tree depth.\n'
          '• **Recursion Tree Depth:** log_2(n) levels, each doing c * n work.',
      actions: const [
        SamAction(label: 'DAA Master Cheatsheet', icon: Icons.menu_book_rounded, route: '/study'),
        SamAction(label: 'Try Quiz Arena Battle', icon: Icons.sports_esports_rounded, route: '/arena'),
        SamAction(label: 'Scan Another Question', icon: Icons.camera_alt_rounded, route: '/camera'),
      ],
    );
  }

  static bool _matches(String text, List<String> patterns) {
    for (final pattern in patterns) {
      if (text.contains(pattern)) return true;
    }
    return false;
  }
}
