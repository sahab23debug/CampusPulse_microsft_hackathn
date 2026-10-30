/// Real-time campus geographic location model
class CampusGeoLocation {
  final double latitude;
  final double longitude;
  final double altitude;
  final double accuracy;
  final double heading;
  final String landmarkName;
  final String campusName;

  const CampusGeoLocation({
    required this.latitude,
    required this.longitude,
    this.altitude = 216.4,
    this.accuracy = 3.2,
    this.heading = 142.0,
    required this.landmarkName,
    required this.campusName,
  });

  String get formattedCoords =>
      '${latitude.toStringAsFixed(4)}° N, ${longitude.toStringAsFixed(4)}° E';

  String get googleMapsUrl =>
      'https://maps.google.com/?q=$latitude,$longitude';
}

/// Mode of the campus camera capture
enum CameraCaptureMode {
  campusSpot,
  notesScanner,
  studentMoment,
  customUpload,
}

/// Captured photo snap with stamped real-time geotag metadata
class CampusPhotoSnap {
  final String id;
  final String imageUrl;
  final CampusGeoLocation location;
  final DateTime timestamp;
  final String capturedBy;
  final String caption;
  final bool isSaved;
  final CameraCaptureMode mode;

  const CampusPhotoSnap({
    required this.id,
    required this.imageUrl,
    required this.location,
    required this.timestamp,
    required this.capturedBy,
    required this.caption,
    this.isSaved = false,
    this.mode = CameraCaptureMode.campusSpot,
  });

  CampusPhotoSnap copyWith({
    String? caption,
    bool? isSaved,
  }) {
    return CampusPhotoSnap(
      id: id,
      imageUrl: imageUrl,
      location: location,
      timestamp: timestamp,
      capturedBy: capturedBy,
      caption: caption ?? this.caption,
      isSaved: isSaved ?? this.isSaved,
      mode: mode,
    );
  }
}
