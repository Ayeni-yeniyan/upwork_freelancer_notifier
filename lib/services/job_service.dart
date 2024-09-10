import 'package:notifyme/app/app.locator.dart';
import 'package:notifyme/core/logger.dart';
import 'package:notifyme/core/models/job.dart';
import 'package:notifyme/services/scraper_service.dart';

class JobService {
  final scrapper = locator<ScraperService>();
  Future<List<Job>> getJobUpdates(String html) async {
    try {
      return await scrapper.upworkScrapper(html);
    } catch (e) {
      errorLog(e.toString());
    }
    return [];
  }
}
