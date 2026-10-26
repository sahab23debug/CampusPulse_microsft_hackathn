// CampusPulse - Campus Life Upgraded (Flutter + Serverpod Architecture)
// Track: Study-Buddy Matcher, Live Campus Events & Multiplayer Quiz Arena

interface StudentProfile {
  id: string;
  name: string;
  avatar: string;
  major: string;
  department: string;
  year: string;
  semester: string;
  bio: string;
  courses: string[];
  interests: string[];
  lookingFor: string;
  studyStyle: string;
  preferredLocation: string;
  availability: string;
  compatScore: number;
  matchReasons: string[];
  isOnline: boolean;
  isVerified: boolean;
  role: 'student' | 'teacher' | 'club_head' | 'admin';
}

interface CampusEvent {
  id: string;
  title: string;
  organizer: string;
  organizerRole: string;
  category: 'Study Sesh' | 'Hackathon' | 'Workshop' | 'Social';
  dateStr: string;
  location: string;
  room?: string;
  description: string;
  imageUrl: string;
  attendeesCount: number;
  maxCapacity?: number;
  isRsvpd: boolean;
  isFeatured: boolean;
  isOfficial: boolean;
  tags: string[];
  createdByRole: string;
}

interface QuizQuestion {
  id: string;
  course: string;
  topic: string;
  prompt: string;
  options: string[];
  correctIndex: number;
  explanation: string;
}

interface ChatMessage {
  id: string;
  senderId: string;
  senderName: string;
  text: string;
  timestamp: string;
  isStudyInvite?: boolean;
}

// Initial Data
const currentUserStudent: StudentProfile = {
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
  compatScore: 100,
  matchReasons: ['Profile owner'],
  isOnline: true,
  isVerified: true,
  role: 'student'
};

const teacherUser: StudentProfile = {
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
  compatScore: 92,
  matchReasons: ['Course Instructor for CS 189 & CS 162'],
  isOnline: true,
  isVerified: true,
  role: 'teacher'
};

const clubHeadUser: StudentProfile = {
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
  compatScore: 95,
  matchReasons: ['Organizing CalHacks & Mobile Hackathons'],
  isOnline: true,
  isVerified: true,
  role: 'club_head'
};

const adminUser: StudentProfile = {
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
  compatScore: 80,
  matchReasons: ['Campus Administrator Oversight'],
  isOnline: true,
  isVerified: true,
  role: 'admin'
};

const studentsSeed: StudentProfile[] = [
  {
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
    isVerified: true,
    role: 'student'
  },
  {
    id: 'usr_david',
    name: 'David Kim',
    avatar: 'https://images.unsplash.com/photo-1522075469751-3a6694fb2f61?auto=format&fit=crop&w=256&h=256&q=80',
    major: 'Computer Science',
    department: 'EECS Department',
    year: 'Junior (3rd Year)',
    semester: 'Fall 2026',
    bio: 'Full-stack developer competing in upcoming campus hackathons! Looking for teammates to build mobile tools with Flutter & Serverpod.',
    courses: ['CS 162: Operating Systems', 'CS 189: Intro to Machine Learning', 'CS 169A: Software Engineering'],
    interests: ['Distributed Systems', 'Mobile Apps', 'Hackathons', 'Espresso'],
    lookingFor: 'Hackathon Team',
    studyStyle: 'Pair Programming & Sprint Sprints',
    preferredLocation: 'Soda Hall 3rd Floor Alcove',
    availability: 'Friday evenings & all weekend',
    compatScore: 98,
    matchReasons: ['Both taking CS 162 and CS 189', 'Looking for Hackathon teammates right now'],
    isOnline: true,
    isVerified: true,
    role: 'student'
  },
  {
    id: 'usr_elena',
    name: 'Elena Rostova',
    avatar: 'https://images.unsplash.com/photo-1517841905240-472988babdf9?auto=format&fit=crop&w=256&h=256&q=80',
    major: 'Applied Mathematics & Statistics',
    department: 'Mathematics Division',
    year: 'Sophomore (2nd Year)',
    semester: 'Fall 2026',
    bio: 'Math nerd working through multivariable calculus and linear algebra proofs. Flashcards, practice exams, and clear derivations!',
    courses: ['MATH 53: Multivariable Calculus', 'DATA 100: Principles of Data Science', 'STAT 134: Concepts of Probability'],
    interests: ['Statistical Modeling', 'Kaggle', 'Bouldering', 'Classical Piano'],
    lookingFor: 'Exam Prep',
    studyStyle: 'Structured Flashcards & Practice Midterms',
    preferredLocation: 'Evans Hall Math Lounge 8th Floor',
    availability: 'Tues/Thurs 10:00 AM - 4:00 PM',
    compatScore: 88,
    matchReasons: ['Both enrolled in MATH 53 & DATA 100', 'Shared interest in Kaggle & Quantitative modeling'],
    isOnline: false,
    isVerified: true,
    role: 'student'
  },
  {
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
    isVerified: true,
    role: 'student'
  },
  {
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
    isVerified: true,
    role: 'student'
  }
];

const eventsSeed: CampusEvent[] = [
  {
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
    createdByRole: 'teacher'
  },
  {
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
    isOfficial: false,
    tags: ['Dart', 'Flutter', '$5k Prizes', 'Team Formation'],
    createdByRole: 'club_head'
  },
  {
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
    isFeatured: false,
    isOfficial: false,
    tags: ['Live Music', 'Free Cider', 'Relaxation', 'Outdoor'],
    createdByRole: 'club_head'
  },
  {
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
    isFeatured: false,
    isOfficial: true,
    tags: ['CS162', 'Pintos', 'Concurrency', 'Code Clinic'],
    createdByRole: 'teacher'
  }
];

const quizDeck: QuizQuestion[] = [
  {
    id: 'q1',
    course: 'CS 189: Intro to Machine Learning',
    topic: 'Optimization & SVMs',
    prompt: 'Which loss function is minimized in standard Linear Support Vector Machines (SVMs)?',
    options: ['Hinge Loss max(0, 1 - y*wTx)', 'Mean Squared Error (MSE)', 'Binary Cross-Entropy Loss', '0-1 Step Loss'],
    correctIndex: 0,
    explanation: 'SVMs minimize the convex soft-margin Hinge Loss combined with an L2 weight regularization penalty.'
  },
  {
    id: 'q2',
    course: 'CS 162: Operating Systems',
    topic: 'Deadlocks & Synchronization',
    prompt: 'Which of the following is NOT one of the four necessary Coffman conditions for deadlock?',
    options: ['Mutual Exclusion', 'Hold and Wait', 'Preemption Allowed', 'Circular Wait'],
    correctIndex: 2,
    explanation: 'The condition is "No Preemption". If the OS allows preempting locks or resources, deadlocks cannot persist.'
  },
  {
    id: 'q3',
    course: 'MATH 53: Multivariable Calculus',
    topic: 'Vector Theorems',
    prompt: "Stokes' Theorem equates a surface integral of curl F over surface S with what kind of integral around its boundary C?",
    options: ['Volume Integral of div F', 'Line Integral of F · dr', 'Surface Integral of div F', 'Double Integral of F · dS'],
    correctIndex: 1,
    explanation: "Stokes' Theorem: ∬_S (curl F) · dS = ∮_C F · dr, converting surface flux of curl into circulation on boundary C."
  },
  {
    id: 'q4',
    course: 'DATA 100: Principles of Data Science',
    topic: 'Regularization',
    prompt: 'Increasing the L2 regularization hyperparameter λ in Ridge Regression typically has what effect?',
    options: ['Increases Variance, Decreases Bias', 'Decreases Variance, Increases Bias', 'Increases both Bias and Variance', 'Zero change in bias or variance'],
    correctIndex: 1,
    explanation: 'Higher regularization shrinks coefficients toward zero, reducing model variance (overfitting) at the expense of higher bias.'
  },
  {
    id: 'q5',
    course: 'Campus Life & Tech Culture',
    topic: 'Traditions & Study Guilds',
    prompt: 'Which campus venue is famous for 24-hour midterm study sprints, whiteboard pods, and Level C silent stacks?',
    options: ['Moffitt & Doe Main Stacks', 'Hearst Mining Building', 'Kresge Engineering Library', 'Sproul Plaza Hall'],
    correctIndex: 0,
    explanation: 'Moffitt Library 4th/5th floors and the subterranean Gardner (Main) Stacks are the heart of campus cram culture.'
  }
];

class AppManager {
  isLoggedIn: boolean = true;
  userRole: 'student' | 'teacher' | 'club_head' | 'admin' = 'student';
  activeTab: 'browser_matcher' | 'browser_events' | 'browser_quiz' | 'browser_chats' = 'browser_matcher';
  
  // Data
  students: StudentProfile[] = [...studentsSeed];
  events: CampusEvent[] = [...eventsSeed];
  activeChatStudentId: string = 'usr_maya';
  chatMessages: Record<string, ChatMessage[]> = {
    'usr_maya': [
      { id: 'm1', senderId: 'usr_maya', senderName: 'Maya Patel', text: 'Hey Alex! Saw you are studying CS 189 gradient derivations.', timestamp: '2:15 PM' },
      { id: 'm2', senderId: 'usr_me', senderName: 'Alex Chen', text: 'Yes! Are you free to review kernel tricks today at Moffitt?', timestamp: '2:18 PM' },
      { id: 'm3', senderId: 'usr_maya', senderName: 'Maya Patel', text: "Awesome! Let's grab a whiteboard table at Doe Stacks tomorrow at 3 PM.", timestamp: '12m ago' }
    ],
    'usr_david': [
      { id: 'm4', senderId: 'usr_david', senderName: 'David Kim', text: 'Want to team up for the Campus Life Flutter + Serverpod hackathon this weekend?', timestamp: '1h ago' }
    ]
  };

  // Quiz state
  quizCurrentQuestionIndex: number = 0;
  quizSelectedOption: number | null = null;
  quizScore: number = 0;
  quizStreak: number = 0;
  quizTimerSec: number = 15;
  quizTimerInterval: any = null;
  quizIsAnswered: boolean = false;
  quizFinished: boolean = false;
  quizOpponent: string = 'Maya Patel (Live Sparring)';
  quizOpponentScore: number = 0;

  // Filter & Search states
  selectedEventCategory: string = 'All';
  selectedBuddyCourse: string = 'All';

  // Modals
  isCreateEventModalOpen: boolean = false;
  newEventTitle: string = '';
  newEventCategory: 'Study Sesh' | 'Hackathon' | 'Workshop' | 'Social' = 'Study Sesh';
  newEventDate: string = 'Tomorrow, 5:00 PM';
  newEventLocation: string = 'Soda Hall 430';
  newEventDesc: string = '';
  toastMessage: string = '';

  get activeUser(): StudentProfile {
    if (this.userRole === 'teacher') return teacherUser;
    if (this.userRole === 'club_head') return clubHeadUser;
    if (this.userRole === 'admin') return adminUser;
    return currentUserStudent;
  }

  get canPostEvents(): boolean {
    return this.userRole === 'teacher' || this.userRole === 'club_head' || this.userRole === 'admin';
  }

  showToast(msg: string) {
    this.toastMessage = msg;
    this.render();
    setTimeout(() => {
      if (this.toastMessage === msg) {
        this.toastMessage = '';
        this.render();
      }
    }, 3200);
  }

  switchRole(role: 'student' | 'teacher' | 'club_head' | 'admin') {
    this.userRole = role;
    this.showToast(`Switched active portal to: ${this.activeUser.name} (${this.activeUser.year || this.activeUser.department})`);
    this.render();
  }

  // Quiz Arena Methods
  startQuizQuestion() {
    this.quizIsAnswered = false;
    this.quizSelectedOption = null;
    this.quizTimerSec = 15;
    if (this.quizTimerInterval) clearInterval(this.quizTimerInterval);

    this.quizTimerInterval = setInterval(() => {
      if (this.quizTimerSec > 0) {
        this.quizTimerSec--;
        this.renderQuizTimer();
      } else {
        clearInterval(this.quizTimerInterval);
        this.handleQuizAnswer(-1); // timeout
      }
    }, 1000);
  }

  handleQuizAnswer(index: number) {
    if (this.quizIsAnswered || this.quizFinished) return;
    this.quizIsAnswered = true;
    this.quizSelectedOption = index;
    if (this.quizTimerInterval) clearInterval(this.quizTimerInterval);

    const cur = quizDeck[this.quizCurrentQuestionIndex];
    if (index === cur.correctIndex) {
      const points = 100 + (this.quizTimerSec * 15);
      this.quizScore += points;
      this.quizStreak += 1;
      this.showToast(`🔥 Correct! +${points} pts (${this.quizStreak}x Streak)`);
    } else {
      this.quizStreak = 0;
      this.showToast(index === -1 ? '⏰ Time up!' : '❌ Incorrect choice');
    }

    // Opponent random score simulation
    if (Math.random() > 0.3) {
      this.quizOpponentScore += 120;
    }

    this.render();
  }

  nextQuizQuestion() {
    if (this.quizCurrentQuestionIndex < quizDeck.length - 1) {
      this.quizCurrentQuestionIndex++;
      this.startQuizQuestion();
      this.render();
    } else {
      this.quizFinished = true;
      if (this.quizTimerInterval) clearInterval(this.quizTimerInterval);
      this.render();
    }
  }

  restartQuiz() {
    this.quizCurrentQuestionIndex = 0;
    this.quizScore = 0;
    this.quizStreak = 0;
    this.quizOpponentScore = 0;
    this.quizFinished = false;
    this.startQuizQuestion();
    this.render();
  }

  renderQuizTimer() {
    const timerEl = document.getElementById('quiz-timer-display');
    if (timerEl) {
      timerEl.textContent = `${this.quizTimerSec}s`;
      if (this.quizTimerSec <= 5) {
        timerEl.className = 'font-mono text-xs font-bold px-2 py-0.5 rounded bg-rose-500/20 text-rose-300 border border-rose-500/30 animate-pulse';
      } else {
        timerEl.className = 'font-mono text-xs font-bold px-2 py-0.5 rounded bg-amber-500/20 text-amber-300 border border-amber-500/30';
      }
    }
  }

  toggleRsvp(eventId: string) {
    const evt = this.events.find(e => e.id === eventId);
    if (!evt) return;
    evt.isRsvpd = !evt.isRsvpd;
    evt.attendeesCount += evt.isRsvpd ? 1 : -1;
    this.showToast(evt.isRsvpd ? `RSVP Confirmed for: ${evt.title}` : `RSVP Cancelled for: ${evt.title}`);
    this.render();
  }

  postNewEvent() {
    if (!this.canPostEvents) {
      this.showToast('⛔ Access Denied: Only Teachers, Club Heads, and Admins can publish events.');
      return;
    }
    if (!this.newEventTitle.trim()) {
      this.showToast('Please enter an event title.');
      return;
    }

    const created: CampusEvent = {
      id: `evt_${Date.now()}`,
      title: this.newEventTitle.trim(),
      organizer: this.activeUser.name,
      organizerRole: this.activeUser.year || this.activeUser.department,
      category: this.newEventCategory,
      dateStr: this.newEventDate,
      location: this.newEventLocation,
      room: 'Studio / Hall Room',
      description: this.newEventDesc || 'Official campus event published via verified authority role.',
      imageUrl: './assets/images/campus_quad_banner_1792864909368.jpg',
      attendeesCount: 1,
      maxCapacity: 100,
      isRsvpd: true,
      isFeatured: false,
      isOfficial: this.userRole === 'teacher' || this.userRole === 'admin',
      tags: [this.newEventCategory, 'CampusLife'],
      createdByRole: this.userRole
    };

    this.events.unshift(created);
    this.isCreateEventModalOpen = false;
    this.newEventTitle = '';
    this.newEventDesc = '';
    this.showToast(`🎉 Event published to campus feed: "${created.title}"`);
    this.render();
  }

  render() {
    const appEl = document.getElementById('app');
    if (!appEl) return;

    appEl.innerHTML = `
      <div class="min-h-screen bg-slate-950 text-slate-100 flex flex-col font-sans selection:bg-indigo-500 selection:text-white pb-12">
        
        <!-- Toast Notification -->
        ${this.toastMessage ? `
          <div class="fixed top-4 right-4 z-50 flex items-center gap-2 bg-indigo-950/95 border border-indigo-500/40 text-indigo-100 px-4 py-3 rounded-2xl shadow-2xl backdrop-blur-md animate-bounce text-xs font-semibold">
            <span class="text-base">⚡</span>
            <span>${this.toastMessage}</span>
          </div>
        ` : ''}

        <!-- CAMPUS BROWSER HEADER -->
        <header class="bg-slate-900 border-b border-slate-800 sticky top-0 z-40 shadow-xl backdrop-blur-md bg-opacity-95">
          <!-- Window Controls & Omnibar -->
          <div class="px-4 py-2.5 flex flex-wrap items-center justify-between gap-3 border-b border-slate-800/80">
            <div class="flex items-center gap-3">
              <!-- Window Dots -->
              <div class="flex items-center gap-1.5">
                <span class="w-3 h-3 rounded-full bg-rose-500/80 hover:bg-rose-500 cursor-pointer shadow-xs"></span>
                <span class="w-3 h-3 rounded-full bg-amber-500/80 hover:bg-amber-500 cursor-pointer shadow-xs"></span>
                <span class="w-3 h-3 rounded-full bg-emerald-500/80 hover:bg-emerald-500 cursor-pointer shadow-xs"></span>
              </div>
              <span class="text-xs font-black tracking-wider text-slate-300 uppercase">CampusPulse</span>
            </div>

            <!-- Browser URL Bar -->
            <div class="flex-1 max-w-xl mx-auto flex items-center gap-2 bg-slate-950 px-3 py-1.5 rounded-xl border border-slate-700/80 text-xs shadow-inner">
              <span class="text-emerald-400 font-mono text-[11px] flex items-center gap-1">
                🔒 <span>campus://berkeley.edu/pulse</span>
              </span>
              <span class="text-slate-600">|</span>
              <span class="text-[10px] text-slate-400 font-medium truncate hidden md:inline">Campus Life Hub</span>
              <button onclick="window.appManager.render()" class="ml-auto text-slate-400 hover:text-slate-200 cursor-pointer p-0.5" title="Reload Tab">↻</button>
            </div>

            <!-- Role Badge & Switcher -->
            <div class="flex items-center gap-2 shrink-0">
              <span class="text-[11px] text-slate-400 hidden xl:inline">Role:</span>
              <div class="inline-flex rounded-xl p-0.5 bg-slate-950 border border-slate-800">
                <button onclick="window.appManager.switchRole('student')" class="px-2 py-1 rounded-lg text-[11px] font-bold cursor-pointer transition-colors ${this.userRole === 'student' ? 'bg-indigo-600 text-white shadow-xs' : 'text-slate-400 hover:text-slate-200'}">
                  🎓 Student
                </button>
                <button onclick="window.appManager.switchRole('teacher')" class="px-2 py-1 rounded-lg text-[11px] font-bold cursor-pointer transition-colors ${this.userRole === 'teacher' ? 'bg-emerald-600 text-white shadow-xs' : 'text-slate-400 hover:text-slate-200'}">
                  👩‍🏫 Faculty
                </button>
                <button onclick="window.appManager.switchRole('club_head')" class="px-2 py-1 rounded-lg text-[11px] font-bold cursor-pointer transition-colors ${this.userRole === 'club_head' ? 'bg-violet-600 text-white shadow-xs' : 'text-slate-400 hover:text-slate-200'}">
                  🏆 Club Head
                </button>
                <button onclick="window.appManager.switchRole('admin')" class="px-2 py-1 rounded-lg text-[11px] font-bold cursor-pointer transition-colors ${this.userRole === 'admin' ? 'bg-amber-500 text-slate-950 shadow-xs' : 'text-slate-400 hover:text-slate-200'}">
                  🛡️ Admin
                </button>
              </div>
            </div>
          </div>

          <!-- Tab Bar -->
          <div class="px-4 flex items-center gap-1.5 overflow-x-auto no-scrollbar pt-1 text-xs font-semibold">
            <button onclick="window.appManager.activeTab='browser_matcher'; window.appManager.render();" class="px-3.5 py-2 rounded-t-xl cursor-pointer flex items-center gap-2 transition-all ${this.activeTab === 'browser_matcher' ? 'bg-slate-950 text-indigo-400 border-t-2 border-indigo-500 border-x border-slate-800 shadow-md font-bold' : 'text-slate-400 hover:text-slate-200 hover:bg-slate-800/40'}">
              <span>🎓</span>
              <span>Study Matcher</span>
              <span class="px-1.5 py-0.2 rounded-full text-[10px] bg-indigo-950 text-indigo-300 font-mono">98% Fit</span>
            </button>

            <button onclick="window.appManager.activeTab='browser_events'; window.appManager.render();" class="px-3.5 py-2 rounded-t-xl cursor-pointer flex items-center gap-2 transition-all ${this.activeTab === 'browser_events' ? 'bg-slate-950 text-indigo-400 border-t-2 border-indigo-500 border-x border-slate-800 shadow-md font-bold' : 'text-slate-400 hover:text-slate-200 hover:bg-slate-800/40'}">
              <span>🎪</span>
              <span>Campus Events</span>
              <span class="px-1.5 py-0.2 rounded-full text-[10px] bg-slate-800 text-slate-300 font-mono">${this.events.length}</span>
            </button>

            <button onclick="window.appManager.activeTab='browser_quiz'; window.appManager.render();" class="px-3.5 py-2 rounded-t-xl cursor-pointer flex items-center gap-2 transition-all ${this.activeTab === 'browser_quiz' ? 'bg-slate-950 text-amber-400 border-t-2 border-amber-500 border-x border-slate-800 shadow-md font-bold' : 'text-slate-400 hover:text-slate-200 hover:bg-slate-800/40'}">
              <span>⚡</span>
              <span>Multiplayer Quiz Arena</span>
              <span class="px-1.5 py-0.2 rounded-full text-[10px] bg-amber-950 text-amber-300 font-mono">Sprint Duel</span>
            </button>

            <button onclick="window.appManager.activeTab='browser_chats'; window.appManager.render();" class="px-3.5 py-2 rounded-t-xl cursor-pointer flex items-center gap-2 transition-all ${this.activeTab === 'browser_chats' ? 'bg-slate-950 text-indigo-400 border-t-2 border-indigo-500 border-x border-slate-800 shadow-md font-bold' : 'text-slate-400 hover:text-slate-200 hover:bg-slate-800/40'}">
              <span>💬</span>
              <span>Messages & Invites</span>
            </button>
          </div>
        </header>

        <!-- SUB-BAR: ACTIVE ROLE AUTHORITY NOTICE -->
        <div class="px-4 py-2 text-xs flex flex-wrap items-center justify-between gap-3 ${
          this.userRole === 'teacher' ? 'bg-emerald-950/70 border-b border-emerald-800/60 text-emerald-200' :
          this.userRole === 'club_head' ? 'bg-violet-950/70 border-b border-violet-800/60 text-violet-200' :
          this.userRole === 'admin' ? 'bg-amber-950/70 border-b border-amber-800/60 text-amber-200' :
          'bg-slate-900/60 border-b border-slate-800 text-slate-300'
        }">
          <div class="flex items-center gap-2">
            <span class="text-base">${this.userRole === 'teacher' ? '👩‍🏫' : this.userRole === 'club_head' ? '🏆' : this.userRole === 'admin' ? '🛡️' : '🎓'}</span>
            <span class="font-bold">${this.activeUser.name}</span>
            <span class="text-slate-500">·</span>
            <span class="text-xs opacity-90">${this.activeUser.major || this.activeUser.department}</span>
          </div>
          
          <div class="flex items-center gap-2">
            ${this.canPostEvents ? `
              <span class="px-2 py-0.5 rounded text-[11px] font-bold bg-emerald-500/20 text-emerald-300 border border-emerald-500/30">
                ⚡ Authorized Event Publisher
              </span>
              <button onclick="window.appManager.isCreateEventModalOpen=true; window.appManager.render();" class="px-3 py-1 bg-emerald-600 hover:bg-emerald-500 text-white rounded-lg text-xs font-bold cursor-pointer transition-colors shadow-xs">
                + Publish Event
              </button>
            ` : `
              <span class="px-2 py-0.5 rounded text-[11px] font-bold bg-amber-500/20 text-amber-300 border border-amber-500/30">
                🔒 Student View: Event Browsing & RSVPs Only
              </span>
              <span class="text-[11px] text-slate-400 hidden sm:inline">(Switch to Faculty or Club Head to post events)</span>
            `}
          </div>
        </div>

        <!-- MAIN VIEWPORT -->
        <main class="flex-1 max-w-7xl mx-auto w-full px-4 sm:px-6 lg:px-8 py-6 space-y-6">

          <!-- TAB CONTENT ROUTER -->
          ${
            this.activeTab === 'browser_matcher' ? this.renderStudyMatcher() :
            this.activeTab === 'browser_events' ? this.renderCampusEvents() :
            this.activeTab === 'browser_quiz' ? this.renderQuizArena() :
            this.renderChatsSection()
          }

        </main>

        <!-- CREATE EVENT MODAL (RESTRICTED TO TEACHER, CLUB HEAD, ADMIN) -->
        ${this.isCreateEventModalOpen ? this.renderCreateEventModal() : ''}

      </div>
    `;

    // Start timer if in quiz tab and not started
    if (this.activeTab === 'browser_quiz' && !this.quizFinished && !this.quizIsAnswered && this.quizTimerInterval === null) {
      this.startQuizQuestion();
    }
  }

  // TAB 1: STUDY-BUDDY MATCHER
  renderStudyMatcher(): string {
    return `
      <div class="space-y-6">
        <!-- Controls & Search -->
        <div class="flex flex-col sm:flex-row items-stretch sm:items-center justify-between gap-3 bg-slate-900 p-4 rounded-2xl border border-slate-800">
          <div>
            <h3 class="text-base font-bold text-white">Study-Buddy Matcher</h3>
            <p class="text-xs text-slate-400">Matched via Berkeley course overlap, schedule free-blocks, and Pomodoro compatibility.</p>
          </div>
          <div class="flex items-center gap-2">
            <select onchange="window.appManager.selectedBuddyCourse = this.value; window.appManager.render();" class="bg-slate-950 border border-slate-700 text-xs text-slate-200 rounded-xl px-3 py-2 cursor-pointer focus:outline-none">
              <option value="All">All Courses</option>
              <option value="CS 189" ${this.selectedBuddyCourse === 'CS 189' ? 'selected' : ''}>CS 189: Intro to Machine Learning</option>
              <option value="CS 162" ${this.selectedBuddyCourse === 'CS 162' ? 'selected' : ''}>CS 162: Operating Systems</option>
              <option value="MATH 53" ${this.selectedBuddyCourse === 'MATH 53' ? 'selected' : ''}>MATH 53: Multivariable Calculus</option>
              <option value="DATA 100" ${this.selectedBuddyCourse === 'DATA 100' ? 'selected' : ''}>DATA 100: Data Science</option>
            </select>
          </div>
        </div>

        <!-- Student Cards Grid -->
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-5">
          ${this.students
            .filter(s => this.selectedBuddyCourse === 'All' || s.courses.some(c => c.includes(this.selectedBuddyCourse)))
            .map(s => `
              <div class="bg-slate-900 rounded-2xl border border-slate-800 p-5 space-y-4 hover:border-indigo-500/50 transition-all flex flex-col justify-between shadow-lg">
                <div class="space-y-3">
                  <div class="flex items-start justify-between gap-3">
                    <div class="flex items-center gap-3">
                      <img src="${s.avatar}" alt="${s.name}" class="w-12 h-12 rounded-xl object-cover ring-2 ring-slate-800">
                      <div>
                        <div class="flex items-center gap-1.5">
                          <h4 class="text-sm font-bold text-white">${s.name}</h4>
                          ${s.isVerified ? '<span class="text-indigo-400 text-xs" title="Verified Campus Student">✓</span>' : ''}
                        </div>
                        <p class="text-[11px] text-slate-400">${s.major}</p>
                        <p class="text-[10px] text-slate-500">${s.year}</p>
                      </div>
                    </div>
                    <div class="text-right shrink-0">
                      <span class="inline-block px-2 py-0.5 rounded-lg text-xs font-black bg-indigo-500/20 text-indigo-300 border border-indigo-500/30">
                        ${s.compatScore}% Match
                      </span>
                    </div>
                  </div>

                  <p class="text-xs text-slate-300 line-clamp-2 leading-relaxed">${s.bio}</p>

                  <!-- Courses -->
                  <div class="space-y-1">
                    <span class="text-[10px] font-bold uppercase tracking-wider text-slate-500">Enrolled Courses:</span>
                    <div class="flex flex-wrap gap-1">
                      ${s.courses.map(c => `
                        <span class="px-2 py-0.5 rounded-md text-[10px] font-semibold bg-slate-950 text-indigo-300 border border-slate-800">
                          ${c}
                        </span>
                      `).join('')}
                    </div>
                  </div>

                  <!-- Schedule & Preferred Spot -->
                  <div class="bg-slate-950 rounded-xl p-2.5 border border-slate-800/80 space-y-1 text-[11px]">
                    <div class="flex items-center justify-between text-slate-400">
                      <span>🕒 Availability:</span>
                      <span class="text-slate-200 font-medium">${s.availability}</span>
                    </div>
                    <div class="flex items-center justify-between text-slate-400">
                      <span>📍 Preferred Spot:</span>
                      <span class="text-slate-200 font-medium">${s.preferredLocation}</span>
                    </div>
                    <div class="flex items-center justify-between text-slate-400">
                      <span>🎯 Study Style:</span>
                      <span class="text-indigo-300 font-medium">${s.studyStyle}</span>
                    </div>
                  </div>
                </div>

                <div class="pt-2 flex items-center gap-2">
                  <button onclick="window.appManager.activeTab='browser_quiz'; window.appManager.quizOpponent='${s.name}'; window.appManager.restartQuiz();" class="flex-1 px-3 py-2 bg-amber-600/20 hover:bg-amber-600/30 text-amber-300 border border-amber-500/40 rounded-xl text-xs font-bold cursor-pointer transition-colors text-center">
                    ⚡ Quiz Duel
                  </button>
                  <button onclick="window.appManager.activeTab='browser_chats'; window.appManager.activeChatStudentId='${s.id}'; window.appManager.render();" class="flex-1 px-3 py-2 bg-indigo-600 hover:bg-indigo-500 text-white rounded-xl text-xs font-bold cursor-pointer transition-colors text-center shadow-xs">
                    💬 Study Invite
                  </button>
                </div>
              </div>
            `).join('')}
        </div>
      </div>
    `;
  }

  // TAB 2: CAMPUS EVENT FEED
  renderCampusEvents(): string {
    return `
      <div class="space-y-6">
        <!-- Controls & Categories -->
        <div class="flex flex-col sm:flex-row items-stretch sm:items-center justify-between gap-3 bg-slate-900 p-4 rounded-2xl border border-slate-800">
          <div>
            <h3 class="text-base font-bold text-white">Live Campus Event Bulletin</h3>
            <p class="text-xs text-slate-400">Verified study sessions, hackathons, and department clinics.</p>
          </div>
          
          <div class="flex items-center gap-2">
            <div class="flex rounded-xl p-0.5 bg-slate-950 border border-slate-800 text-xs">
              ${['All', 'Study Sesh', 'Hackathon', 'Workshop', 'Social'].map(cat => `
                <button onclick="window.appManager.selectedEventCategory='${cat}'; window.appManager.render();" class="px-2.5 py-1 rounded-lg font-semibold cursor-pointer transition-colors ${this.selectedEventCategory === cat ? 'bg-indigo-600 text-white' : 'text-slate-400 hover:text-slate-200'}">
                  ${cat}
                </button>
              `).join('')}
            </div>

            ${this.canPostEvents ? `
              <button onclick="window.appManager.isCreateEventModalOpen=true; window.appManager.render();" class="px-3 py-1.5 bg-emerald-600 hover:bg-emerald-500 text-white rounded-xl text-xs font-bold cursor-pointer transition-colors shadow-xs">
                + New Event
              </button>
            ` : ''}
          </div>
        </div>

        <!-- Event Grid -->
        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
          ${this.events
            .filter(e => this.selectedEventCategory === 'All' || e.category === this.selectedEventCategory)
            .map(e => `
              <div class="bg-slate-900 rounded-2xl border border-slate-800 overflow-hidden flex flex-col justify-between shadow-xl hover:border-indigo-500/40 transition-all">
                <div>
                  <div class="relative h-48 w-full overflow-hidden bg-slate-950">
                    <img src="${e.imageUrl}" alt="${e.title}" class="w-full h-full object-cover">
                    <div class="absolute inset-0 bg-gradient-to-t from-slate-950 via-slate-950/30 to-transparent"></div>
                    
                    <div class="absolute top-3 left-3 flex items-center gap-1.5">
                      <span class="px-2.5 py-1 rounded-lg text-[10px] font-black uppercase tracking-wider bg-slate-950/80 backdrop-blur-md text-indigo-300 border border-slate-700">
                        ${e.category}
                      </span>
                      ${e.isOfficial ? `
                        <span class="px-2 py-1 rounded-lg text-[10px] font-bold bg-emerald-950/80 backdrop-blur-md text-emerald-300 border border-emerald-700">
                          ✓ Official Faculty
                        </span>
                      ` : ''}
                    </div>

                    <div class="absolute bottom-3 left-3 right-3 flex items-center justify-between text-xs text-slate-300">
                      <span class="font-semibold flex items-center gap-1">
                        📍 ${e.location} ${e.room ? `(${e.room})` : ''}
                      </span>
                      <span class="bg-slate-950/80 px-2 py-0.5 rounded font-mono text-[11px] border border-slate-800">
                        ${e.attendeesCount} / ${e.maxCapacity || '∞'} Seats
                      </span>
                    </div>
                  </div>

                  <div class="p-5 space-y-3">
                    <div class="flex items-center justify-between text-xs text-indigo-400 font-semibold">
                      <span>🕒 ${e.dateStr}</span>
                      <span class="text-slate-400">By: ${e.organizer}</span>
                    </div>

                    <h4 class="text-base font-bold text-white">${e.title}</h4>
                    <p class="text-xs text-slate-300 leading-relaxed">${e.description}</p>

                    <!-- Tags -->
                    <div class="flex flex-wrap gap-1.5 pt-1">
                      ${e.tags.map(t => `
                        <span class="px-2 py-0.5 rounded-md text-[10px] font-medium bg-slate-950 text-slate-400 border border-slate-800">
                          #${t}
                        </span>
                      `).join('')}
                    </div>
                  </div>
                </div>

                <div class="p-5 pt-0 border-t border-slate-800/80 mt-4 flex items-center justify-between gap-3">
                  <div class="text-[11px] text-slate-400">
                    ${e.isRsvpd ? '<span class="text-emerald-400 font-bold">✓ You are attending</span>' : 'Seats available'}
                  </div>
                  <button onclick="window.appManager.toggleRsvp('${e.id}')" class="px-4 py-2 rounded-xl text-xs font-bold cursor-pointer transition-colors shadow-xs ${
                    e.isRsvpd ? 'bg-slate-800 hover:bg-slate-700 text-rose-300 border border-slate-700' : 'bg-indigo-600 hover:bg-indigo-500 text-white'
                  }">
                    ${e.isRsvpd ? 'Cancel RSVP' : 'Register / RSVP ➔'}
                  </button>
                </div>
              </div>
            `).join('')}
        </div>
      </div>
    `;
  }

  // TAB 3: MULTIPLAYER QUIZ ARENA (TRACK IDEA 3)
  renderQuizArena(): string {
    const cur = quizDeck[this.quizCurrentQuestionIndex];

    if (this.quizFinished) {
      const isWinner = this.quizScore >= this.quizOpponentScore;
      return `
        <div class="max-w-2xl mx-auto bg-slate-900 rounded-3xl border border-slate-800 p-8 text-center space-y-6 shadow-2xl">
          <div class="text-5xl">${isWinner ? '🏆' : '🎖️'}</div>
          <div>
            <h3 class="text-2xl font-extrabold text-white">${isWinner ? 'Victory! Quiz Sprint Champion' : 'Well Played! Duel Completed'}</h3>
            <p class="text-xs text-slate-400 mt-1">Multiplayer sprint score synced to live campus leaderboard.</p>
          </div>

          <div class="grid grid-cols-2 gap-4 bg-slate-950 p-4 rounded-2xl border border-slate-800">
            <div>
              <span class="text-[11px] text-slate-400 uppercase tracking-wider block">Your Score</span>
              <span class="text-2xl font-black text-indigo-400">${this.quizScore} pts</span>
            </div>
            <div>
              <span class="text-[11px] text-slate-400 uppercase tracking-wider block">${this.quizOpponent}</span>
              <span class="text-2xl font-black text-amber-400">${this.quizOpponentScore} pts</span>
            </div>
          </div>

          <div class="p-4 bg-indigo-950/40 rounded-2xl border border-indigo-500/30 text-xs text-indigo-200">
            🤝 Study-Buddy Recommendation: You both demonstrated high competency in <strong>${cur.course}</strong>. Recommended: Connect with each other for exam prep and study sessions!
          </div>

          <div class="flex items-center justify-center gap-3">
            <button onclick="window.appManager.restartQuiz()" class="px-5 py-2.5 bg-indigo-600 hover:bg-indigo-500 text-white rounded-xl text-xs font-bold cursor-pointer shadow-lg transition-colors">
              Play Rematch ↺
            </button>
            <button onclick="window.appManager.activeTab='browser_matcher'; window.appManager.render();" class="px-5 py-2.5 bg-slate-800 hover:bg-slate-700 text-slate-200 rounded-xl text-xs font-bold cursor-pointer border border-slate-700 transition-colors">
              View Study Buddies
            </button>
          </div>
        </div>
      `;
    }

    return `
      <div class="max-w-3xl mx-auto space-y-6">
        <!-- Match Header Banner -->
        <div class="bg-slate-900 rounded-2xl border border-slate-800 p-4 flex flex-wrap items-center justify-between gap-4 shadow-xl">
          <div class="flex items-center gap-3">
            <div class="w-10 h-10 rounded-xl bg-amber-500/20 border border-amber-500/40 flex items-center justify-center text-amber-300 text-lg font-black">
              ⚡
            </div>
            <div>
              <div class="flex items-center gap-2">
                <h3 class="text-sm font-extrabold text-white">Campus Quiz Duel: Course Trivia Sprint</h3>
                <span class="px-2 py-0.5 rounded text-[10px] font-bold bg-amber-500/20 text-amber-300 border border-amber-500/30">
                  Question ${this.quizCurrentQuestionIndex + 1} of ${quizDeck.length}
                </span>
              </div>
              <p class="text-xs text-slate-400">${cur.course} · ${cur.topic}</p>
            </div>
          </div>

          <!-- Duel Scoreboard & Timer -->
          <div class="flex items-center gap-4">
            <div class="text-right">
              <span class="text-[10px] text-slate-400 block">Score: <strong class="text-indigo-400">${this.quizScore}</strong> | Opponent: <strong class="text-amber-400">${this.quizOpponentScore}</strong></span>
              <span class="text-[10px] text-emerald-400 font-bold">${this.quizStreak > 1 ? `🔥 ${this.quizStreak}x Streak Bonus` : 'Ready'}</span>
            </div>
            <div id="quiz-timer-display" class="font-mono text-xs font-bold px-2.5 py-1 rounded-xl bg-amber-500/20 text-amber-300 border border-amber-500/30">
              ${this.quizTimerSec}s
            </div>
          </div>
        </div>

        <!-- Question Card -->
        <div class="bg-slate-900 rounded-3xl border border-slate-800 p-6 sm:p-8 space-y-6 shadow-2xl">
          <h4 class="text-base sm:text-lg font-bold text-white leading-relaxed">
            ${cur.prompt}
          </h4>

          <!-- Options -->
          <div class="space-y-3">
            ${cur.options.map((opt, idx) => {
              let optClass = 'bg-slate-950 border-slate-800 text-slate-200 hover:border-indigo-500/60 hover:bg-slate-800/60';
              if (this.quizIsAnswered) {
                if (idx === cur.correctIndex) {
                  optClass = 'bg-emerald-950 border-emerald-500 text-emerald-100 font-bold';
                } else if (idx === this.quizSelectedOption) {
                  optClass = 'bg-rose-950 border-rose-500 text-rose-100 line-through';
                } else {
                  optClass = 'bg-slate-950 border-slate-800 text-slate-500 opacity-50';
                }
              }

              return `
                <button onclick="window.appManager.handleQuizAnswer(${idx})" ${this.quizIsAnswered ? 'disabled' : ''} class="w-full text-left p-4 rounded-2xl border text-xs sm:text-sm font-medium transition-all flex items-center justify-between cursor-pointer ${optClass}">
                  <span>${opt}</span>
                  <span class="text-xs font-mono opacity-60">[Key ${idx + 1}]</span>
                </button>
              `;
            }).join('')}
          </div>

          <!-- Explanation Drawer -->
          ${this.quizIsAnswered ? `
            <div class="p-4 bg-slate-950 rounded-2xl border border-slate-800 space-y-2 text-xs">
              <span class="font-bold text-indigo-400 block">Explanation:</span>
              <p class="text-slate-300 leading-relaxed">${cur.explanation}</p>
              <div class="pt-2 flex justify-end">
                <button onclick="window.appManager.nextQuizQuestion()" class="px-5 py-2 bg-indigo-600 hover:bg-indigo-500 text-white rounded-xl text-xs font-bold cursor-pointer shadow-md transition-colors">
                  Next Question ➔
                </button>
              </div>
            </div>
          ` : ''}
        </div>
      </div>
    `;
  }

  // TAB 4: CHATS & INVITES
  renderChatsSection(): string {
    const student = this.students.find(s => s.id === this.activeChatStudentId) || this.students[0];
    const messages = this.chatMessages[this.activeChatStudentId] || [];

    return `
      <div class="max-w-4xl mx-auto bg-slate-900 rounded-3xl border border-slate-800 overflow-hidden shadow-2xl flex flex-col md:flex-row h-[600px]">
        <!-- Conversations List -->
        <div class="w-full md:w-72 bg-slate-950 border-r border-slate-800 flex flex-col">
          <div class="p-4 border-b border-slate-800">
            <h4 class="text-xs font-bold text-white uppercase tracking-wider">Study Connections</h4>
          </div>
          <div class="flex-1 overflow-y-auto p-2 space-y-1">
            ${this.students.map(s => `
              <button onclick="window.appManager.activeChatStudentId='${s.id}'; window.appManager.render();" class="w-full p-2.5 rounded-xl text-left flex items-center gap-3 transition-colors cursor-pointer ${
                this.activeChatStudentId === s.id ? 'bg-indigo-600/20 text-indigo-300 border border-indigo-500/30' : 'hover:bg-slate-900 text-slate-300'
              }">
                <img src="${s.avatar}" alt="${s.name}" class="w-9 h-9 rounded-lg object-cover">
                <div class="truncate">
                  <span class="text-xs font-bold block truncate">${s.name}</span>
                  <span class="text-[10px] text-slate-400 truncate block">${s.courses[0]}</span>
                </div>
              </button>
            `).join('')}
          </div>
        </div>

        <!-- Chat Viewport -->
        <div class="flex-1 flex flex-col bg-slate-900">
          <div class="p-4 border-b border-slate-800 flex items-center justify-between">
            <div class="flex items-center gap-3">
              <img src="${student.avatar}" alt="${student.name}" class="w-10 h-10 rounded-xl object-cover">
              <div>
                <h4 class="text-xs font-bold text-white">${student.name}</h4>
                <p class="text-[10px] text-emerald-400">Online · ${student.preferredLocation}</p>
              </div>
            </div>
            <button onclick="window.appManager.activeTab='browser_quiz'; window.appManager.quizOpponent='${student.name}'; window.appManager.restartQuiz();" class="px-3 py-1 bg-amber-600/20 hover:bg-amber-600/30 text-amber-300 border border-amber-500/40 rounded-lg text-xs font-bold cursor-pointer">
              ⚡ Challenge to Quiz
            </button>
          </div>

          <!-- Messages -->
          <div class="flex-1 p-4 overflow-y-auto space-y-3">
            ${messages.map(m => `
              <div class="flex flex-col ${m.senderId === 'usr_me' ? 'items-end' : 'items-start'}">
                <div class="max-w-[75%] p-3 rounded-2xl text-xs leading-relaxed ${
                  m.senderId === 'usr_me' ? 'bg-indigo-600 text-white rounded-br-none shadow-md' : 'bg-slate-800 text-slate-200 rounded-bl-none border border-slate-700'
                }">
                  ${m.text}
                </div>
                <span class="text-[9px] text-slate-500 mt-0.5 px-1">${m.timestamp}</span>
              </div>
            `).join('')}
          </div>

          <!-- Input Box -->
          <div class="p-3 border-t border-slate-800 bg-slate-950 flex items-center gap-2">
            <input id="chat-input-box" type="text" placeholder="Message ${student.name} or schedule study session..." class="flex-1 bg-slate-900 border border-slate-700 rounded-xl px-3 py-2 text-xs text-white focus:outline-none focus:border-indigo-500" onkeydown="if(event.key==='Enter') {
              const val = this.value.trim();
              if(val) {
                window.appManager.chatMessages['${student.id}'] = window.appManager.chatMessages['${student.id}'] || [];
                window.appManager.chatMessages['${student.id}'].push({
                  id: 'm_' + Date.now(),
                  senderId: 'usr_me',
                  senderName: 'Alex Chen',
                  text: val,
                  timestamp: 'Just now'
                });
                this.value = '';
                window.appManager.render();
              }
            }">
            <button onclick="
              const box = document.getElementById('chat-input-box');
              if(box && box.value.trim()) {
                window.appManager.chatMessages['${student.id}'] = window.appManager.chatMessages['${student.id}'] || [];
                window.appManager.chatMessages['${student.id}'].push({
                  id: 'm_' + Date.now(),
                  senderId: 'usr_me',
                  senderName: 'Alex Chen',
                  text: box.value.trim(),
                  timestamp: 'Just now'
                });
                box.value = '';
                window.appManager.render();
              }
            " class="px-4 py-2 bg-indigo-600 hover:bg-indigo-500 text-white rounded-xl text-xs font-bold cursor-pointer transition-colors shadow-xs">
              Send
            </button>
          </div>
        </div>
      </div>
    `;
  }

  // CREATE EVENT MODAL
  renderCreateEventModal(): string {
    return `
      <div class="fixed inset-0 z-50 bg-black/80 backdrop-blur-sm flex items-center justify-center p-4">
        <div class="bg-slate-900 border border-slate-700 max-w-lg w-full rounded-3xl p-6 space-y-5 shadow-2xl">
          <div class="flex items-center justify-between">
            <div class="flex items-center gap-2">
              <span class="text-xl">🎪</span>
              <h3 class="text-base font-extrabold text-white">Publish Verified Campus Event</h3>
            </div>
            <button onclick="window.appManager.isCreateEventModalOpen=false; window.appManager.render();" class="text-slate-400 hover:text-slate-200 cursor-pointer">✕</button>
          </div>

          <div class="p-3 rounded-xl bg-slate-950 border border-slate-800 text-xs flex items-center gap-2 text-slate-300">
            <span class="text-base">${this.userRole === 'teacher' ? '👩‍🏫' : this.userRole === 'club_head' ? '🏆' : '🛡️'}</span>
            <span>Publishing as: <strong class="text-white">${this.activeUser.name}</strong> (${this.activeUser.year || this.activeUser.department})</span>
          </div>

          <div class="space-y-3 text-xs">
            <div>
              <label class="font-bold text-slate-300 block mb-1">Event Title</label>
              <input type="text" placeholder="e.g. CS 189 Final Exam Prep Jam" class="w-full bg-slate-950 border border-slate-700 rounded-xl px-3 py-2 text-white focus:outline-none focus:border-indigo-500" oninput="window.appManager.newEventTitle=this.value">
            </div>

            <div class="grid grid-cols-2 gap-3">
              <div>
                <label class="font-bold text-slate-300 block mb-1">Category</label>
                <select class="w-full bg-slate-950 border border-slate-700 rounded-xl px-3 py-2 text-white focus:outline-none" onchange="window.appManager.newEventCategory=this.value">
                  <option value="Study Sesh">Study Sesh</option>
                  <option value="Hackathon">Hackathon</option>
                  <option value="Workshop">Workshop</option>
                  <option value="Social">Social</option>
                </select>
              </div>
              <div>
                <label class="font-bold text-slate-300 block mb-1">Date & Time</label>
                <input type="text" value="Tomorrow, 5:00 PM – 7:30 PM" class="w-full bg-slate-950 border border-slate-700 rounded-xl px-3 py-2 text-white focus:outline-none focus:border-indigo-500" oninput="window.appManager.newEventDate=this.value">
              </div>
            </div>

            <div>
              <label class="font-bold text-slate-300 block mb-1">Location & Room</label>
              <input type="text" value="Soda Hall - Wozniak Lounge Room 430" class="w-full bg-slate-950 border border-slate-700 rounded-xl px-3 py-2 text-white focus:outline-none focus:border-indigo-500" oninput="window.appManager.newEventLocation=this.value">
            </div>

            <div>
              <label class="font-bold text-slate-300 block mb-1">Description & Prerequisites</label>
              <textarea rows="3" placeholder="Explain agenda, whiteboard focus, or required materials..." class="w-full bg-slate-950 border border-slate-700 rounded-xl px-3 py-2 text-white focus:outline-none focus:border-indigo-500" oninput="window.appManager.newEventDesc=this.value"></textarea>
            </div>
          </div>

          <div class="flex items-center justify-end gap-3 pt-2">
            <button onclick="window.appManager.isCreateEventModalOpen=false; window.appManager.render();" class="px-4 py-2 bg-slate-800 hover:bg-slate-700 text-slate-300 rounded-xl text-xs font-semibold cursor-pointer">
              Cancel
            </button>
            <button onclick="window.appManager.postNewEvent()" class="px-5 py-2 bg-emerald-600 hover:bg-emerald-500 text-white rounded-xl text-xs font-bold cursor-pointer shadow-lg transition-colors">
              Publish Event ➔
            </button>
          </div>
        </div>
      </div>
    `;
  }
}

// Global initialization
const appManager = new AppManager();
(window as any).appManager = appManager;

document.addEventListener('DOMContentLoaded', () => {
  appManager.render();
});

// Also trigger immediately in case DOM is already loaded
if (document.readyState === 'complete' || document.readyState === 'interactive') {
  appManager.render();
}
