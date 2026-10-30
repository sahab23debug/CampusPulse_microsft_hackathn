import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:campuspulse_client/campuspulse_client.dart';

/// Serverpod client instance provider.
/// Uses the local development server in debug builds and Serverpod Cloud in
/// release builds. Override with --dart-define=SERVERPOD_URL=... when needed.
final clientProvider = Provider<Client>((ref) {
  const configuredUrl = String.fromEnvironment('SERVERPOD_URL');
  final serverUrl = configuredUrl.isNotEmpty
      ? configuredUrl
      : kReleaseMode
          ? 'https://api.campuspulse-2026.serverpod.cloud/'
          : 'http://localhost:8080/';
  final client = Client(
    serverUrl,
  );
  return client;
});
