import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../sam_copilot_modal.dart';

/// Floating trigger pill for Sam AI Copilot
class SamFloatingButton extends StatelessWidget {
  final bool compact;

  const SamFloatingButton({super.key, this.compact = false});

  @override
  Widget build(BuildContext context) {
    if (compact) {
      return FloatingActionButton.small(
        heroTag: 'sam_fab_compact',
        onPressed: () => showSamCopilotModal(context),
        backgroundColor: AppColors.primary,
        tooltip: 'Ask Sam AI Copilot',
        child: const Icon(Icons.auto_awesome, color: Colors.white, size: 20),
      );
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        gradient: const LinearGradient(
          colors: [Color(0xFF6366F1), Color(0xFF8B5CF6), Color(0xFFEC4899)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF6366F1).withValues(alpha: 0.35),
            blurRadius: 14,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(28),
          onTap: () => showSamCopilotModal(context),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.auto_awesome, color: Colors.white, size: 18),
                SizedBox(width: 8),
                Text(
                  'Ask Sam AI',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 13,
                    letterSpacing: 0.2,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
