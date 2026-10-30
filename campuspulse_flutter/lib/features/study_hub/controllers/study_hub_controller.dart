import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/study_resource.dart';
import '../../auth/controllers/auth_controller.dart';

enum StudyResourceViewMode {
  cards,
  briefList,
}

final List<StudyResource> kDefaultStudyResources = [
  StudyResource(
    id: 'res_1',
    title: 'DBMS Comprehensive Handwritten Notes (SQL + Normalization + B+ Trees)',
    description: 'Complete Unit 1-4 master notes with relational algebra, 3NF/BCNF proofs, and transaction ACID recovery. Includes past 5 years semester paper solutions.',
    subject: 'Database Management Systems',
    department: 'Computer Science & Engineering',
    semester: 5,
    type: ResourceType.handwritten,
    fileName: 'DBMS_Master_Notes_Unit1_4.pdf',
    fileSizeBytes: 4404019, // ~4.2 MB
    pageCount: 38,
    uploaderName: 'Sahab Raza',
    uploaderSgpa: 9.2,
    uploaderSemester: 5,
    rating: 4.9,
    ratingCount: 38,
    downloadsCount: 342,
    followedCount: 128,
    tags: ['SQL', 'Transactions', 'Normalization', 'B+ Trees', 'Exam Prep'],
    uploadedAt: DateTime.now().subtract(const Duration(days: 4)),
  ),
  StudyResource(
    id: 'res_2',
    title: 'Operating Systems Concurrency, Semaphores & Virtual Memory Cheatsheet',
    description: 'Compact 8-page formula sheet summarizing Semaphores, Mutexes, Banker\'s Algorithm for Deadlocks, and Page Replacement Algorithms (LRU, FIFO, Clock).',
    subject: 'Operating Systems',
    department: 'Computer Science & Engineering',
    semester: 5,
    type: ResourceType.formulaSheet,
    fileName: 'OS_Virtual_Memory_Concurrency_Cheatsheet.pdf',
    fileSizeBytes: 1887436, // ~1.8 MB
    pageCount: 8,
    uploaderName: 'Aarav Sharma',
    uploaderSgpa: 9.4,
    uploaderSemester: 5,
    rating: 4.85,
    ratingCount: 26,
    downloadsCount: 289,
    followedCount: 95,
    tags: ['Deadlock', 'Paging', 'Concurrency', 'Formula Sheet', 'Semaphores'],
    uploadedAt: DateTime.now().subtract(const Duration(days: 7)),
  ),
  StudyResource(
    id: 'res_3',
    title: 'DAA Dynamic Programming & Graph Theory PYQ 2021-2025 Solutions',
    description: 'Annotated solutions to 5 years of midterm and endsem examination problems covering DP table formulation, Dijkstra, Floyd-Warshall, and NP-Completeness.',
    subject: 'Design & Analysis of Algorithms',
    department: 'Computer Science & Engineering',
    semester: 5,
    type: ResourceType.pyq,
    fileName: 'DAA_PYQ_Solved_Papers_2021_2025.pdf',
    fileSizeBytes: 5872025, // ~5.6 MB
    pageCount: 46,
    uploaderName: 'Priya Patel',
    uploaderSgpa: 9.7,
    uploaderSemester: 5,
    rating: 4.95,
    ratingCount: 52,
    downloadsCount: 412,
    followedCount: 164,
    tags: ['Dynamic Programming', 'Graphs', 'Dijkstra', 'Floyd Warshall', 'PYQ'],
    uploadedAt: DateTime.now().subtract(const Duration(days: 10)),
  ),
  StudyResource(
    id: 'res_4',
    title: 'Computer Networks OSI & TCP/IP Protocol Suite Lab Manual with Wireshark',
    description: 'Step-by-step practical lab instructions, packet captures, subnetting calculations, and socket programming in Python with screenshot evidence.',
    subject: 'Computer Networks',
    department: 'Computer Science & Engineering',
    semester: 5,
    type: ResourceType.labManual,
    fileName: 'CN_Lab_Manual_Wireshark_Sockets.pdf',
    fileSizeBytes: 3250585, // ~3.1 MB
    pageCount: 28,
    uploaderName: 'Ananya Sengupta',
    uploaderSgpa: 9.0,
    uploaderSemester: 5,
    rating: 4.75,
    ratingCount: 19,
    downloadsCount: 184,
    followedCount: 82,
    tags: ['OSI Model', 'TCP/IP', 'Subnetting', 'Wireshark', 'Socket Programming'],
    uploadedAt: DateTime.now().subtract(const Duration(days: 14)),
  ),
  StudyResource(
    id: 'res_5',
    title: 'Compiler Design LR(0), SLR(1) & LALR(1) Parsing Table Quick Guide',
    description: 'Handcrafted syntax tree representations, FIRST and FOLLOW calculations, and canonical item construction for compiler construction midterms.',
    subject: 'Compiler Design',
    department: 'Computer Science & Engineering',
    semester: 5,
    type: ResourceType.pdf,
    fileName: 'Compiler_LR_Parsing_Quick_Guide.pdf',
    fileSizeBytes: 2516582, // ~2.4 MB
    pageCount: 18,
    uploaderName: 'Rohan Verma',
    uploaderSgpa: 9.1,
    uploaderSemester: 5,
    rating: 4.8,
    ratingCount: 14,
    downloadsCount: 146,
    followedCount: 65,
    tags: ['Compilers', 'Parsing', 'LALR', 'FIRST FOLLOW', 'Syntax Tree'],
    uploadedAt: DateTime.now().subtract(const Duration(days: 18)),
  ),
];

class StudyHubState {
  final List<StudyResource> resources;
  final String searchQuery;
  final String selectedType; // 'All', 'PDF', 'Handwritten', 'PYQ', 'Formula Sheet', 'Lab Manual'
  final String selectedSubject; // 'All Subjects', ...
  final String sortBy; // 'rating', 'most_used', 'newest'
  final StudyResourceViewMode viewMode;
  final Set<String> bookmarkedIds;
  final Set<String> followedIds;
  final Set<String> downloadedIds;

  const StudyHubState({
    required this.resources,
    this.searchQuery = '',
    this.selectedType = 'All',
    this.selectedSubject = 'All Subjects',
    this.sortBy = 'rating',
    this.viewMode = StudyResourceViewMode.cards,
    this.bookmarkedIds = const {},
    this.followedIds = const {},
    this.downloadedIds = const {},
  });

  List<String> get availableSubjects {
    final set = <String>{'All Subjects'};
    for (final r in resources) {
      set.add(r.subject);
    }
    return set.toList();
  }

  List<StudyResource> get filteredResources {
    var list = resources.where((r) {
      // Type filter
      if (selectedType != 'All') {
        if (selectedType == 'PDF' && r.type != ResourceType.pdf) return false;
        if (selectedType == 'Handwritten' && r.type != ResourceType.handwritten) return false;
        if (selectedType == 'PYQ' && r.type != ResourceType.pyq) return false;
        if (selectedType == 'Formula Sheet' && r.type != ResourceType.formulaSheet) return false;
        if (selectedType == 'Lab Manual' && r.type != ResourceType.labManual) return false;
      }

      // Subject filter
      if (selectedSubject != 'All Subjects' && r.subject != selectedSubject) {
        return false;
      }

      // Search query
      if (searchQuery.trim().isNotEmpty) {
        final query = searchQuery.trim().toLowerCase();
        final inTitle = r.title.toLowerCase().contains(query);
        final inSubject = r.subject.toLowerCase().contains(query);
        final inDesc = r.description.toLowerCase().contains(query);
        final inAuthor = r.uploaderName.toLowerCase().contains(query);
        final inTags = r.tags.any((t) => t.toLowerCase().contains(query));
        if (!inTitle && !inSubject && !inDesc && !inAuthor && !inTags) {
          return false;
        }
      }

      return true;
    }).toList();

    // Sorting
    if (sortBy == 'rating') {
      list.sort((a, b) => b.rating.compareTo(a.rating));
    } else if (sortBy == 'most_used') {
      list.sort((a, b) => b.downloadsCount.compareTo(a.downloadsCount));
    } else if (sortBy == 'newest') {
      list.sort((a, b) => b.uploadedAt.compareTo(a.uploadedAt));
    }

    return list;
  }

  StudyHubState copyWith({
    List<StudyResource>? resources,
    String? searchQuery,
    String? selectedType,
    String? selectedSubject,
    String? sortBy,
    StudyResourceViewMode? viewMode,
    Set<String>? bookmarkedIds,
    Set<String>? followedIds,
    Set<String>? downloadedIds,
  }) {
    return StudyHubState(
      resources: resources ?? this.resources,
      searchQuery: searchQuery ?? this.searchQuery,
      selectedType: selectedType ?? this.selectedType,
      selectedSubject: selectedSubject ?? this.selectedSubject,
      sortBy: sortBy ?? this.sortBy,
      viewMode: viewMode ?? this.viewMode,
      bookmarkedIds: bookmarkedIds ?? this.bookmarkedIds,
      followedIds: followedIds ?? this.followedIds,
      downloadedIds: downloadedIds ?? this.downloadedIds,
    );
  }
}

class StudyHubNotifier extends StateNotifier<StudyHubState> {
  final Ref _ref;

  StudyHubNotifier(this._ref)
      : super(StudyHubState(resources: kDefaultStudyResources));

  void setSearchQuery(String query) {
    state = state.copyWith(searchQuery: query);
  }

  void setTypeFilter(String type) {
    state = state.copyWith(selectedType: type);
  }

  void setSubjectFilter(String subject) {
    state = state.copyWith(selectedSubject: subject);
  }

  void setSortBy(String sortBy) {
    state = state.copyWith(sortBy: sortBy);
  }

  void toggleViewMode() {
    final next = state.viewMode == StudyResourceViewMode.cards
        ? StudyResourceViewMode.briefList
        : StudyResourceViewMode.cards;
    state = state.copyWith(viewMode: next);
  }

  void setViewMode(StudyResourceViewMode mode) {
    state = state.copyWith(viewMode: mode);
  }

  void toggleBookmark(String id) {
    final current = Set<String>.from(state.bookmarkedIds);
    if (current.contains(id)) {
      current.remove(id);
    } else {
      current.add(id);
    }
    state = state.copyWith(bookmarkedIds: current);
  }

  void toggleFollow(String id) {
    final current = Set<String>.from(state.followedIds);
    final isFollowing = current.contains(id);
    if (isFollowing) {
      current.remove(id);
    } else {
      current.add(id);
    }

    // Update follow count in resource
    final updated = state.resources.map((r) {
      if (r.id == id) {
        return r.copyWith(followedCount: r.followedCount + (isFollowing ? -1 : 1));
      }
      return r;
    }).toList();

    state = state.copyWith(
      followedIds: current,
      resources: updated,
    );
  }

  void recordDownload(String id) {
    final current = Set<String>.from(state.downloadedIds)..add(id);
    final updated = state.resources.map((r) {
      if (r.id == id) {
        return r.copyWith(downloadsCount: r.downloadsCount + 1);
      }
      return r;
    }).toList();

    state = state.copyWith(
      downloadedIds: current,
      resources: updated,
    );
  }

  /// Upload a brand-new study document
  StudyResource uploadResource({
    required String title,
    required String description,
    required String subject,
    required ResourceType type,
    required String fileName,
    int fileSizeBytes = 2800000,
    int pageCount = 16,
    List<String> tags = const [],
    int semester = 5,
    String department = 'Computer Science & Engineering',
  }) {
    final user = _ref.read(authControllerProvider).currentUser;
    final uploaderName = user?.fullName ?? 'Aarav Sharma';
    const uploaderSgpa = 9.4;
    final uploaderSem = user?.semester ?? semester;

    final newResource = StudyResource(
      id: 'res_${DateTime.now().millisecondsSinceEpoch}',
      title: title,
      description: description,
      subject: subject,
      department: department,
      semester: uploaderSem,
      type: type,
      fileName: fileName,
      fileSizeBytes: fileSizeBytes,
      pageCount: pageCount,
      uploaderName: uploaderName,
      uploaderSgpa: uploaderSgpa,
      uploaderSemester: uploaderSem,
      rating: 5.0,
      ratingCount: 1,
      downloadsCount: 1,
      followedCount: 1,
      tags: tags,
      uploadedAt: DateTime.now(),
    );

    state = state.copyWith(
      resources: [newResource, ...state.resources],
    );

    return newResource;
  }
}

final studyHubProvider = StateNotifierProvider<StudyHubNotifier, StudyHubState>((ref) {
  return StudyHubNotifier(ref);
});
