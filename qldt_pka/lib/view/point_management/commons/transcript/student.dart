class Student {
  final String name;
  int totalCredits;
  int cumulativeCredits;
  double averageGradeH4;
  double averageGradeH10;
  double averageGradeCumulativeH4;
  double averageGradeCumulativeH10;

  Student({
    required this.name,
    this.totalCredits = 105,
    this.cumulativeCredits = 103,
    this.averageGradeH4 = 1.2,
    this.averageGradeH10 = 5.3,
    this.averageGradeCumulativeH4 = 3.4,
    this.averageGradeCumulativeH10 = 12.1,
  });
}
