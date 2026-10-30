import 'package:flutter/material.dart';

/// CampusPulse Design System Color Palette (Material 3 compliant).
class AppColors {
  // Brand Primary & Accent
  static const Color primary = Color(0xFF6366F1); // Indigo
  static const Color primaryDark = Color(0xFF4F46E5);
  static const Color primaryLight = Color(0xFFEEF2FF);
  
  static const Color secondary = Color(0xFF06B6D4); // Cyan / Teal
  static const Color accent = Color(0xFFF43F5E); // Rose / Coral
  
  // Attendance & Status Colors (Bunk-Meter)
  static const Color attendanceSafe = Color(0xFF10B981); // Emerald Green
  static const Color attendanceWarning = Color(0xFFF59E0B); // Amber
  static const Color attendanceDanger = Color(0xFFEF4444); // Crimson Red

  // Dark Theme Surfaces
  static const Color darkBackground = Color(0xFF0F172A); // Slate 900
  static const Color darkSurface = Color(0xFF1E293B); // Slate 800
  static const Color darkCard = Color(0xFF1E293B);
  static const Color darkBorder = Color(0xFF334155);

  // Light Theme Surfaces
  static const Color lightBackground = Color(0xFFF8FAFC); // Slate 50
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightCard = Color(0xFFFFFFFF);
  static const Color lightBorder = Color(0xFFE2E8F0);

  // Text Colors
  static const Color textPrimaryLight = Color(0xFF0F172A);
  static const Color textSecondaryLight = Color(0xFF64748B);
  static const Color textPrimaryDark = Color(0xFFF8FAFC);
  static const Color textSecondaryDark = Color(0xFF94A3B8);
}
