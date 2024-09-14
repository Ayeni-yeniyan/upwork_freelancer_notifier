import 'package:notifyme/app/app.locator.dart';
import 'package:notifyme/core/logger.dart';
import 'package:notifyme/core/models/job.dart';
import 'package:notifyme/services/scraper_service.dart';

class JobService {
  final scrapper = locator<ScraperService>();
  final List<Job> _jobList = [];
  List<Job> get jobList => _jobList;
  Future<bool> newJobsGotten(String html) async {
    bool newJobsAvailable = false;
    try {
      final jobs = await scrapper.upworkScrapper(html);
      displayLog('Jobs Gotten! ${jobs.length}');
      for (var element in jobs) {
        if (!_jobList.any((e) => e.jobLink.trim() == element.jobLink.trim())) {
          newJobsAvailable = true;
          _jobList.insert(0, element);
        } else {
          errorLog('duplicate jobs detected');
        }
      }
      // return await scrapper.upworkScrapper(html);
    } catch (e) {
      errorLog(e.toString());
    }
    // return [];
    return newJobsAvailable;
  }
}
