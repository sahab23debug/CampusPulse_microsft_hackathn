import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../constants/app_colors.dart';
import 'campus_pulse_logo.dart';
import 'auth_user_menu.dart';
import '../../features/sam_ai/presentation/sam_copilot_modal.dart';

/// Responsive scaffold providing:
/// - Desktop/Laptop adaptive NavigationRail sidebar on wide screens (>= 800px)
/// - Centered content with maximum width constraint for ergonomic reading
/// - Bottom navigation bar with 5 tabs on mobile screens (< 800px)
/// - Floating expandable Speed-Dial Quick-Action button for "Connect" and "Rent"
class ResponsiveScaffold extends StatefulWidget {
  final Widget child;

  const ResponsiveScaffold({super.key, required this.child});

  @override
  State<ResponsiveScaffold> createState() => _ResponsiveScaffoldState();
}

class _ResponsiveScaffoldState extends State<ResponsiveScaffold> {
  bool _isSpeedDialOpen = false;

  int _calculateSelectedIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;
    if (location.startsWith('/home')) return 0;
    if (location.startsWith('/study')) return 1;
    if (location.startsWith('/camera')) return 2;
    if (location.startsWith('/arena')) return 3;
    if (location.startsWith('/community')) return 4;
    if (location.startsWith('/profile')) return 5;
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.go('/home');
        break;
      case 1:
        context.go('/study');
        break;
      case 2:
        context.go('/camera');
        break;
      case 3:
        context.go('/arena');
        break;
      case 4:
        context.go('/community');
        break;
      case 5:
        context.go('/profile');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final selectedIndex = _calculateSelectedIndex(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 840;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    if (isDesktop) {
      // Desktop / Laptop Web Experience
      return Scaffold(
        body: Row(
          children: [
            // Left Adaptive Sidebar / NavigationRail
            NavigationRail(
              selectedIndex: selectedIndex,
              onDestinationSelected: (idx) => _onItemTapped(idx, context),
              extended: screenWidth >= 1100,
              minExtendedWidth: 200,
              leading: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const CampusPulseLogo(size: 34, showGlow: false),
                    if (screenWidth >= 1100) ...[
                      const SizedBox(width: 10),
                      const Text(
                        'Kampuzz',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                          letterSpacing: -0.5,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              trailing: Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          tooltip: 'Sam AI Copilot',
                          icon: const Icon(Icons.auto_awesome, color: Color(0xFF6366F1)),
                          onPressed: () => showSamCopilotModal(context),
                        ),
                        const SizedBox(height: 8),
                        IconButton(
                          tooltip: 'Connect / Find Teammates',
                          icon: const Icon(Icons.handshake_rounded, color: AppColors.secondary),
                          onPressed: () => context.push('/connect'),
                        ),
                        const SizedBox(height: 8),
                        IconButton(
                          tooltip: 'Campus Rental',
                          icon: const Icon(Icons.storefront_rounded, color: AppColors.accent),
                          onPressed: () => context.push('/rent'),
                        ),
                        const SizedBox(height: 8),
                        IconButton(
                          tooltip: 'Bunk-Meter',
                          icon: const Icon(Icons.calculate_rounded, color: AppColors.attendanceSafe),
                          onPressed: () => context.push('/bunk-meter'),
                        ),
                        const SizedBox(height: 12),
                        const Divider(indent: 12, endIndent: 12),
                        const SizedBox(height: 4),
                        const AuthUserAvatarButton(),
                      ],
                    ),
                  ),
                ),
              ),
              destinations: const [
                NavigationRailDestination(
                  icon: Icon(Icons.dynamic_feed_outlined),
                  selectedIcon: Icon(Icons.dynamic_feed_rounded, color: AppColors.primary),
                  label: Text('Home Feed'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.menu_book_outlined),
                  selectedIcon: Icon(Icons.menu_book_rounded, color: AppColors.primary),
                  label: Text('Study Hub'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.camera_alt_outlined),
                  selectedIcon: Icon(Icons.camera_alt_rounded, color: AppColors.primary),
                  label: Text('Geo-Cam'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.sports_esports_outlined),
                  selectedIcon: Icon(Icons.sports_esports_rounded, color: AppColors.primary),
                  label: Text('Quiz Arena'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.people_outline_rounded),
                  selectedIcon: Icon(Icons.people_rounded, color: AppColors.primary),
                  label: Text('Communities'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.person_outline_rounded),
                  selectedIcon: Icon(Icons.person_rounded, color: AppColors.primary),
                  label: Text('My Profile'),
                ),
              ],
            ),
            VerticalDivider(
              thickness: 1,
              width: 1,
              color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
            ),
            // Central Responsive Content Viewport
            Expanded(
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 780),
                  child: widget.child,
                ),
              ),
            ),
          ],
        ),
      );
    }

    // Mobile & Tablet Portrait Experience
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: widget.child,
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (_isSpeedDialOpen) ...[
            _SpeedDialAction(
              icon: Icons.auto_awesome,
              label: 'Sam AI Copilot',
              color: const Color(0xFF6366F1),
              onTap: () {
                setState(() => _isSpeedDialOpen = false);
                showSamCopilotModal(context);
              },
            ),
            const SizedBox(height: 12),
            _SpeedDialAction(
              icon: Icons.handshake_rounded,
              label: 'Connect',
              color: AppColors.secondary,
              onTap: () {
                setState(() => _isSpeedDialOpen = false);
                context.push('/connect');
              },
            ),
            const SizedBox(height: 12),
            _SpeedDialAction(
              icon: Icons.storefront_rounded,
              label: 'Rent',
              color: AppColors.accent,
              onTap: () {
                setState(() => _isSpeedDialOpen = false);
                context.push('/rent');
              },
            ),
            const SizedBox(height: 12),
          ],
          FloatingActionButton(
            backgroundColor: AppColors.primary,
            foregroundColor: Colors.white,
            elevation: 4,
            onPressed: () {
              setState(() => _isSpeedDialOpen = !_isSpeedDialOpen);
            },
            child: AnimatedRotation(
              turns: _isSpeedDialOpen ? 0.125 : 0.0,
              duration: const Duration(milliseconds: 250),
              child: const Icon(Icons.add, size: 28),
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (idx) => _onItemTapped(idx, context),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.dynamic_feed_outlined),
            selectedIcon: Icon(Icons.dynamic_feed_rounded, color: AppColors.primary),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.menu_book_outlined),
            selectedIcon: Icon(Icons.menu_book_rounded, color: AppColors.primary),
            label: 'Study',
          ),
          NavigationDestination(
            icon: Icon(Icons.camera_alt_outlined),
            selectedIcon: Icon(Icons.camera_alt_rounded, color: AppColors.primary),
            label: 'Geo-Cam',
          ),
          NavigationDestination(
            icon: Icon(Icons.sports_esports_outlined),
            selectedIcon: Icon(Icons.sports_esports_rounded, color: AppColors.primary),
            label: 'Arena',
          ),
          NavigationDestination(
            icon: Icon(Icons.people_outline_rounded),
            selectedIcon: Icon(Icons.people_rounded, color: AppColors.primary),
            label: 'Community',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline_rounded),
            selectedIcon: Icon(Icons.person_rounded, color: AppColors.primary),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class _SpeedDialAction extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _SpeedDialAction({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Material(
            elevation: 3,
            borderRadius: BorderRadius.circular(8),
            color: Theme.of(context).cardColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              child: Text(
                label,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
              ),
            ),
          ),
          const SizedBox(width: 8),
          FloatingActionButton.small(
            heroTag: null,
            backgroundColor: color,
            foregroundColor: Colors.white,
            onPressed: onTap,
            child: Icon(icon, size: 20),
          ),
        ],
      ),
    );
  }
}
