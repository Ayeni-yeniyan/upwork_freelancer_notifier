import 'package:beautiful_soup_dart/beautiful_soup.dart';
import 'package:notifyme/core/errors/custom_exception.dart';
import 'package:notifyme/core/logger.dart';
import 'package:notifyme/core/models/job.dart';

class ScraperService {
  final List<String> _processedJobs = [];
  Future<List<Job>> upworkScrapper(String html) async {
    infoLog('Started scrapper');
    try {
      final soup = BeautifulSoup.fragment(html);
      final items = soup.findAll('section',
          class_: 'air3-card-section air3-card-hover p-4 px-2x px-md-4x');
      List<Job> jobList = [];
      for (var item in items) {
        infoLog('Started scraping ${item.text}');
        final title = item
                .find('h3', class_: 'my-0 p-sm-right job-tile-title text-base')
                ?.text ??
            'error';
        final description = item
                .find('div',
                    class_:
                        'air3-line-clamp-wrapper text-body break job-description')
                ?.text ??
            'error';
        final jobLink = item.find('a')?.getAttrValue('href') ?? 'Link error';

        final time = item
                .find('span', class_: 'text-caption text-light-on-inverse')
                ?.text
                .replaceAll('Posted', '')
                .trim() ??
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
        final sm = item
            .find('small',
                class_: 'text-light display-inline-block text-caption')
            ?.children
            .map((e) => e.text)
            .toList();
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
        if (!_processedJobs.any((e) => e.trim() == jobLink.trim())) {
          _processedJobs.add(jobLink);
          final newJob = Job(
            notifId: _processedJobs.length + 1,
            description:
                description.replaceAll(' more  about "$title"', '').trim(),
            jobLink: jobLink.trim(),
            jobType: sm?[0].trim() ?? '',
            contractorTier: sm?[1].replaceAll('-', '').trim() ?? '',
            clientStat: budget.trim(),
            title: title.trim(),
            time: time.trim(),
            paymentStat: paymentStat.trim(),
            country: country.trim(),
            ratingStat: double.tryParse(ratingStat
                    .replaceAll('Rating is ', '')
                    .trim()
                    .split(' ')[0]) ??
                0,
            clientTotalExpenditure: amountSpent.replaceAll('spent', '').trim(),
            budget: sm?[2]
                    .replaceAll('-', '')
                    .replaceAll('Est. Budget: ', '')
                    .replaceAll('Est. Time: ', '')
                    .trim() ??
                '',
            skills: skills,
            proposals: proposals.replaceAll('Proposals: ', '').trim(),
            dateTime: _getDuration(time),
          );

          jobList.add(newJob);
        }
      }

      return jobList.reversed.toList();
    } catch (e) {
      throw CustomException('An error occured');
    }
  }

  // TODO: implement freelancer scraping too
}

DateTime _getDuration(String timeAgo) {
  final tA = timeAgo.replaceAll('ago', '');
  bool c(String v) => tA.contains(v);
  int? removeAndConvert(String time, String remove) {
    final tVariable = time.replaceAll(remove, '');
    return int.tryParse(tVariable);
  }

  if (c('seconds')) {
    final duration = removeAndConvert(tA, 'seconds');
    if (duration != null) {
      return DateTime.now().subtract(
        Duration(seconds: duration),
      );
    }
  } else if (c('second')) {
    return DateTime.now().subtract(
      const Duration(seconds: 1),
    );
  } else if (c('minutes')) {
    final duration = removeAndConvert(tA, 'minutes');
    if (duration != null) {
      return DateTime.now().subtract(
        Duration(minutes: duration),
      );
    }
  } else if (c('minute')) {
    return DateTime.now().subtract(
      const Duration(minutes: 1),
    );
  } else if (c('hours')) {
    final duration = removeAndConvert(tA, 'hours');
    if (duration != null) {
      return DateTime.now().subtract(
        Duration(hours: duration),
      );
    }
  } else if (c('hour')) {
    return DateTime.now().subtract(
      const Duration(hours: 1),
    );
  } else if (c('yesterday')) {
    return DateTime.now().subtract(
      const Duration(days: 1),
    );
  } else if (c('days')) {
    final duration = removeAndConvert(tA, 'days');
    if (duration != null) {
      return DateTime.now().subtract(
        Duration(days: duration),
      );
    }
  } else if (c('weeks')) {
    final duration = removeAndConvert(tA, 'weeks');
    if (duration != null) {
      return DateTime.now().subtract(
        Duration(days: 7 * duration),
      );
    }
  } else if (c('week')) {
    return DateTime.now().subtract(
      const Duration(days: 7),
    );
  } else if (c('months')) {
    final duration = removeAndConvert(tA, 'months');
    if (duration != null) {
      return DateTime.now().subtract(
        Duration(days: 30 * duration),
      );
    }
  } else if (c('month')) {
    return DateTime.now().subtract(
      const Duration(days: 30),
    );
  } else if (c('quarters')) {
    final duration = removeAndConvert(tA, 'quarters');
    if (duration != null) {
      return DateTime.now().subtract(
        Duration(days: 90 * duration),
      );
    }
  } else if (c('quarter')) {
    return DateTime.now().subtract(
      const Duration(days: 90),
    );
  }
  return DateTime.now();
}
