import 'package:beautiful_soup_dart/beautiful_soup.dart';
import 'package:notifyme/core/errors/custom_exception.dart';
import 'package:notifyme/core/logger.dart';
import 'package:notifyme/core/models/job.dart';

class ScraperService {
  Future<List<Job>> upworkScrapper(String html) async {
    infoLog('Started scrapper');
    try {
      final soup = BeautifulSoup.fragment(html);
      final items = soup.findAll('section',
          class_: 'air3-card-section air3-card-hover p-4 px-2x px-md-4x');
      List<Job> jobList = [];
      for (var item in items) {
        infoLog('Started scraping ${item.text}');
        final description = item
                .find('div',
                    class_:
                        'air3-line-clamp-wrapper text-body break job-description')
                ?.text ??
            'error';
        final jobLink = item.find('a')?.getAttrValue('href') ?? 'Link error';
        final title = item
                .find('h3', class_: 'my-0 p-sm-right job-tile-title text-base')
                ?.text ??
            'error';
        final time = item
                .find('span', class_: 'text-caption text-light-on-inverse')
                ?.text ??
            'error';
        final paymentStat =
            item.find('strong', class_: 'text-light text-base-sm')?.text ?? '';
        final country = item
                .find('small',
                    class_:
                        'd-inline-flex text-base-sm text-light pb-3 pb-md-0')
                ?.text ??
            '';
        final ratingStat = item
                .find('span',
                    class_: 'mb-0 vertical-align-top pr-3 pb-3 pb-md-0')
                ?.text ??
            '';
        final amountSpent = item
                .find('small',
                    class_:
                        'd-inline-block text-base-sm pr-6 pb-3 text-light pb-md-0')
                ?.text ??
            'error';
        final budget = item
                .find('small',
                    class_: 'text-light display-inline-block text-caption')
                ?.text ??
            'error';
        final skills = item
            .find('ul', class_: 'air3-token-wrap')
            ?.children
            .map((e) => e.text)
            .toList();
        final proposals = item
                .find('small', class_: 'd-inline-block mr-3x text-light pr-3')
                ?.text ??
            'error';
        final newJob = Job(
          description: description,
          jobLink: jobLink,
          title: title,
          time: time,
          paymentStat: paymentStat,
          country: country,
          ratingStat: ratingStat,
          amountSpent: amountSpent,
          budget: budget,
          skills: skills,
          proposals: proposals,
        );

        jobList.add(newJob);
      }
      return jobList;
    } catch (e) {
      throw CustomException('An error occured');
    }
  }

  // TODO: implement freelancer scraping too
}
