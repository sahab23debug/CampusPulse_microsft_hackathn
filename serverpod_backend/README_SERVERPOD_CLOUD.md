# CampusPulse Serverpod Backend & Serverpod Cloud Deployment Guide

This backend powers **CampusPulse** for the hackathon track:
**Campus Life, Upgraded (Flutter + Serverpod)**.

## Architecture Highlights
- **Framework**: [Serverpod](https://serverpod.dev/) (Dart Enterprise Full-Stack Backend)
- **Deployment Target**: **Serverpod Cloud Starter Tier** (30-day free trial)
- **Database**: Managed PostgreSQL with Serverpod ORM & automatic migration engine
- **Cache & Message Broker**: Redis pub/sub for real-time WebSocket communication
- **Endpoints**:
  1. `StudyBuddyEndpoint`: Matchmaking algorithm, schedule overlap calculation, compatibility matrix.
  2. `CampusEventEndpoint`: Event creation, role-based authorization (strict protection: only Teachers, Club Heads, and Admins can publish; normal students can browse & RSVP), live attendee counters.
  3. `QuizArenaEndpoint`: Multiplayer real-time quiz game room state machine, countdown timers, streak scoring, and study invite flow.

---

## 30-Day Free Trial: Deploying to Serverpod Cloud Starter Tier

Serverpod Cloud provides managed deployments for Serverpod backends with free starter tier availability.

### Step 1: Install Dart SDK & Serverpod CLI
```bash
# Verify Dart 3.0+
dart --version

# Activate Serverpod CLI & Serverpod Cloud tool
dart pub global activate serverpod_cli
```

### Step 2: Sign Up & Claim Starter Tier Free Trial
1. Visit [https://cloud.serverpod.dev](https://cloud.serverpod.dev)
2. Sign up with your GitHub account.
3. Create a new project named `campus-pulse`.
4. Select the **Starter Tier (30-Day Free Trial)**.

### Step 3: Authenticate CLI
```bash
# In your terminal
scloud auth login
```
Follow the browser prompt to authorize your workstation.

### Step 4: Generate Protocols & Create Migrations
```bash
cd serverpod_backend
serverpod generate
serverpod create-migration
```

### Step 5: Configure Cloud Secrets
In your Serverpod Cloud dashboard or via CLI:
```bash
scloud secrets set SERVERPOD_DATABASE_PASSWORD="your-secure-db-password"
scloud secrets set SERVERPOD_SERVICE_SECRET="your-service-secret-token"
```

### Step 6: Deploy to Serverpod Cloud
```bash
scloud deploy --project campus-pulse
```
Your backend will be deployed with automatic SSL certificates and high-availability endpoints:
- API Server: `https://api.campuspulse.serverpod.cloud`
- WebSocket Real-time Stream: `wss://api.campuspulse.serverpod.cloud`
- Serverpod Insights: `https://insights.campuspulse.serverpod.cloud`

---

## Connecting the Flutter Client

In your Flutter app (`pubspec.yaml`):
```yaml
dependencies:
  flutter:
    sdk: flutter
  serverpod_flutter: ^1.2.6
  campus_pulse_client:
    path: ../campus_pulse_client
```

Initialize Serverpod client in your Flutter entry point:
```dart
import 'package:campus_pulse_client/campus_pulse_client.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

var client = Client(
  'https://api.campuspulse.serverpod.cloud/',
  authenticationKeyManager: FlutterAuthenticationKeyManager(),
)..connectivityMonitor = FlutterConnectivityMonitor();
```
