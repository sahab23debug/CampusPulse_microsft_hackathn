import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/camera_models.dart';
import '../../auth/controllers/auth_controller.dart';

final List<CampusGeoLocation> kDefaultCampusLocations = [
  const CampusGeoLocation(
    latitude: 28.5450,
    longitude: 77.1926,
    altitude: 216.4,
    accuracy: 2.8,
    heading: 142.0,
    landmarkName: 'Lecture Hall Complex (LHC) Central Lawn',
    campusName: 'Indian Institute of Technology Delhi',
  ),
  const CampusGeoLocation(
    latitude: 28.5458,
    longitude: 77.1932,
    altitude: 218.1,
    accuracy: 3.1,
    heading: 96.0,
    landmarkName: 'Central Library & Knowledge Hub Gate 2',
    campusName: 'Indian Institute of Technology Delhi',
  ),
  const CampusGeoLocation(
    latitude: 28.5442,
    longitude: 77.1915,
    altitude: 214.7,
    accuracy: 2.4,
    heading: 210.0,
    landmarkName: 'Open Air Theatre (OAT) & SAC Quadrangle',
    campusName: 'Indian Institute of Technology Delhi',
  ),
  const CampusGeoLocation(
    latitude: 28.5462,
    longitude: 77.1940,
    altitude: 220.0,
    accuracy: 3.5,
    heading: 35.0,
    landmarkName: 'Bharti School of Telecomm & CS Lab 3',
    campusName: 'Indian Institute of Technology Delhi',
  ),
  const CampusGeoLocation(
    latitude: 28.5435,
    longitude: 77.1908,
    altitude: 212.9,
    accuracy: 4.0,
    heading: 180.0,
    landmarkName: 'Nilgiri & Kumaon Hostel Central Quad',
    campusName: 'Indian Institute of Technology Delhi',
  ),
];

class CameraState {
  final CampusGeoLocation currentLocation;
  final List<CampusGeoLocation> availableLocations;
  final CameraCaptureMode activeMode;
  final bool isFlashOn;
  final bool isFrontCamera;
  final bool showGrid;
  final CampusPhotoSnap? capturedSnap;
  final List<CampusPhotoSnap> savedSnaps;

  const CameraState({
    required this.currentLocation,
    required this.availableLocations,
    this.activeMode = CameraCaptureMode.campusSpot,
    this.isFlashOn = false,
    this.isFrontCamera = false,
    this.showGrid = true,
    this.capturedSnap,
    this.savedSnaps = const [],
  });

  CameraState copyWith({
    CampusGeoLocation? currentLocation,
    List<CampusGeoLocation>? availableLocations,
    CameraCaptureMode? activeMode,
    bool? isFlashOn,
    bool? isFrontCamera,
    bool? showGrid,
    CampusPhotoSnap? capturedSnap,
    bool clearCapturedSnap = false,
    List<CampusPhotoSnap>? savedSnaps,
  }) {
    return CameraState(
      currentLocation: currentLocation ?? this.currentLocation,
      availableLocations: availableLocations ?? this.availableLocations,
      activeMode: activeMode ?? this.activeMode,
      isFlashOn: isFlashOn ?? this.isFlashOn,
      isFrontCamera: isFrontCamera ?? this.isFrontCamera,
      showGrid: showGrid ?? this.showGrid,
      capturedSnap: clearCapturedSnap ? null : (capturedSnap ?? this.capturedSnap),
      savedSnaps: savedSnaps ?? this.savedSnaps,
    );
  }
}

class CameraController extends StateNotifier<CameraState> {
  final Ref _ref;

  CameraController(this._ref)
      : super(
          CameraState(
            currentLocation: kDefaultCampusLocations[0],
            availableLocations: kDefaultCampusLocations,
            savedSnaps: [
              CampusPhotoSnap(
                id: 'snap_sample_1',
                imageUrl: 'https://images.unsplash.com/photo-1541339907198-e08756dedf3f?w=800',
                location: kDefaultCampusLocations[0],
                timestamp: DateTime.now().subtract(const Duration(hours: 3, minutes: 12)),
                capturedBy: 'Aarav Sharma',
                caption: 'Sunny afternoon outside LHC before DAA lecture ☀️',
                isSaved: true,
                mode: CameraCaptureMode.campusSpot,
              ),
              CampusPhotoSnap(
                id: 'snap_sample_2',
                imageUrl: 'https://images.unsplash.com/photo-1523240795612-9a054b0db644?w=800',
                location: kDefaultCampusLocations[2],
                timestamp: DateTime.now().subtract(const Duration(days: 1)),
                capturedBy: 'Aarav Sharma',
                caption: 'HackPulse hackathon brainstorming session at SAC foyer!',
                isSaved: true,
                mode: CameraCaptureMode.studentMoment,
              ),
            ],
          ),
        );

  void setLocation(CampusGeoLocation location) {
    state = state.copyWith(currentLocation: location);
  }

  void setMode(CameraCaptureMode mode) {
    state = state.copyWith(activeMode: mode);
  }

  void toggleFlash() {
    state = state.copyWith(isFlashOn: !state.isFlashOn);
  }

  void toggleGrid() {
    state = state.copyWith(showGrid: !state.showGrid);
  }

  void toggleCamera() {
    state = state.copyWith(isFrontCamera: !state.isFrontCamera);
  }

  /// Click and freeze a photo with the live geotag
  void clickPhoto({String? customImage, String? customCaption}) {
    final user = _ref.read(authControllerProvider).currentUser;
    final userName = user?.fullName ?? 'Aarav Sharma';

    String photoUrl;
    if (customImage != null && customImage.isNotEmpty) {
      photoUrl = customImage;
    } else {
      switch (state.activeMode) {
        case CameraCaptureMode.notesScanner:
          photoUrl = 'https://images.unsplash.com/photo-1544717305-2782549b5136?w=800';
          break;
        case CameraCaptureMode.studentMoment:
          photoUrl = state.isFrontCamera
              ? 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=800'
              : 'https://images.unsplash.com/photo-1529156069898-49953e39b3ac?w=800';
          break;
        case CameraCaptureMode.customUpload:
          photoUrl = 'https://images.unsplash.com/photo-1517486808906-6ca8b3f04846?w=800';
          break;
        case CameraCaptureMode.campusSpot:
          photoUrl = 'https://images.unsplash.com/photo-1562774053-701939374585?w=800';
          break;
      }
    }

    final newSnap = CampusPhotoSnap(
      id: 'snap_${DateTime.now().millisecondsSinceEpoch}',
      imageUrl: photoUrl,
      location: state.currentLocation,
      timestamp: DateTime.now(),
      capturedBy: userName,
      caption: customCaption ?? 'Captured at ${state.currentLocation.landmarkName}',
      isSaved: false,
      mode: state.activeMode,
    );

    state = state.copyWith(capturedSnap: newSnap);
  }

  /// Save current captured snap to Kampuzz Campus Memories
  void saveCapturedSnap(String caption) {
    if (state.capturedSnap == null) return;

    final saved = state.capturedSnap!.copyWith(
      caption: caption.isNotEmpty ? caption : state.capturedSnap!.caption,
      isSaved: true,
    );

    state = state.copyWith(
      capturedSnap: saved,
      savedSnaps: [saved, ...state.savedSnaps],
    );
  }

  /// Delete a saved snap
  void deleteSavedSnap(String id) {
    final updated = state.savedSnaps.where((s) => s.id != id).toList();
    state = state.copyWith(savedSnaps: updated);
  }

  /// Clear active snap and return to live viewfinder
  void clearCapturedSnap() {
    state = state.copyWith(clearCapturedSnap: true);
  }
}

final cameraControllerProvider = StateNotifierProvider<CameraController, CameraState>((ref) {
  return CameraController(ref);
});
