import 'package:isar/isar.dart';

part 'job.g.dart';

@collection
class Job {
  Id id = Isar.autoIncrement;
  final int notifId;
  final String description;
  final String jobLink;
  final String title;
  final String time;
  final String paymentStat;
  final String clientStat;
  final String country;
  final double ratingStat;
  final String clientTotalExpenditure;
  final String budget;
  final String jobType;
  final String contractorTier;
  final List<String>? skills;
  final String proposals;
  final DateTime? dateTime;
  bool isViewed;

  Job({
    required this.description,
    required this.jobLink,
    required this.notifId,
    required this.title,
    required this.time,
    required this.paymentStat,
    required this.country,
    required this.ratingStat,
    required this.clientTotalExpenditure,
    required this.budget,
    required this.skills,
    required this.proposals,
    required this.dateTime,
    required this.clientStat,
    required this.jobType,
    required this.contractorTier,
    this.isViewed = false,
  });
  void toggleViewTrue() => isViewed = true;
}
