import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

enum ResourceType {
  pdf,
  handwritten,
  pyq,
  formulaSheet,
  labManual,
  slides,
  website,
}

class StudyResource {
  final String id;
  final String title;
  final String description;
  final String subject;
  final String department;
  final int semester;
  final ResourceType type;
  final String fileName;
  final int fileSizeBytes;
  final int pageCount;
  final String uploaderName;
  final double uploaderSgpa;
  final int uploaderSemester;
  final double rating;
  final int ratingCount;
  final int downloadsCount;
  final int followedCount;
  final List<String> tags;
  final DateTime uploadedAt;

  const StudyResource({
    required this.id,
    required this.title,
    required this.description,
    required this.subject,
    this.department = 'Computer Science & Engineering',
    this.semester = 5,
    required this.type,
    required this.fileName,
    this.fileSizeBytes = 3450000,
    this.pageCount = 24,
    required this.uploaderName,
    this.uploaderSgpa = 9.2,
    this.uploaderSemester = 5,
    this.rating = 4.8,
    this.ratingCount = 18,
    this.downloadsCount = 142,
    this.followedCount = 98,
    this.tags = const [],
    required this.uploadedAt,
  });

  String get formattedFileSize {
    if (fileSizeBytes >= 1048576) {
      return '${(fileSizeBytes / 1048576).toStringAsFixed(1)} MB';
    } else if (fileSizeBytes >= 1024) {
      return '${(fileSizeBytes / 1024).toStringAsFixed(0)} KB';
    }
    return '$fileSizeBytes B';
  }

  String get typeLabel {
    switch (type) {
      case ResourceType.pdf:
        return 'PDF';
      case ResourceType.handwritten:
        return 'Handwritten';
      case ResourceType.pyq:
        return 'PYQ & Solution';
      case ResourceType.formulaSheet:
        return 'Formula Sheet';
      case ResourceType.labManual:
        return 'Lab Manual';
      case ResourceType.slides:
        return 'Lecture Slides';
      case ResourceType.website:
        return 'Web Notes';
    }
  }

  IconData get typeIcon {
    switch (type) {
      case ResourceType.pdf:
        return Icons.picture_as_pdf_rounded;
      case ResourceType.handwritten:
        return Icons.draw_rounded;
      case ResourceType.pyq:
        return Icons.quiz_rounded;
      case ResourceType.formulaSheet:
        return Icons.functions_rounded;
      case ResourceType.labManual:
        return Icons.science_rounded;
      case ResourceType.slides:
        return Icons.slideshow_rounded;
      case ResourceType.website:
        return Icons.language_rounded;
    }
  }

  Color get typeColor {
    switch (type) {
      case ResourceType.pdf:
        return AppColors.attendanceDanger;
      case ResourceType.handwritten:
        return AppColors.attendanceWarning;
      case ResourceType.pyq:
        return const Color(0xFF8B5CF6);
      case ResourceType.formulaSheet:
        return AppColors.secondary;
      case ResourceType.labManual:
        return AppColors.attendanceSafe;
      case ResourceType.slides:
        return const Color(0xFFF97316);
      case ResourceType.website:
        return AppColors.primary;
    }
  }

  StudyResource copyWith({
    String? title,
    String? description,
    String? subject,
    String? department,
    int? semester,
    ResourceType? type,
    String? fileName,
    int? fileSizeBytes,
    int? pageCount,
    double? rating,
    int? ratingCount,
    int? downloadsCount,
    int? followedCount,
    List<String>? tags,
  }) {
    return StudyResource(
      id: id,
      title: title ?? this.title,
      description: description ?? this.description,
      subject: subject ?? this.subject,
      department: department ?? this.department,
      semester: semester ?? this.semester,
      type: type ?? this.type,
      fileName: fileName ?? this.fileName,
      fileSizeBytes: fileSizeBytes ?? this.fileSizeBytes,
      pageCount: pageCount ?? this.pageCount,
      uploaderName: uploaderName,
      uploaderSgpa: uploaderSgpa,
      uploaderSemester: uploaderSemester,
      rating: rating ?? this.rating,
      ratingCount: ratingCount ?? this.ratingCount,
      downloadsCount: downloadsCount ?? this.downloadsCount,
      followedCount: followedCount ?? this.followedCount,
      tags: tags ?? this.tags,
      uploadedAt: uploadedAt,
    );
  }
}
