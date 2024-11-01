import 'package:notifyme/app/app.locator.dart';
import 'package:notifyme/core/logger.dart';
import 'package:notifyme/core/models/job.dart';
import 'package:notifyme/services/scraper_service.dart';

class JobService {
  final scrapper = locator<ScraperService>();
  final List<Job> _jobList = [];
  List<Job> get jobList => _jobList;
  Future<List<Job>> newJobsGotten(String html) async {
    final List<Job> newJobList = [];
    try {
      final jobs = await scrapper.upworkScrapper(html);
      displayLog('Jobs Gotten! ${jobs.length}');
      for (var element in jobs) {
        if (!_jobList.any((e) => e.jobLink.trim() == element.jobLink.trim())) {
          _jobList.insert(0, element);
          newJobList.add(element);
        } else {
          errorLog('duplicate jobs detected');
        }
      }
    } catch (e) {
      errorLog(e.toString());
    }
    // return [];
    return newJobList;
  }
}
