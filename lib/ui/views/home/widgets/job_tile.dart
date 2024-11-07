import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notifyme/core/models/job.dart';
import 'package:notifyme/core/models/svgs.dart';
import 'package:notifyme/core/theme/app_decoration.dart';
import 'package:notifyme/core/theme/app_pallete.dart';
import 'package:notifyme/ui/views/shared/screens/webview_screen.dart';

class JobTile extends StatefulWidget {
  final Job jobMobel;
  const JobTile(this.jobMobel, {super.key});

  @override
  State<JobTile> createState() => _JobTileState();
}

class _JobTileState extends State<JobTile> {
  updateUiTimer() async {
    final timeInWords = _getTimeStringName(widget.jobMobel.dateTime!);
    if (timeInWords.contains('second')) {
      await Future.delayed(const Duration(seconds: 1));
      if (mounted) {
        setState(() {});
      }
      updateUiTimer();
    }
    if (timeInWords.contains('minute')) {
      await Future.delayed(const Duration(minutes: 1));
      if (mounted) {
        setState(() {});
      }
      updateUiTimer();
    }
    if (timeInWords.contains('hour')) {
      await Future.delayed(const Duration(hours: 1));
      if (mounted) {
        setState(() {});
      }
      updateUiTimer();
    }
  }

  @override
  void initState() {
    SchedulerBinding.instance
        .addPostFrameCallback((timeStamp) => updateUiTimer());
    super.initState();
  }

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
            return JobDetailsPopUp(widget.jobMobel);
          },
        );
      },
      child: Material(
        elevation: 1,
        borderRadius: BorderRadius.circular(5),
        child: Container(
          height: 110.h,
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          decoration: AppDecoration.jobTileDecor.copyWith(
            color: Theme.of(context).cardColor,
          ),
          child: Row(
            children: [
              Container(
                  height: 60.h,
                  width: 60.w,
                  // clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    Theme.of(context).brightness == Brightness.dark
                        ? Images.upworkLogo
                        : Images.upworkLogoBlack,
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
                      widget.jobMobel.title,
                      maxLines: 2,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            SkillWrapper(
                              text: 'Job budget: ${widget.jobMobel.budget}',
                            ),
                            SkillWrapper(
                              text: 'Payment plan: ${widget.jobMobel.jobType}',
                            ),
                            SkillWrapper(
                              text:
                                  'Job level: ${widget.jobMobel.contractorTier}',
                            ),
                            SkillWrapper(
                              text: 'Payment: ${widget.jobMobel.paymentStat}',
                            ),
                            SkillWrapper(
                              text:
                                  'Client Total Expentiture: ${widget.jobMobel.clientTotalExpenditure}',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (widget.jobMobel.dateTime != null)
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        _getTimeString(widget.jobMobel.dateTime!),
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(_getTimeStringName(widget.jobMobel.dateTime!)),
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
  final duration = DateTime.now().difference(dateTime);
  if ((duration.inDays) >= 30) {
    // months
    if (duration.inDays == 30) {
      return 'month';
    }
    return 'months';
  } else if ((duration.inDays) >= 7) {
    // weeks
    if (duration.inDays == 7) {
      return 'week';
    }
    return 'weeks';
  } else if (duration.inDays > 0) {
    // days
    if (duration.inDays == 1) {
      return 'day';
    }
    return 'days';
  } else if (duration.inHours > 0) {
    // hours
    if (duration.inHours == 1) {
      return 'hour';
    }
    return 'hours';
  } else if (duration.inMinutes > 0) {
    // minutes
    if (duration.inMinutes == 1) {
      return 'minute';
    }
    return 'minutes';
  } else {
    // seconds
    if (duration.inSeconds == 1) {
      return 'second';
    }
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
      maxChildSize: 0.8,
      minChildSize: 0.4,
      builder: (
        context,
        scrollController,
      ) {
        return Container(
          width: double.infinity,
          // height: MediaQuery.of(context).size.height * 0.85,
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
                  color: Theme.of(context).brightness == Brightness.dark
                      ? AppPallete.white
                      : AppPallete.jobTileColorDark,
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
                      Text('Posted ${_getTimeString(_job.dateTime!)} '
                          '${_getTimeStringName(_job.dateTime!)} ago'),
                      const SizedBox(height: 10),
                      Text(
                        _job.description,
                        softWrap: true,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
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
                        widget: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _TextRow(
                              header: 'Payment type',
                              content: _job.jobType,
                            ),
                            const SizedBox(height: 5),
                            _TextRow(
                              header: 'Job level',
                              content: _job.contractorTier,
                            ),
                            const SizedBox(height: 5),
                            _TextRow(
                              header: 'Job Budget/Time',
                              content: _job.budget,
                            ),
                            const SizedBox(height: 5),
                            _TextRow(
                              header: 'Proposals',
                              content: _job.proposals,
                            ),
                            const SizedBox(height: 5),
                            _TextRow(
                              header: 'Payment status',
                              content: _job.paymentStat,
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 5, top: 10),
                        child: Text('Client details'),
                      ),
                      ColoredContainer(
                        widget: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _TextRow(
                              header: 'Client rating',
                              widget: RatingStars(
                                value: _job.ratingStat,
                                starSize: 12,
                                starColor: AppPallete.gold,
                                valueLabelVisibility: false,
                              ),
                            ),
                            const SizedBox(height: 5),
                            _TextRow(
                              header: 'Client total Expenditure',
                              content: _job.clientTotalExpenditure,
                            ),
                            const SizedBox(height: 5),
                            _TextRow(
                              header: 'Client country',
                              content: _job.country,
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

class _TextRow extends StatelessWidget {
  final String header;
  final String? content;
  final Widget? widget;
  const _TextRow({
    required this.header,
    this.content,
    this.widget,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          header,
          style: TextStyle(
            color: Theme.of(context).brightness == Brightness.dark
                ? AppPallete.white.withOpacity(0.3)
                : AppPallete.black.withOpacity(0.5),
          ),
        ),
        const SizedBox(width: 10),
        if (widget != null) widget!,
        if (content != null)
          Expanded(
            child: Text(
              content!,
              textAlign: TextAlign.end,
              maxLines: 2,
              softWrap: true,
            ),
          ),
      ],
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
        color: Theme.of(context).cardColor,
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
          color: Theme.of(context).brightness == Brightness.dark
              ? AppPallete.white.withOpacity(0.3)
              : AppPallete.black.withOpacity(0.5),
        ),
      ),
      child: Text(
        text,
        style: textStyle,
      ),
    );
  }
}
