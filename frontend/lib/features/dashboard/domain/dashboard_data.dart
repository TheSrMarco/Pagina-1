class DashboardData {
  const DashboardData({
    required this.average,
    required this.attendance,
    required this.subjectCount,
    required this.pendingTasks,
    required this.activeLoans,
    required this.fileCount,
    required this.subjects,
  });

  factory DashboardData.fromJson(Map<String, dynamic> json) {
    return DashboardData(
      average: (json['average'] as num).toDouble(),
      attendance: json['attendance'] as int,
      subjectCount: json['subject_count'] as int,
      pendingTasks: json['pending_tasks'] as int,
      activeLoans: json['active_loans'] as int,
      fileCount: json['file_count'] as int,
      subjects: (json['subjects'] as List<dynamic>)
          .map((subject) => subject as String)
          .toList(),
    );
  }

  final double average;
  final int attendance;
  final int subjectCount;
  final int pendingTasks;
  final int activeLoans;
  final int fileCount;
  final List<String> subjects;
}
