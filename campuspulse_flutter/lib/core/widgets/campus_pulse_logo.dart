import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

/// Unique, signature brand logo for CampusPulse.
///
/// Symbolism:
/// 1. Academic Mortarboard diamond crest (College / Higher Education)
/// 2. Biometric ECG pulse spike (Live campus heartbeat, real-time energy)
/// 3. Interconnected network nodes (Students, notes, teams, communities)
class CampusPulseLogo extends StatelessWidget {
  final double size;
  final bool showGlow;
  final bool showText;
  final String? subtitle;
  final VoidCallback? onTap;

  const CampusPulseLogo({
    super.key,
    this.size = 48,
    this.showGlow = true,
    this.showText = false,
    this.subtitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final logoWidget = SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (showGlow)
            Container(
              width: size * 0.9,
              height: size * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(size * 0.28),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withValues(alpha: 0.4),
                    blurRadius: size * 0.35,
                    spreadRadius: 2,
                    offset: Offset(0, size * 0.08),
                  ),
                  BoxShadow(
                    color: AppColors.secondary.withValues(alpha: 0.25),
                    blurRadius: size * 0.25,
                    offset: Offset(size * 0.06, size * 0.04),
                  ),
                ],
              ),
            ),
          CustomPaint(
            size: Size(size, size),
            painter: _PulseCrestPainter(),
          ),
        ],
      ),
    );

    if (!showText) {
      if (onTap != null) {
        return GestureDetector(onTap: onTap, child: logoWidget);
      }
      return logoWidget;
    }

    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          logoWidget,
          SizedBox(width: size * 0.25),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Kampuzz',
                style: TextStyle(
                  fontSize: size * 0.46,
                  fontWeight: FontWeight.w900,
                  letterSpacing: -0.5,
                  height: 1.1,
                ),
              ),
              Text(
                subtitle ?? 'CAMPUS OS',
                style: TextStyle(
                  fontSize: size * 0.22,
                  fontWeight: FontWeight.w800,
                  color: AppColors.primary,
                  letterSpacing: 1.2,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _PulseCrestPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    // 1. Outer Squircle Container with Gradient
    final bgRRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, w, h),
      Radius.circular(w * 0.28),
    );

    final bgPaint = Paint()
      ..shader = const LinearGradient(
        colors: [
          Color(0xFF6366F1), // Indigo
          Color(0xFF4F46E5), // Deep Indigo
          Color(0xFF06B6D4), // Cyan
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(Rect.fromLTWH(0, 0, w, h));

    canvas.drawRRect(bgRRect, bgPaint);

    // Subtle inner stroke for glass / premium badge feel
    final strokePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = w * 0.03
      ..shader = LinearGradient(
        colors: [
          Colors.white.withValues(alpha: 0.6),
          Colors.white.withValues(alpha: 0.05),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(Rect.fromLTWH(0, 0, w, h));
    canvas.drawRRect(bgRRect, strokePaint);

    // 2. Academic Mortarboard Diamond Silhouette (Crest Peak)
    final capPath = Path();
    final capTop = h * 0.20;
    final capMidY = h * 0.32;
    final capBottom = h * 0.42;

    capPath.moveTo(w * 0.50, capTop); // top apex
    capPath.lineTo(w * 0.78, capMidY); // right tip
    capPath.lineTo(w * 0.50, capBottom); // bottom apex
    capPath.lineTo(w * 0.22, capMidY); // left tip
    capPath.close();

    final capPaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.22)
      ..style = PaintingStyle.fill;
    canvas.drawPath(capPath, capPaint);

    // Mortarboard border
    final capBorderPaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.45)
      ..style = PaintingStyle.stroke
      ..strokeWidth = w * 0.03;
    canvas.drawPath(capPath, capBorderPaint);

    // 3. Biometric Pulse Waveform (ECG Heartbeat line slicing through center)
    final pulsePath = Path();
    pulsePath.moveTo(w * 0.16, h * 0.60);
    pulsePath.lineTo(w * 0.34, h * 0.60);
    pulsePath.lineTo(w * 0.40, h * 0.68); // small dip
    pulsePath.lineTo(w * 0.50, h * 0.26); // massive heart spike into cap
    pulsePath.lineTo(w * 0.60, h * 0.76); // recovery dip
    pulsePath.lineTo(w * 0.66, h * 0.60); // level return
    pulsePath.lineTo(w * 0.84, h * 0.60);

    final pulsePaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = w * 0.075
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    // Pulse glow layer
    final pulseGlowPaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = w * 0.12
      ..strokeCap = StrokeCap.round
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 2);
    canvas.drawPath(pulsePath, pulseGlowPaint);
    canvas.drawPath(pulsePath, pulsePaint);

    // 4. Glowing Student Connection Node Dot on the pulse terminus
    final nodePaint = Paint()..color = const Color(0xFFF43F5E); // Coral accent spark
    canvas.drawCircle(Offset(w * 0.84, h * 0.60), w * 0.065, nodePaint);

    final innerNodePaint = Paint()..color = Colors.white;
    canvas.drawCircle(Offset(w * 0.84, h * 0.60), w * 0.03, innerNodePaint);

    // 5. Crown Academic Spark
    final sparkPaint = Paint()..color = const Color(0xFFFDE047); // Golden yellow
    canvas.drawCircle(Offset(w * 0.50, capTop), w * 0.045, sparkPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// Brand name alias
typedef KampuzzLogo = CampusPulseLogo;
