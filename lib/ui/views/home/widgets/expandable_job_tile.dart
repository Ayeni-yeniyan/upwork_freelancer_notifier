import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:notifyme/core/models/job.dart';
import 'package:notifyme/core/models/svgs.dart';
import 'package:notifyme/core/theme/app_decoration.dart';
import 'package:notifyme/core/theme/app_pallete.dart';
import 'package:notifyme/ui/common/ui_helpers.dart';
import 'package:notifyme/ui/views/shared/screens/webview_screen.dart';

class JobTile extends StatelessWidget {
  final Job jobMobel;
  const JobTile(this.jobMobel, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          useSafeArea: true,
          enableDrag: true,
          builder: (context) {
            return JobDetailsPopUp(jobMobel);
          },
        );
      },
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(5),
        child: Container(
          height: 100,
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: AppPallete.jobTileColor,
            border: Border.all(
              color: AppPallete.jobTileBorder,
            ),
          ),
          child: Row(
            children: [
              Container(
                  height: 60,
                  width: 60,
                  // clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'assets/images/upwork_white.png',
                    fit: BoxFit.contain,
                  )
                  //  SvgPicture.asset(Svgs.upworkLogo),
                  ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      jobMobel.title,
                      maxLines: 2,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            SkillWrapper(
                              text: 'Job budget: ${jobMobel.budget}',
                            ),
                            SkillWrapper(
                              text: 'Payment plan: ${jobMobel.jobType}',
                            ),
                            SkillWrapper(
                              text: 'Job level: ${jobMobel.contractorTier}',
                            ),
                            SkillWrapper(
                              text: 'Payment: ${jobMobel.paymentStat}',
                            ),
                            SkillWrapper(
                              text:
                                  'Client Total Expentiture: ${jobMobel.clientTotalExpenditure}',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (jobMobel.dateTime != null)
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        _getTimeString(jobMobel.dateTime!),
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(_getTimeStringName(jobMobel.dateTime!)),
                      const Text('ago'),
                    ],
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}

String _getTimeString(DateTime dateTime) {
  final duration = DateTime.now().difference(dateTime);
  if ((duration.inDays) > 30) {
    // months
    return (duration.inDays ~/ 30).toString();
  } else if ((duration.inDays) > 7) {
    // weeks
    return (duration.inDays ~/ 7).toString();
  } else if (duration.inDays > 0) {
    // days
    return duration.inDays.toString();
  } else if (duration.inHours > 0) {
    // hours
    return duration.inHours.toString();
  } else if (duration.inMinutes > 0) {
    // minutes
    return duration.inMinutes.toString();
  } else {
    // seconds
    return duration.inSeconds.toString();
  }
}

String _getTimeStringName(DateTime dateTime) {
  final durationInSeconds = DateTime.now().difference(dateTime).inSeconds;

  final duration = DateTime.now().difference(dateTime);
  if ((duration.inDays) > 30) {
    // months
    return 'months';
  } else if ((duration.inDays) > 7) {
    // weeks
    return 'weeks';
  } else if (duration.inDays > 0) {
    // days
    return 'days';
  } else if (duration.inHours > 0) {
    // hours
    return 'hours';
  } else if (duration.inMinutes > 0) {
    // minutes
    return 'minutes';
  } else {
    // seconds
    return 'seconds';
  }
}

class JobDetailsPopUp extends StatelessWidget {
  final Job _job;
  const JobDetailsPopUp(
    this._job, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.6,
      maxChildSize: 0.9,
      minChildSize: 0.3,
      builder: (
        context,
        scrollController,
      ) {
        return Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.85,
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 8,
                width: 80,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppPallete.white,
                ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WebviewScreen(
                        webLink: 'https://www.upwork.com${_job.jobLink}',
                      ),
                    ),
                  );
                },
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        _job.title.trim(),
                        softWrap: true,
                        style: const TextStyle(
                          fontSize: 24,
                        ),
                      ),
                    ),
                    const Icon(Icons.arrow_outward_rounded),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Expanded(
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _job.description,
                        softWrap: true,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      // const SizedBox(height: 20),
                      const Padding(
                        padding: EdgeInsets.only(left: 5, top: 10),
                        child: Text('Skills'),
                      ),
                      Wrap(
                        children: _job.skills
                                ?.map((e) => SkillWrapper(text: e))
                                .toList() ??
                            [],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 5, top: 10),
                        child: Text('Job details'),
                      ),
                      ColoredContainer(
                        widget: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Job type',
                                  style: TextStyle(
                                    color: AppPallete.white.withOpacity(0.5),
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  'Job level',
                                  style: TextStyle(
                                    color: AppPallete.white.withOpacity(0.5),
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  'Job Budget/Time',
                                  style: TextStyle(
                                    color: AppPallete.white.withOpacity(0.5),
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  'Proposals',
                                  style: TextStyle(
                                    color: AppPallete.white.withOpacity(0.5),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(_job.jobType),
                                const SizedBox(height: 5),
                                Text(_job.contractorTier),
                                const SizedBox(height: 5),
                                Text(_job.budget),
                                const SizedBox(height: 5),
                                Text(_job.proposals),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 5, top: 10),
                        child: Text('Client details'),
                      ),
                      ColoredContainer(
                        widget: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Client rating',
                                  style: TextStyle(
                                    color: AppPallete.white.withOpacity(0.5),
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  'Client total Expenditure',
                                  style: TextStyle(
                                    color: AppPallete.white.withOpacity(0.5),
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  'Client country',
                                  style: TextStyle(
                                    color: AppPallete.white.withOpacity(0.5),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                RatingStars(
                                  value: _job.ratingStat,
                                  starSize: 12,
                                  starColor: AppPallete.gold,
                                  valueLabelVisibility: false,
                                ),
                                const SizedBox(height: 5),
                                Text(_job.clientTotalExpenditure),
                                const SizedBox(height: 5),
                                Text(_job.country),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ColoredContainer extends StatelessWidget {
  final Widget widget;
  const ColoredContainer({
    super.key,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppPallete.appbarColor,
      ),
      child: widget,
    );
  }
}

class SkillWrapper extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final Color? color;
  const SkillWrapper({
    super.key,
    required this.text,
    this.textStyle,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 10,
      ),
      margin: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
        border: Border.all(
          color: AppPallete.white.withOpacity(0.3),
        ),
      ),
      child: Text(
        text,
        style: textStyle,
      ),
    );
  }
}
