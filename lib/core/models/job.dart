import 'package:isar/isar.dart';

part 'job.g.dart';

@collection
class Job {
  Id id = Isar.autoIncrement;
  final String description;
  final String jobLink;
  final String title;
  final String time;
  final String paymentStat;
  final String country;
  final String ratingStat;
  final String amountSpent;
  final String budget;
  final List<String>? skills;
  final String proposals;
  bool isViewed;

  Job({
    required this.description,
    required this.jobLink,
    required this.title,
    required this.time,
    required this.paymentStat,
    required this.country,
    required this.ratingStat,
    required this.amountSpent,
    required this.budget,
    required this.skills,
    required this.proposals,
    this.isViewed = false,
  });
  void toggleViewTrue() => isViewed = true;
}
