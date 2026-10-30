import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/widgets/campus_pulse_logo.dart';
import '../../../core/utils/file_saver/file_saver.dart';
import '../controllers/camera_controller.dart';
import '../domain/camera_models.dart';

/// Full-featured Campus Camera Screen with Live Geotagging, Save, Download & Share
class CampusCameraScreen extends ConsumerStatefulWidget {
  const CampusCameraScreen({super.key});

  @override
  ConsumerState<CampusCameraScreen> createState() => _CampusCameraScreenState();
}

class _CampusCameraScreenState extends ConsumerState<CampusCameraScreen> with SingleTickerProviderStateMixin {
  late Timer _clockTimer;
  DateTime _currentTime = DateTime.now();
  bool _isShutterFlashing = false;
  final _captionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _clockTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (mounted) {
        setState(() => _currentTime = DateTime.now());
      }
    });
  }

  @override
  void dispose() {
    _clockTimer.cancel();
    _captionController.dispose();
    super.dispose();
  }

  void _triggerShutter() {
    HapticFeedback.mediumImpact();
    setState(() => _isShutterFlashing = true);

    ref.read(cameraControllerProvider.notifier).clickPhoto();

    Future.delayed(const Duration(milliseconds: 150), () {
      if (mounted) setState(() => _isShutterFlashing = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    final cameraState = ref.watch(cameraControllerProvider);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    if (cameraState.capturedSnap != null) {
      return _buildReviewStudio(context, cameraState.capturedSnap!, isDark);
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            // Top Real-Time Geotag HUD Bar
            _buildGeotagHudHeader(cameraState),

            // Live Camera Viewfinder Area
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  // Camera Simulation Feed Background
                  _buildCameraFeed(cameraState),

                  // Rule-of-thirds Grid Overlay
                  if (cameraState.showGrid) _buildGridOverlay(),

                  // Focus Bracket Reticle
                  Center(child: _buildFocusReticle()),

                  // Live Shutter Flash animation
                  if (_isShutterFlashing)
                    Container(color: Colors.white.withValues(alpha: 0.85)),

                  // Viewfinder Geotag Stamp at Bottom Left
                  Positioned(
                    left: 16,
                    bottom: 16,
                    child: _buildLiveGeotagOverlay(cameraState),
                  ),

                  // Top Camera Mode Pill Chips
                  Positioned(
                    top: 12,
                    left: 0,
                    right: 0,
                    child: _buildModeSelectorBar(cameraState),
                  ),
                ],
              ),
            ),

            // Bottom Shutter & Controls Dock
            _buildBottomControlsBar(cameraState),
          ],
        ),
      ),
    );
  }

  Widget _buildGeotagHudHeader(CameraState state) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      color: Colors.black,
      child: Column(
        children: [
          Row(
            children: [
              // Pulsing Live GPS Indicator
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: AppColors.attendanceSafe,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 6),
              const Text(
                'LIVE GPS',
                style: TextStyle(
                  color: AppColors.attendanceSafe,
                  fontWeight: FontWeight.w900,
                  fontSize: 11,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  state.currentLocation.formattedCoords,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                    fontFamily: 'monospace',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              // Flash Toggle
              IconButton(
                icon: Icon(
                  state.isFlashOn ? Icons.flash_on_rounded : Icons.flash_off_rounded,
                  color: state.isFlashOn ? Colors.amber : Colors.white70,
                  size: 20,
                ),
                tooltip: 'Flash',
                onPressed: () => ref.read(cameraControllerProvider.notifier).toggleFlash(),
              ),

              // Grid Toggle
              IconButton(
                icon: Icon(
                  state.showGrid ? Icons.grid_on_rounded : Icons.grid_off_rounded,
                  color: state.showGrid ? AppColors.primary : Colors.white70,
                  size: 20,
                ),
                tooltip: 'Rule of Thirds Grid',
                onPressed: () => ref.read(cameraControllerProvider.notifier).toggleGrid(),
              ),
            ],
          ),

          // Landmark Selector Pill
          InkWell(
            key: const Key('landmark_picker_pill'),
            onTap: () => _showLandmarkPicker(context, state),
            borderRadius: BorderRadius.circular(20),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white.withValues(alpha: 0.2)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.location_on_rounded, color: AppColors.secondary, size: 14),
                  const SizedBox(width: 6),
                  Flexible(
                    child: Text(
                      state.currentLocation.landmarkName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(width: 4),
                  const Icon(Icons.arrow_drop_down, color: Colors.white70, size: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCameraFeed(CameraState state) {
    String previewUrl;
    switch (state.activeMode) {
      case CameraCaptureMode.notesScanner:
        previewUrl = 'https://images.unsplash.com/photo-1544717305-2782549b5136?w=800';
        break;
      case CameraCaptureMode.studentMoment:
        previewUrl = state.isFrontCamera
            ? 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=800'
            : 'https://images.unsplash.com/photo-1529156069898-49953e39b3ac?w=800';
        break;
      case CameraCaptureMode.customUpload:
        previewUrl = 'https://images.unsplash.com/photo-1517486808906-6ca8b3f04846?w=800';
        break;
      case CameraCaptureMode.campusSpot:
        previewUrl = 'https://images.unsplash.com/photo-1562774053-701939374585?w=800';
        break;
    }

    return Image.network(
      previewUrl,
      fit: BoxFit.cover,
      errorBuilder: (ctx, err, stack) => Container(
        color: const Color(0xFF0F172A),
        child: const Center(
          child: Icon(Icons.camera_rounded, size: 72, color: Colors.white12),
        ),
      ),
    );
  }

  Widget _buildGridOverlay() {
    return IgnorePointer(
      child: Column(
        children: [
          Expanded(child: Container(decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.white.withValues(alpha: 0.25), width: 0.8))))),
          Expanded(child: Container(decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.white.withValues(alpha: 0.25), width: 0.8))))),
          Expanded(child: Container()),
        ],
      ),
    );
  }

  Widget _buildFocusReticle() {
    return IgnorePointer(
      child: Container(
        width: 72,
        height: 72,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.amber.withValues(alpha: 0.8), width: 1.5),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  Widget _buildLiveGeotagOverlay(CameraState state) {
    final timeStr = DateFormat('hh:mm:ss a').format(_currentTime);
    final dateStr = DateFormat('dd MMM yyyy').format(_currentTime);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.65),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.white.withValues(alpha: 0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CampusPulseLogo(size: 14, showGlow: false),
              SizedBox(width: 4),
              Text('Kampuzz Geo-Cam', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w800)),
            ],
          ),
          const SizedBox(height: 2),
          Text(state.currentLocation.landmarkName, style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold)),
          Text('${state.currentLocation.formattedCoords} • $timeStr, $dateStr',
              style: const TextStyle(color: Colors.white70, fontSize: 9, fontFamily: 'monospace')),
        ],
      ),
    );
  }

  Widget _buildModeSelectorBar(CameraState state) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildModeChip('🏛️ Campus Spot', CameraCaptureMode.campusSpot, state),
        const SizedBox(width: 6),
        _buildModeChip('📄 Notes Scan', CameraCaptureMode.notesScanner, state),
        const SizedBox(width: 6),
        _buildModeChip('🤳 Moment', CameraCaptureMode.studentMoment, state),
      ],
    );
  }

  Widget _buildModeChip(String label, CameraCaptureMode mode, CameraState state) {
    final isSelected = state.activeMode == mode;
    return InkWell(
      onTap: () => ref.read(cameraControllerProvider.notifier).setMode(mode),
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : Colors.black.withValues(alpha: 0.6),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: isSelected ? Colors.transparent : Colors.white24),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.white70,
            fontSize: 11,
            fontWeight: isSelected ? FontWeight.w800 : FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildBottomControlsBar(CameraState state) {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.fromLTRB(24, 12, 24, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Gallery / Saved Snaps Button
          InkWell(
            key: const Key('memories_button'),
            onTap: () => _showSavedGalleryModal(context, state),
            borderRadius: BorderRadius.circular(14),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: Colors.white24),
              ),
              child: Row(
                children: [
                  const Icon(Icons.photo_library_outlined, color: Colors.white, size: 20),
                  const SizedBox(width: 6),
                  Text('${state.savedSnaps.length}', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13)),
                ],
              ),
            ),
          ),

          // Prominent Shutter Button
          GestureDetector(
            key: const Key('shutter_button'),
            onTap: _triggerShutter,
            child: Container(
              width: 76,
              height: 76,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 4),
              ),
              padding: const EdgeInsets.all(5),
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
            ),
          ),

          // Flip Camera Button
          IconButton(
            icon: const Icon(Icons.flip_camera_ios_rounded, color: Colors.white, size: 28),
            tooltip: 'Flip Camera',
            onPressed: () => ref.read(cameraControllerProvider.notifier).toggleCamera(),
          ),
        ],
      ),
    );
  }

  // --- REVIEW STUDIO: Save, Download, Share ---
  Widget _buildReviewStudio(BuildContext context, CampusPhotoSnap snap, bool isDark) {
    final dateFormatted = DateFormat('MMM d, yyyy • hh:mm a').format(snap.timestamp);

    return Scaffold(
      backgroundColor: isDark ? AppColors.darkBackground : const Color(0xFFF1F5F9),
      appBar: AppBar(
        title: const Text('Campus Geotag Studio', style: TextStyle(fontWeight: FontWeight.w800)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            ref.read(cameraControllerProvider.notifier).clearCapturedSnap();
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 580),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Stamped Photo Card
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.15),
                        blurRadius: 16,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Stack(
                    children: [
                      // Photo
                      Image.network(
                        snap.imageUrl,
                        width: double.infinity,
                        height: 380,
                        fit: BoxFit.cover,
                        errorBuilder: (ctx, err, stack) => Container(
                          width: double.infinity,
                          height: 380,
                          color: const Color(0xFF1E293B),
                          child: const Center(
                            child: Icon(Icons.photo_camera_back_rounded, size: 64, color: Colors.white24),
                          ),
                        ),
                      ),

                      // Official Kampuzz Real-Time Geotag Watermark
                      Positioned(
                        left: 12,
                        right: 12,
                        bottom: 12,
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.black.withValues(alpha: 0.75),
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(color: Colors.white.withValues(alpha: 0.25)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const CampusPulseLogo(size: 20, showGlow: false),
                                  const SizedBox(width: 8),
                                  const Text(
                                    'KAMPUZZ REAL-TIME GEOTAG',
                                    style: TextStyle(
                                      color: Color(0xFF38BDF8),
                                      fontWeight: FontWeight.w900,
                                      fontSize: 10,
                                      letterSpacing: 0.8,
                                    ),
                                  ),
                                  const Spacer(),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                    decoration: BoxDecoration(
                                      color: AppColors.attendanceSafe,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: const Text('VERIFIED GPS', style: TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.bold)),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 6),
                              Text(
                                snap.location.landmarkName,
                                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 14),
                              ),
                              Text(
                                snap.location.campusName,
                                style: const TextStyle(color: Colors.white70, fontSize: 11),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  const Icon(Icons.pin_drop_rounded, size: 12, color: AppColors.secondary),
                                  const SizedBox(width: 4),
                                  Expanded(
                                    child: Text(
                                      '${snap.location.formattedCoords} • Alt ${snap.location.altitude}m',
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(color: Colors.white70, fontSize: 10, fontFamily: 'monospace'),
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    dateFormatted,
                                    style: const TextStyle(color: Colors.white70, fontSize: 10),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 2),
                              Text(
                                'Captured by: ${snap.capturedBy}',
                                style: const TextStyle(color: Colors.white54, fontSize: 9, fontStyle: FontStyle.italic),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 18),

                // Caption TextField
                TextField(
                  controller: _captionController,
                  decoration: const InputDecoration(
                    labelText: 'Add Caption or Campus Memory Story',
                    hintText: 'e.g. Study session at LHC before exams 📚',
                    prefixIcon: Icon(Icons.edit_note_rounded),
                  ),
                ),
                const SizedBox(height: 20),

                // 3 Core Actions: Save, Download, Share
                Row(
                  children: [
                    // Save Button
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          ref.read(cameraControllerProvider.notifier).saveCapturedSnap(_captionController.text.trim());
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('🎉 Photo & Geotag saved to Kampuzz Memories!'),
                              backgroundColor: AppColors.attendanceSafe,
                            ),
                          );
                        },
                        icon: const Icon(Icons.bookmark_add_rounded),
                        label: Text(snap.isSaved ? 'Saved ✓' : 'Save'),
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(0, 48),
                          backgroundColor: snap.isSaved ? AppColors.attendanceSafe : AppColors.primary,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),

                    // Download Button
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          final filename = 'kampuzz_${snap.location.landmarkName.split(" ").first}_${DateTime.now().millisecondsSinceEpoch}.jpg';
                          CampusFileSaver.downloadPhoto(snap.imageUrl, filename);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('⬇️ Download initiated for "$filename"!'),
                              backgroundColor: AppColors.primary,
                            ),
                          );
                        },
                        icon: const Icon(Icons.download_rounded),
                        label: const Text('Download'),
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(0, 48),
                          backgroundColor: const Color(0xFF6366F1),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 10),
                const SizedBox(height: 10),

                // Ask Sam AI to Solve/Explain Question Button
                ElevatedButton.icon(
                  key: const Key('ask_sam_ai_solve_button'),
                  onPressed: () {
                    final mediaUrlParam = Uri.encodeComponent(snap.imageUrl);
                    final landmarkParam = Uri.encodeComponent(snap.location.landmarkName);
                    context.push('/sam-copilot?mediaUrl=$mediaUrlParam&landmark=$landmarkParam');
                  },
                  icon: const Icon(Icons.auto_awesome, color: Colors.white),
                  label: const Text('Ask Sam AI to Explain / Solve', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800)),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(0, 50),
                    backgroundColor: const Color(0xFF6366F1),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                    elevation: 3,
                  ),
                ),
                const SizedBox(height: 12),

                // Share Real-Time Location Button
                OutlinedButton.icon(
                  onPressed: () => _showShareModal(context, snap),
                  icon: const Icon(Icons.share_location_rounded, color: AppColors.secondary),
                  label: const Text('Share Real-Time Location & Photo'),
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(0, 48),
                    side: const BorderSide(color: AppColors.secondary, width: 1.5),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                  ),
                ),
                const SizedBox(height: 10),

                // Retake Button
                TextButton.icon(
                  onPressed: () {
                    ref.read(cameraControllerProvider.notifier).clearCapturedSnap();
                  },
                  icon: const Icon(Icons.refresh_rounded),
                  label: const Text('Retake / Back to Viewfinder'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showShareModal(BuildContext context, CampusPhotoSnap snap) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (ctx) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(color: Colors.grey.shade300, borderRadius: BorderRadius.circular(2)),
                ),
              ),
              const Row(
                children: [
                  Icon(Icons.share_location_rounded, color: AppColors.secondary),
                  SizedBox(width: 8),
                  Text('Share Real-Time Campus Location', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
                ],
              ),
              const SizedBox(height: 14),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.secondary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.secondary.withValues(alpha: 0.2)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(snap.location.landmarkName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                    Text('Exact GPS: ${snap.location.formattedCoords}', style: const TextStyle(fontSize: 12, fontFamily: 'monospace')),
                    Text('Google Maps Link: ${snap.location.googleMapsUrl}', style: const TextStyle(fontSize: 11, color: AppColors.primary)),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: () {
                  Clipboard.setData(ClipboardData(
                    text: '📍 I am at ${snap.location.landmarkName} (${snap.location.campusName})!\nGPS: ${snap.location.formattedCoords}\nView on Maps: ${snap.location.googleMapsUrl}',
                  ));
                  Navigator.pop(ctx);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('📋 Real-time campus location link copied to clipboard!')),
                  );
                },
                icon: const Icon(Icons.copy_rounded),
                label: const Text('Copy Location & Google Maps Link'),
              ),
              const SizedBox(height: 10),
              OutlinedButton.icon(
                onPressed: () {
                  Navigator.pop(ctx);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Shared to Kampuzz Community Feed & Chats!')),
                  );
                },
                icon: const Icon(Icons.people_alt_outlined),
                label: const Text('Post to Kampuzz Community Updates'),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showLandmarkPicker(BuildContext context, CameraState state) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (ctx) {
        return Container(
          constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.75),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Icon(Icons.location_searching_rounded, color: AppColors.primary),
                  SizedBox(width: 8),
                  Text('Fetch Live Campus Location', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
                ],
              ),
              const SizedBox(height: 4),
              const Text('Select your current campus landmark for the real-time geotag watermark:',
                  style: TextStyle(fontSize: 12, color: AppColors.textSecondaryLight)),
              const SizedBox(height: 14),
              Flexible(
                child: ListView(
                  shrinkWrap: true,
                  children: state.availableLocations.map((loc) {
                    final isCurrent = loc.landmarkName == state.currentLocation.landmarkName;
                    return Container(
                      margin: const EdgeInsets.only(bottom: 8),
                      decoration: BoxDecoration(
                        color: isCurrent ? AppColors.primary.withValues(alpha: 0.08) : Colors.grey.shade50,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: isCurrent ? AppColors.primary : Colors.grey.shade200),
                      ),
                      child: Material(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(12),
                        child: ListTile(
                          dense: true,
                          leading: Icon(Icons.pin_drop, color: isCurrent ? AppColors.primary : Colors.grey),
                          title: Text(loc.landmarkName, style: TextStyle(fontWeight: isCurrent ? FontWeight.bold : FontWeight.w600)),
                          subtitle: Text(loc.formattedCoords, style: const TextStyle(fontSize: 11, fontFamily: 'monospace')),
                          trailing: isCurrent ? const Icon(Icons.check_circle, color: AppColors.primary, size: 20) : null,
                          onTap: () {
                            ref.read(cameraControllerProvider.notifier).setLocation(loc);
                            Navigator.pop(ctx);
                          },
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showSavedGalleryModal(BuildContext context, CameraState state) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) {
        final screenHeight = MediaQuery.of(context).size.height;
        return Container(
          height: screenHeight * 0.8,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Campus Memories Gallery', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                  IconButton(icon: const Icon(Icons.close), onPressed: () => Navigator.pop(ctx)),
                ],
              ),
              Text('${state.savedSnaps.length} Saved Geotagged Photos', style: const TextStyle(color: AppColors.textSecondaryLight, fontSize: 13)),
              const SizedBox(height: 14),
              Expanded(
                child: state.savedSnaps.isEmpty
                    ? const Center(child: Text('No saved snaps yet. Click photos in the viewfinder!'))
                    : GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 0.8,
                        ),
                        itemCount: state.savedSnaps.length,
                        itemBuilder: (context, index) {
                          final snap = state.savedSnaps[index];
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(14),
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                Image.network(
                                  snap.imageUrl,
                                  fit: BoxFit.cover,
                                  errorBuilder: (ctx, err, stack) => Container(
                                    color: const Color(0xFF1E293B),
                                    child: const Center(
                                      child: Icon(Icons.broken_image_rounded, color: Colors.white24),
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [Colors.transparent, Colors.black.withValues(alpha: 0.85)],
                                    ),
                                  ),
                                  padding: const EdgeInsets.all(8),
                                  alignment: Alignment.bottomLeft,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(snap.location.landmarkName,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold)),
                                      Text(snap.location.formattedCoords,
                                          style: const TextStyle(color: Colors.white70, fontSize: 9, fontFamily: 'monospace')),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}
