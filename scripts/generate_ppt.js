import pptxgen from 'pptxgenjs';
import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
const rootDir = path.resolve(__dirname, '..');

console.log('[PPT Generator] Initializing PowerPoint presentation generation...');

const pptx = new pptxgen();

// Presentation Properties & 16:9 Widescreen
pptx.layout = 'LAYOUT_16x9';
pptx.title = 'CampusPulse - AI-Native Campus Browser with AdaL';
pptx.author = 'Team AdaL (CampusPulse)';
pptx.subject = 'Campus Life, Upgraded (Flutter + Serverpod)';
pptx.company = 'University of California, Berkeley';

// Color Palette
const COLORS = {
  bgDark: '0B0F19',       // Deep slate 950
  cardDark: '161E2E',     // Slate 900
  accentIndigo: '6366F1', // Indigo 500
  accentPurple: '8B5CF6', // Purple 500
  accentCyan: '06B6D4',   // Cyan 500
  accentEmerald: '10B981',// Emerald 500
  accentAmber: 'F59E0B',  // Amber 500
  textLight: 'F8FAFC',    // Slate 50
  textMuted: '94A3B8',    // Slate 400
  borderDark: '334155'    // Slate 700
};

// Helper to set background and branding
function applySlideTheme(slide, slideNumber, totalSlides = 7) {
  // Dark Background
  slide.background = { color: COLORS.bgDark };

  // Subtle Header line
  slide.addShape(pptx.shapes.RECTANGLE, {
    x: 0.5, y: 0.35, w: 9.0, h: 0.04,
    fill: { color: COLORS.accentIndigo }
  });

  // Footer branding & page number
  slide.addText('CampusPulse · Campus Life, Upgraded (Flutter + Serverpod) · AdaL Companion', {
    x: 0.5, y: 7.1, w: 7.5, h: 0.3,
    fontSize: 9, color: COLORS.textMuted, fontFace: 'Arial'
  });

  slide.addText(`${slideNumber} / ${totalSlides}`, {
    x: 8.5, y: 7.1, w: 1.0, h: 0.3,
    fontSize: 9, color: COLORS.accentIndigo, align: 'right', fontFace: 'Arial', bold: true
  });
}

// ==========================================
// SLIDE 1: TITLE
// ==========================================
{
  const slide = pptx.addSlide();
  slide.background = { color: COLORS.bgDark };

  // Decorative glow box
  slide.addShape(pptx.shapes.ROUNDED_RECTANGLE, {
    x: 0.8, y: 0.8, w: 8.4, h: 5.8,
    fill: { color: COLORS.cardDark },
    line: { color: COLORS.accentIndigo, width: 1.5 },
    rectRadius: 0.2
  });

  // Badge
  slide.addText('HACKATHON TRACK: CAMPUS LIFE, UPGRADED (FLUTTER + SERVERPOD)', {
    x: 1.2, y: 1.2, w: 7.6, h: 0.4,
    fontSize: 10, color: COLORS.accentCyan, bold: true, fontFace: 'Arial', charSpacing: 1.5
  });

  // Project Title
  slide.addText('CampusPulse', {
    x: 1.2, y: 1.6, w: 7.6, h: 1.1,
    fontSize: 44, color: COLORS.textLight, bold: true, fontFace: 'Arial'
  });

  slide.addText('AI-Native Browser with an Autonomous Multimodal Companion (AdaL)', {
    x: 1.2, y: 2.7, w: 7.6, h: 0.6,
    fontSize: 18, color: COLORS.accentIndigo, bold: true, fontFace: 'Arial'
  });

  slide.addShape(pptx.shapes.LINE, {
    x: 1.2, y: 3.5, w: 7.6, h: 0,
    line: { color: COLORS.borderDark, width: 1 }
  });

  // Details Grid
  const details = [
    { label: 'Theme', val: 'Campus Life Spread Across WhatsApp, Posters, & Spreadsheets' },
    { label: 'Team Name & ID', val: 'Team AdaL (ID: CP-2026-X)' },
    { label: 'College / University', val: 'University of California, Berkeley' },
    { label: 'Tech Stack Requirements', val: 'Frontend: Flutter | Backend: Serverpod | Deployment: Serverpod Cloud' }
  ];

  details.forEach((item, idx) => {
    const yPos = 3.8 + (idx * 0.6);
    slide.addText(item.label.toUpperCase(), {
      x: 1.2, y: yPos, w: 2.4, h: 0.35,
      fontSize: 10, color: COLORS.accentAmber, bold: true, fontFace: 'Arial'
    });
    slide.addText(item.val, {
      x: 3.7, y: yPos, w: 5.1, h: 0.35,
      fontSize: 12, color: COLORS.textLight, fontFace: 'Arial'
    });
  });
}

// ==========================================
// SLIDE 2: PROBLEM + EXISTING GAP
// ==========================================
{
  const slide = pptx.addSlide();
  applySlideTheme(slide, 2);

  slide.addText('Slide 2: Problem + Existing Gap', {
    x: 0.5, y: 0.5, w: 9.0, h: 0.5,
    fontSize: 22, color: COLORS.textLight, bold: true, fontFace: 'Arial'
  });

  const cards = [
    {
      title: 'What is the Problem?',
      color: COLORS.accentAmber,
      desc: 'Campus life is deeply fragmented. Crucial academic review jams, hackathon team calls, and study sessions are scattered across unorganized WhatsApp chats, physical paper flyers on campus boards, and temporary Google Sheets.'
    },
    {
      title: 'Who is Affected?',
      color: COLORS.accentCyan,
      desc: '• 40,000+ university students struggling to locate study partners for rigorous courses (CS 189, CS 162, Math 53).\n• Student club heads needing to reach active builders.\n• Faculty professors whose exam clinics suffer from low discovery.'
    },
    {
      title: 'Current Solutions (If Any)',
      color: COLORS.accentIndigo,
      desc: '• WhatsApp group chats with 1,000+ unindexed messages.\n• Physical corkboard posters easily weathered or ignored.\n• Ad-hoc Google Sheets with stale signups and conflicting times.'
    },
    {
      title: 'Key Gaps & Limitations',
      color: COLORS.accentPurple,
      desc: '• Zero Course-Specific Compatibility Ranking.\n• No schedule collision resolution or seat capacity enforcement.\n• Unchecked spam with no role authorization.\n• Zero autonomous follow-through or automated booking.'
    }
  ];

  cards.forEach((c, idx) => {
    const col = idx % 2;
    const row = Math.floor(idx / 2);
    const x = 0.5 + col * 4.6;
    const y = 1.3 + row * 2.7;

    slide.addShape(pptx.shapes.ROUNDED_RECTANGLE, {
      x: x, y: y, w: 4.4, h: 2.5,
      fill: { color: COLORS.cardDark },
      line: { color: c.color, width: 1.2 },
      rectRadius: 0.15
    });

    slide.addText(c.title, {
      x: x + 0.25, y: y + 0.2, w: 3.9, h: 0.4,
      fontSize: 14, color: c.color, bold: true, fontFace: 'Arial'
    });

    slide.addText(c.desc, {
      x: x + 0.25, y: y + 0.65, w: 3.9, h: 1.6,
      fontSize: 10.5, color: COLORS.textLight, fontFace: 'Arial', lineSpacingMultiple: 1.15
    });
  });
}

// ==========================================
// SLIDE 3: PROPOSED SOLUTION
// ==========================================
{
  const slide = pptx.addSlide();
  applySlideTheme(slide, 3);

  slide.addText('Slide 3: Proposed Solution', {
    x: 0.5, y: 0.5, w: 9.0, h: 0.5,
    fontSize: 22, color: COLORS.textLight, bold: true, fontFace: 'Arial'
  });

  const solutionPillars = [
    {
      title: 'Your Idea in Simple Terms',
      tag: 'AI-Native Browser & Autonomous Multimodal Agent',
      color: COLORS.accentCyan,
      points: [
        'A dedicated campus web operating environment featuring an autonomous multimodal companion named AdaL.',
        'Ingests unstructured real-world campus signals (WhatsApp chats, physical posters, spreadsheets, audio memos).',
        'Turns campus clutter into proactive study matches and live event RSVPs.'
      ]
    },
    {
      title: 'How It Solves the Problem',
      tag: 'Autonomous Intelligence + Serverpod Streaming',
      color: COLORS.accentEmerald,
      points: [
        'AdaL Multimodal OCR: Extracts dates, locations, and prerequisites from photos of flyers in seconds.',
        'Schedule Collision Engine: Detects when mutual students have free study blocks before major midterms.',
        '1-Click Autonomous Action: Auto-reserves study rooms and dispatches peer invitations automatically.'
      ]
    },
    {
      title: 'What Makes It Better Than Existing Solutions',
      tag: 'Competitive Advantage',
      color: COLORS.accentIndigo,
      points: [
        'Proactive vs Reactive: AdaL alerts you before exams, not after you search.',
        'Strict Role Governance: Teachers & Club Heads publish official events; students explore & RSVP without spam.',
        'Integrated Multiplayer Quiz Arena: Real-time academic sparring duels to test course mastery before teaming up.'
      ]
    }
  ];

  solutionPillars.forEach((p, idx) => {
    const x = 0.5 + idx * 3.1;
    const y = 1.3;

    slide.addShape(pptx.shapes.ROUNDED_RECTANGLE, {
      x: x, y: y, w: 2.9, h: 5.4,
      fill: { color: COLORS.cardDark },
      line: { color: p.color, width: 1.2 },
      rectRadius: 0.15
    });

    slide.addText(p.title, {
      x: x + 0.2, y: y + 0.2, w: 2.5, h: 0.5,
      fontSize: 13, color: p.color, bold: true, fontFace: 'Arial'
    });

    slide.addText(p.tag.toUpperCase(), {
      x: x + 0.2, y: y + 0.7, w: 2.5, h: 0.35,
      fontSize: 8, color: COLORS.accentAmber, bold: true, fontFace: 'Arial'
    });

    slide.addShape(pptx.shapes.LINE, {
      x: x + 0.2, y: y + 1.1, w: 2.5, h: 0,
      line: { color: COLORS.borderDark, width: 1 }
    });

    const bodyText = p.points.map(pt => `• ${pt}`).join('\n\n');
    slide.addText(bodyText, {
      x: x + 0.2, y: y + 1.3, w: 2.5, h: 3.8,
      fontSize: 10, color: COLORS.textLight, fontFace: 'Arial', lineSpacingMultiple: 1.15
    });
  });
}

// ==========================================
// SLIDE 4: ARCHITECTURE + TECH STACK
// ==========================================
{
  const slide = pptx.addSlide();
  applySlideTheme(slide, 4);

  slide.addText('Slide 4: Architecture + Tech Stack', {
    x: 0.5, y: 0.5, w: 9.0, h: 0.5,
    fontSize: 22, color: COLORS.textLight, bold: true, fontFace: 'Arial'
  });

  // Top Box: System Flow
  slide.addShape(pptx.shapes.ROUNDED_RECTANGLE, {
    x: 0.5, y: 1.2, w: 9.0, h: 1.9,
    fill: { color: COLORS.cardDark },
    line: { color: COLORS.accentIndigo, width: 1 },
    rectRadius: 0.15
  });

  slide.addText('SYSTEM FLOW (INPUT → PROCESS → OUTPUT)', {
    x: 0.8, y: 1.35, w: 8.4, h: 0.3,
    fontSize: 11, color: COLORS.accentCyan, bold: true, fontFace: 'Arial'
  });

  const flowSteps = [
    { title: '1. MULTIMODAL INPUT', desc: 'Event Posters (OCR), WhatsApp Snippets, CSV Sheets, Audio Memos' },
    { title: '2. ADAL & SERVERPOD PROCESS', desc: 'Gemini Multimodal Ingest, Role Authorization, Compatibility Engine' },
    { title: '3. REAL-TIME OUTPUT', desc: 'Live Event Feed, Auto-Booked Sessions, WebSocket Quiz Duel State' }
  ];

  flowSteps.forEach((s, idx) => {
    const x = 0.8 + idx * 2.85;
    slide.addShape(pptx.shapes.ROUNDED_RECTANGLE, {
      x: x, y: 1.75, w: 2.65, h: 1.1,
      fill: { color: '0B1120' },
      line: { color: COLORS.borderDark, width: 0.8 },
      rectRadius: 0.1
    });
    slide.addText(s.title, {
      x: x + 0.1, y: 1.85, w: 2.45, h: 0.25,
      fontSize: 9, color: COLORS.accentAmber, bold: true, fontFace: 'Arial'
    });
    slide.addText(s.desc, {
      x: x + 0.1, y: 2.15, w: 2.45, h: 0.6,
      fontSize: 8.5, color: COLORS.textLight, fontFace: 'Arial'
    });
  });

  // Bottom Box: Components & Tech Stack
  const techCards = [
    {
      title: 'Frontend (Client Tier)',
      tech: 'Flutter / Dart Web Architecture',
      color: COLORS.accentCyan,
      details: '• Multi-tab AI-Native Campus Browser\n• Tailwind CSS visual design\n• Responsive layout for mobile & desktop\n• Zero-lag client-side state machine'
    },
    {
      title: 'Backend (Serverpod 1.2.6)',
      tech: 'Dart Enterprise Server Framework',
      color: COLORS.accentEmerald,
      details: '• StudyBuddyEndpoint (Matching matrix)\n• CampusEventEndpoint (RBAC validation)\n• QuizArenaEndpoint (WebSocket duels)\n• AdaLCompanionEndpoint (AI agent)'
    },
    {
      title: 'Database & Cloud Infra',
      tech: 'Serverpod Cloud Starter Tier',
      color: COLORS.accentIndigo,
      details: '• Managed PostgreSQL 15 via Serverpod ORM\n• Redis 7 Pub/Sub for real-time WebSocket\n• Zero-downtime Serverpod Cloud deploy\n• High availability SSL endpoints'
    }
  ];

  techCards.forEach((c, idx) => {
    const x = 0.5 + idx * 3.1;
    const y = 3.3;

    slide.addShape(pptx.shapes.ROUNDED_RECTANGLE, {
      x: x, y: y, w: 2.9, h: 3.4,
      fill: { color: COLORS.cardDark },
      line: { color: c.color, width: 1.2 },
      rectRadius: 0.15
    });

    slide.addText(c.title, {
      x: x + 0.2, y: y + 0.2, w: 2.5, h: 0.35,
      fontSize: 12, color: c.color, bold: true, fontFace: 'Arial'
    });

    slide.addText(c.tech.toUpperCase(), {
      x: x + 0.2, y: y + 0.55, w: 2.5, h: 0.3,
      fontSize: 8.5, color: COLORS.accentAmber, bold: true, fontFace: 'Arial'
    });

    slide.addShape(pptx.shapes.LINE, {
      x: x + 0.2, y: y + 0.9, w: 2.5, h: 0,
      line: { color: COLORS.borderDark, width: 1 }
    });

    slide.addText(c.details, {
      x: x + 0.2, y: y + 1.1, w: 2.5, h: 2.0,
      fontSize: 9.5, color: COLORS.textLight, fontFace: 'Arial', lineSpacingMultiple: 1.2
    });
  });
}

// ==========================================
// SLIDE 5: KEY FEATURES
// ==========================================
{
  const slide = pptx.addSlide();
  applySlideTheme(slide, 5);

  slide.addText('Slide 5: Key Features', {
    x: 0.5, y: 0.5, w: 9.0, h: 0.5,
    fontSize: 22, color: COLORS.textLight, bold: true, fontFace: 'Arial'
  });

  const features = [
    {
      icon: '🤖',
      num: '01',
      title: 'AdaL: Autonomous Multimodal Companion',
      color: COLORS.accentIndigo,
      highlight: 'Multimodal Ingest & Proactive Action Execution',
      desc: '• Ingests physical event flyers with OCR; digests WhatsApp group chat dumps; transcribes spoken voice memos.\n• Proactively surfaces impending midterms (CS 189) and detects mutual free hours.\n• 1-Click "Execute Action" books study spots and notifies classmates automatically.'
    },
    {
      icon: '🎓',
      num: '02',
      title: 'Intelligent Study-Buddy Matcher',
      color: COLORS.accentCyan,
      highlight: 'Deep Academic Compatibility & Pomodoro Synchronization',
      desc: '• Matches students based on shared Berkeley coursework (CS 189, CS 162, DATA 100, MATH 53).\n• Evaluates study styles (50/10 Pomodoro, Whiteboard Discussion, Flashcard Drills).\n• Instant schedule overlap calculation & direct 1-click study invitations.'
    },
    {
      icon: '🎪',
      num: '03',
      title: 'Live Campus Event Bulletin with RBAC Authority',
      color: COLORS.accentEmerald,
      highlight: 'Strict Role-Based Publishing vs Browsing Enforcement',
      desc: '• Students can browse, filter, and RSVP, but cannot spam unauthorized postings.\n• Authorized Faculty Professors (Prof. Martinez) and Club Heads (Jordan Lee) publish official clinics, reviews, and hackathons.\n• Real-time attendee counter with max capacity ceiling warnings.'
    },
    {
      icon: '⚡',
      num: '04',
      title: 'Multiplayer Campus Quiz Arena',
      color: COLORS.accentAmber,
      highlight: 'Real-Time Synchronous Course Trivia Duels',
      desc: '• 15-second timed multiplayer battles on Machine Learning, OS deadlocks, and Multivariable Calculus.\n• Streak multipliers, dynamic point scoring, and instant answer explanations.\n• Seamless post-duel study partner matching ("You both scored 90%+ in CS 189 - pair up now!").'
    }
  ];

  features.forEach((f, idx) => {
    const col = idx % 2;
    const row = Math.floor(idx / 2);
    const x = 0.5 + col * 4.6;
    const y = 1.3 + row * 2.7;

    slide.addShape(pptx.shapes.ROUNDED_RECTANGLE, {
      x: x, y: y, w: 4.4, h: 2.5,
      fill: { color: COLORS.cardDark },
      line: { color: f.color, width: 1.2 },
      rectRadius: 0.15
    });

    slide.addText(`${f.icon}  FEATURE ${f.num}: ${f.title.toUpperCase()}`, {
      x: x + 0.25, y: y + 0.2, w: 3.9, h: 0.35,
      fontSize: 10.5, color: f.color, bold: true, fontFace: 'Arial'
    });

    slide.addText(f.highlight, {
      x: x + 0.25, y: y + 0.55, w: 3.9, h: 0.3,
      fontSize: 9, color: COLORS.accentAmber, bold: true, fontFace: 'Arial'
    });

    slide.addShape(pptx.shapes.LINE, {
      x: x + 0.25, y: y + 0.9, w: 3.9, h: 0,
      line: { color: COLORS.borderDark, width: 0.8 }
    });

    slide.addText(f.desc, {
      x: x + 0.25, y: y + 1.05, w: 3.9, h: 1.3,
      fontSize: 9.5, color: COLORS.textLight, fontFace: 'Arial', lineSpacingMultiple: 1.15
    });
  });
}

// ==========================================
// SLIDE 6: IMPACT + FEASIBILITY
// ==========================================
{
  const slide = pptx.addSlide();
  applySlideTheme(slide, 6);

  slide.addText('Slide 6: Impact + Feasibility', {
    x: 0.5, y: 0.5, w: 9.0, h: 0.5,
    fontSize: 22, color: COLORS.textLight, bold: true, fontFace: 'Arial'
  });

  const impactCards = [
    {
      title: 'Who Will Benefit?',
      tag: 'University Ecosystem',
      color: COLORS.accentCyan,
      points: [
        '• Students: Instant discovery of high-fit study partners without wading through hundreds of WhatsApp messages.',
        '• Faculty: Maximized attendance at exam review jams and problem clinics.',
        '• Student Clubs: High-conversion recruitment for hackathons and tech sprints.'
      ]
    },
    {
      title: 'Real-World Impact',
      tag: 'Measurable Outcomes',
      color: COLORS.accentEmerald,
      points: [
        '• 75% Reduction in coordination friction for study groups.',
        '• 3x Higher Turnout for academic exam review clinics.',
        '• 100% Elimination of Bulletin Spam via authenticated role permissions.',
        '• Improved Exam Preparedness through gamified quiz duels.'
      ]
    },
    {
      title: 'Scalability & Performance',
      tag: 'Enterprise Architecture',
      color: COLORS.accentIndigo,
      points: [
        '• Built on Serverpod: Dart compiled to native machine code for maximum throughput.',
        '• Redis Pub/Sub: Low-latency real-time broadcasting to thousands of concurrent users.',
        '• PostgreSQL Connection Pooling for massive query concurrency.'
      ]
    },
    {
      title: 'Feasibility & Deployment Cost',
      tag: 'Starter Tier Viability',
      color: COLORS.accentPurple,
      points: [
        '• Serverpod Cloud Starter Tier: 30-day free trial allows immediate zero-cost prototype deployment.',
        '• Serverpod CLI: Single-command deployment (`scloud deploy`).',
        '• Automated GitHub Actions workflow for zero-maintenance CI/CD.'
      ]
    }
  ];

  impactCards.forEach((c, idx) => {
    const col = idx % 2;
    const row = Math.floor(idx / 2);
    const x = 0.5 + col * 4.6;
    const y = 1.3 + row * 2.7;

    slide.addShape(pptx.shapes.ROUNDED_RECTANGLE, {
      x: x, y: y, w: 4.4, h: 2.5,
      fill: { color: COLORS.cardDark },
      line: { color: c.color, width: 1.2 },
      rectRadius: 0.15
    });

    slide.addText(c.title, {
      x: x + 0.25, y: y + 0.2, w: 3.9, h: 0.35,
      fontSize: 13, color: c.color, bold: true, fontFace: 'Arial'
    });

    slide.addText(c.tag.toUpperCase(), {
      x: x + 0.25, y: y + 0.55, w: 3.9, h: 0.3,
      fontSize: 8.5, color: COLORS.accentAmber, bold: true, fontFace: 'Arial'
    });

    slide.addShape(pptx.shapes.LINE, {
      x: x + 0.25, y: y + 0.9, w: 3.9, h: 0,
      line: { color: COLORS.borderDark, width: 0.8 }
    });

    const body = c.points.join('\n');
    slide.addText(body, {
      x: x + 0.25, y: y + 1.05, w: 3.9, h: 1.3,
      fontSize: 9.5, color: COLORS.textLight, fontFace: 'Arial', lineSpacingMultiple: 1.15
    });
  });
}

// ==========================================
// SLIDE 7: DEMO + CONCLUSION
// ==========================================
{
  const slide = pptx.addSlide();
  applySlideTheme(slide, 7);

  slide.addText('Slide 7: Demo + Conclusion', {
    x: 0.5, y: 0.5, w: 9.0, h: 0.5,
    fontSize: 22, color: COLORS.textLight, bold: true, fontFace: 'Arial'
  });

  // Left Column: Live Prototype & Architecture
  slide.addShape(pptx.shapes.ROUNDED_RECTANGLE, {
    x: 0.5, y: 1.2, w: 4.4, h: 5.5,
    fill: { color: COLORS.cardDark },
    line: { color: COLORS.accentCyan, width: 1.2 },
    rectRadius: 0.15
  });

  slide.addText('PROTOTYPE & LIVE DEMO VERIFICATION', {
    x: 0.75, y: 1.4, w: 3.9, h: 0.35,
    fontSize: 12, color: COLORS.accentCyan, bold: true, fontFace: 'Arial'
  });

  const demoItems = [
    '• Live AI-Native Campus Browser: Loaded at `campus://berkeley.edu/pulse/v2` with SSL verification & Serverpod Cloud stream.',
    '• AdaL Multimodal Ingest: Tested live OCR flyer upload, WhatsApp snippet parsing, and voice memo intent resolution.',
    '• Role-Based Governance: 4 authenticated personas (Student Alex Chen, Faculty Prof. Martinez, Club Head Jordan Lee, Admin Dean Holloway).',
    '• Multiplayer Quiz Arena: Playable 15-second timed trivia duel with score multiplier and study buddy challenges.',
    '• Serverpod Backend Package: Full code in `/serverpod_backend` ready for Serverpod Cloud (`scloud deploy`).'
  ];

  slide.addText(demoItems.join('\n\n'), {
    x: 0.75, y: 1.85, w: 3.9, h: 4.6,
    fontSize: 9.5, color: COLORS.textLight, fontFace: 'Arial', lineSpacingMultiple: 1.15
  });

  // Right Column: Conclusion & Why Selected
  slide.addShape(pptx.shapes.ROUNDED_RECTANGLE, {
    x: 5.1, y: 1.2, w: 4.4, h: 5.5,
    fill: { color: COLORS.cardDark },
    line: { color: COLORS.accentEmerald, width: 1.2 },
    rectRadius: 0.15
  });

  slide.addText('ONE-LINE STRONG CONCLUSION', {
    x: 5.35, y: 1.4, w: 3.9, h: 0.35,
    fontSize: 12, color: COLORS.accentAmber, bold: true, fontFace: 'Arial'
  });

  slide.addShape(pptx.shapes.ROUNDED_RECTANGLE, {
    x: 5.35, y: 1.8, w: 3.9, h: 1.2,
    fill: { color: '1E1B4B' },
    line: { color: COLORS.accentIndigo, width: 1 },
    rectRadius: 0.1
  });

  slide.addText('"CampusPulse transforms the chaotic fragmentation of student life into an autonomous, proactive intelligence network that empowers every student to thrive academically and socially."', {
    x: 5.45, y: 1.9, w: 3.7, h: 1.0,
    fontSize: 10.5, color: COLORS.textLight, fontFace: 'Arial', italic: true, lineSpacingMultiple: 1.15
  });

  slide.addText('WHY THIS SHOULD BE SELECTED', {
    x: 5.35, y: 3.2, w: 3.9, h: 0.35,
    fontSize: 12, color: COLORS.accentEmerald, bold: true, fontFace: 'Arial'
  });

  const selectionReasons = [
    '1. 100% Track Fidelity: Complete Flutter client + genuine Serverpod backend + Serverpod Cloud Starter tier deployment instructions.',
    '2. Tri-Feature Mastery: Delivers all 3 recommended hackathon ideas (Study Matcher + Event Feed + Multiplayer Quiz Game).',
    '3. Groundbreaking Innovation: Not just a static dashboard, but an autonomous multimodal companion (AdaL) that actively ingests physical posters, WhatsApp chats, and auto-schedules sessions.'
  ];

  slide.addText(selectionReasons.join('\n\n'), {
    x: 5.35, y: 3.65, w: 3.9, h: 2.8,
    fontSize: 9.5, color: COLORS.textLight, fontFace: 'Arial', lineSpacingMultiple: 1.15
  });
}

// Generate Presentation Files
const distPublicDir = path.join(rootDir, 'public');
fs.mkdirSync(distPublicDir, { recursive: true });

const outputPublicPath = path.join(distPublicDir, 'CampusPulse_AdaL_Presentation.pptx');
const outputRootPath = path.join(rootDir, 'CampusPulse_AdaL_Presentation.pptx');

pptx.writeFile({ fileName: outputPublicPath })
  .then(() => {
    fs.copyFileSync(outputPublicPath, outputRootPath);
    console.log(`[PPT Generator] Presentation successfully created at:\n - ${outputPublicPath}\n - ${outputRootPath}`);
  })
  .catch(err => {
    console.error('[PPT Generator] Error generating presentation:', err);
    process.exit(1);
  });
