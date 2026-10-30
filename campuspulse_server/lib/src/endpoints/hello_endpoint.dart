import 'package:serverpod/serverpod.dart';

/// Phase 0 sanity check endpoint.
class HelloEndpoint extends Endpoint {
  Future<String> hello(Session session, String name) async {
    return 'Hello $name, welcome to CampusPulse!';
  }

  Future<Map<String, dynamic>> healthCheck(Session session) async {
    return {
      'status': 'healthy',
      'service': 'CampusPulse Serverpod Backend',
      'version': '1.0.0',
      'serverTime': DateTime.now().toIso8601String(),
    };
  }
}
