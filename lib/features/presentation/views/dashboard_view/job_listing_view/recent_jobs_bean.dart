class RecentJobsBean {
  final String? companyName;
  final String? date;
  final String? designation;
  final String? amount;
  final String? location;
  final String? logo;
  final String? jobDescription;
  final List<String>? requirement;
  final bool? applied;

  RecentJobsBean({
    this.companyName,
    this.date,
    this.designation,
    this.amount,
    this.location,
    this.jobDescription,
    this.logo,
    this.requirement,
    this.applied,
  });
}
