# CampusPulse - Campus Life, Upgraded (Flutter + Serverpod)
## Track: Campus Life, Upgraded (Flutter + Serverpod)

> **Cash Prize Hackathon Submission**
> **Theme**: Student life is spread across WhatsApp groups, posters, spreadsheets, and word of mouth. Finding a study partner, hearing about a campus event, or connecting with peers who share interests is harder than it should be.
> **Solution**: A full-stack campus life platform featuring a **Study-Buddy Matcher**, a **Live Campus Event Feed**, a **Multiplayer Quiz Arena**, and a **Serverpod Cloud Backend**.

---

## 🏆 Key Features

### 1. 🎓 Study-Buddy Matcher
- **Course Compatibility Algorithm**: Matches students across Berkeley courses (`CS 189: Intro to Machine Learning`, `CS 162: Operating Systems`, `MATH 53: Multivariable Calculus`, `DATA 100: Principles of Data Science`).
- **Schedule Overlap & Study Styles**: Filters by Pomodoro (50/10), Whiteboard problem-solving, Flashcards, and preferred campus locations (Moffitt Library, Soda Hall, Jacobs Hall).
- **Instant Pair & Quiz Challenge**: 1-click to send study invites or challenge peers to real-time course trivia duels.

### 2. 🎪 Live Campus Event Feed & Role-Based Publishing Authority
- **Role-Based Authorization Enforcement**:
  - 🎓 **Student Account (Alex Chen)**: Can browse events, register RSVPs, match study buddies, and compete in quiz arena. **Event publishing is strictly restricted**.
  - 👩‍🏫 **Faculty Account (Prof. Sarah Martinez)**: Authorized to publish academic clinics and exam review jams.
  - 🏆 **Club Head Account (Jordan Lee, Mobile Dev Guild)**: Authorized to publish hackathons and club sprints.
  - 🛡️ **Campus Admin Account (Dean Marcus Holloway)**: Authorized for institutional governance and event moderation.
- **Capacity & RSVP Tracking**: Real-time seat occupancy counter and RSVP toggle.

### 3. ⚡ Multiplayer Campus Quiz Arena (Course Trivia Sprint)
- Real-time synchronous multiplayer quiz game across campus subjects:
  - `CS 189: Intro to Machine Learning` (Convex optimization, SVMs, Hinge loss)
  - `CS 162: Operating Systems` (Coffman conditions, concurrency, Pintos)
  - `MATH 53: Multivariable Calculus` (Stokes' theorem, curl & circulation)
  - `DATA 100: Data Science` (Regularization, bias-variance tradeoff)
  - `Campus Lore & Culture` (Moffitt 24-hr cram spaces, Main Stacks)
- Live 15-second timer, streak multiplier, instant answer explanations, and post-game study invite workflow.

### 4. 💬 Direct Messaging & Study Invites
- Real-time conversation threads with matched study partners to schedule study jams and share notes.

---

## ☁️ Serverpod Backend & Serverpod Cloud Deployment

The repository includes a complete production Serverpod project inside `/serverpod_backend`:

```
serverpod_backend/
├── pubspec.yaml                        # Serverpod 1.2.6 dependencies
├── lib/
│   └── src/
│       ├── endpoints/
│       │   ├── study_buddy_endpoint.dart    # Matchmaking & schedule overlap
│       │   ├── campus_event_endpoint.dart   # Role-enforced CRUD & RSVPs
│       │   └── quiz_arena_endpoint.dart     # Multiplayer quiz state machine
│       └── protocol/
│           ├── student_profile.yaml
│           ├── campus_event.yaml
│           ├── quiz_question.yaml
│           └── quiz_session.yaml
├── config/
│   ├── development.yaml
│   ├── production.yaml                 # Configured for Serverpod Cloud Starter Tier
│   └── passwords.yaml
├── docker-compose.yaml                 # Local PostgreSQL 15 & Redis 7
├── deploy_serverpod.sh                 # 1-click Serverpod Cloud deployer
└── README_SERVERPOD_CLOUD.md           # 30-day free trial deployment guide
```

### Deploy to Serverpod Cloud Starter Tier (30-Day Free Trial)
```bash
# 1. Activate Serverpod CLI
dart pub global activate serverpod_cli

# 2. Authenticate
scloud auth login

# 3. Generate protocol & deploy
cd serverpod_backend
serverpod generate
scloud deploy --project campus-pulse
```

---

## 🚀 GitHub Pages Deployment

The frontend is ready for **GitHub Pages** deployment via two workflows:

1. **GitHub Actions**: Push to `main`. The `.github/workflows/deploy.yml` workflow automatically builds and publishes the app.
2. **Docs Folder**: Run `npm run build` and push `/docs` to GitHub, then select `/docs` in repository **Settings > Pages**.
