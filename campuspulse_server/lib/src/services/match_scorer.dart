/// Candidate match scoring algorithm for CampusPulse "Connect" feature.
class MatchScorer {
  /// Computes a match score from 0 to 100 based on:
  /// - Required skill overlap (40% weight)
  /// - Preferred skill overlap (20% weight)
  /// - Shared interests (15% weight)
  /// - Same college bonus (15% weight)
  /// - Same branch/year bonus (10% weight)
  static MatchResult computeScore({
    required List<String> requiredSkills,
    required List<String> preferredSkills,
    required List<String> userInterests,
    required String userCollege,
    required String? userBranch,
    required int? userYear,
    required List<String> candidateSkills,
    required List<String> candidateInterests,
    required String candidateCollege,
    required String? candidateBranch,
    required int? candidateYear,
  }) {
    final lowerCandidateSkills = candidateSkills.map((s) => s.trim().toLowerCase()).toSet();
    final lowerCandidateInterests = candidateInterests.map((s) => s.trim().toLowerCase()).toSet();

    // 1. Required skills match
    int matchedRequired = 0;
    final matchingSkillChips = <String>[];
    for (final skill in requiredSkills) {
      final s = skill.trim().toLowerCase();
      if (lowerCandidateSkills.contains(s)) {
        matchedRequired++;
        matchingSkillChips.add(skill);
      }
    }
    double requiredScore = 0.0;
    if (requiredSkills.isNotEmpty) {
      requiredScore = (matchedRequired / requiredSkills.length) * 40.0;
    } else {
      requiredScore = 40.0; // If no required skills specified, full base score
    }

    // 2. Preferred skills match
    int matchedPreferred = 0;
    for (final skill in preferredSkills) {
      final s = skill.trim().toLowerCase();
      if (lowerCandidateSkills.contains(s)) {
        matchedPreferred++;
        if (!matchingSkillChips.contains(skill)) {
          matchingSkillChips.add(skill);
        }
      }
    }
    double preferredScore = 0.0;
    if (preferredSkills.isNotEmpty) {
      preferredScore = (matchedPreferred / preferredSkills.length) * 20.0;
    }

    // 3. Interest overlap
    int matchedInterests = 0;
    for (final interest in userInterests) {
      final i = interest.trim().toLowerCase();
      if (lowerCandidateInterests.contains(i)) {
        matchedInterests++;
      }
    }
    double interestScore = 0.0;
    if (userInterests.isNotEmpty) {
      interestScore = (matchedInterests / userInterests.length) * 15.0;
      if (interestScore > 15.0) interestScore = 15.0;
    }

    // 4. Same college bonus
    double collegeBonus = 0.0;
    if (userCollege.trim().toLowerCase() == candidateCollege.trim().toLowerCase()) {
      collegeBonus = 15.0;
    }

    // 5. Branch & Year bonus
    double branchYearBonus = 0.0;
    if (userBranch != null && candidateBranch != null && userBranch.trim().toLowerCase() == candidateBranch.trim().toLowerCase()) {
      branchYearBonus += 5.0;
    }
    if (userYear != null && candidateYear != null && userYear == candidateYear) {
      branchYearBonus += 5.0;
    }

    final totalScore = (requiredScore + preferredScore + interestScore + collegeBonus + branchYearBonus).round().clamp(0, 100);

    return MatchResult(
      matchPercentage: totalScore,
      matchedSkills: matchingSkillChips,
      matchedInterestCount: matchedInterests,
      isSameCollege: collegeBonus > 0,
    );
  }
}

class MatchResult {
  final int matchPercentage;
  final List<String> matchedSkills;
  final int matchedInterestCount;
  final bool isSameCollege;

  const MatchResult({
    required this.matchPercentage,
    required this.matchedSkills,
    required this.matchedInterestCount,
    required this.isSameCollege,
  });
}
