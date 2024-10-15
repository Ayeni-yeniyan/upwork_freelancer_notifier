import 'package:flutter/material.dart';
import 'package:notifyme/core/models/job.dart';
import 'package:notifyme/core/theme/app_decoration.dart';
import 'package:notifyme/ui/common/ui_helpers.dart';

class ExpandableJobTile extends StatefulWidget {
  final Job jobMobel;
  const ExpandableJobTile(
    this.jobMobel, {
    super.key,
  });

  @override
  State<ExpandableJobTile> createState() => _ExpandableJobTileState();
}

class _ExpandableJobTileState extends State<ExpandableJobTile>
    with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _controller;
  bool _isExpanded = false;
  @override
  void initState() {
    _initAnimation();
    super.initState();
  }

  void _initAnimation() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    _animation = Tween<double>(begin: 0, end: .9).animate(_controller)
      ..addListener(
        () {
          setState(() {});
        },
      );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.all(10),
      decoration: AppDecoration.jobTileDecor,
      child: Column(
        children: [
          Row(
            children: [
              GestureDetector(
                child: Transform.rotate(
                  angle: _animation.value,
                  child: const Icon(Icons.add),
                ),
                onTap: () => setState(() {
                  if (_controller.isCompleted) {
                    _controller.reverse();
                  } else {
                    _controller.forward();
                  }
                  _isExpanded = !_isExpanded;
                }),
              ),
              horizontalSpaceSmall,
              Expanded(child: Text(widget.jobMobel.title)),
              horizontalSpaceTiny,
              Text(widget.jobMobel.time),
            ],
          ),
          if (_isExpanded)
            Column(
              children: [
                Row(
                  children: [widget.jobMobel.budget]
                      .map((e) => Container(
                            padding: const EdgeInsets.all(15),
                            decoration: AppDecoration.skillDecor,
                            child: Text(e),
                          ))
                      .toList(),
                ),
                Text(widget.jobMobel.description),
                const Text('description'),
                if (widget.jobMobel.skills != null)
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.jobMobel.skills!.length,
                      itemBuilder: (context, index) => Container(
                          padding: const EdgeInsets.all(15),
                          decoration: AppDecoration.skillDecor,
                          child: Text(widget.jobMobel.skills![index])),
                    ),
                  ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    widget.jobMobel.paymentStat,
                    widget.jobMobel.ratingStat,
                    widget.jobMobel.amountSpent,
                    widget.jobMobel.country,
                  ]
                      .map((e) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 3),
                            child: Text(e),
                          ))
                      .toList(),
                ),
                Text(widget.jobMobel.proposals),
              ],
            ),
        ],
      ),
    );
  }
}

class JobTile extends StatelessWidget {
  final Job jobMobel;
  const JobTile(this.jobMobel, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: Colors.amber),
      child: Row(
        children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(jobMobel.title),
            ],
          )),
          const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('22'),
              Text('secs'),
              Text('ago'),
              // Icon(Icons.keyboard_arrow_down)
            ],
          )
        ],
      ),
    );
  }
}
