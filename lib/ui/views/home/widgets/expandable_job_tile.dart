import 'package:flutter/material.dart';
import 'package:upwork_freelancer_notifier/core/app_decoration.dart';
import 'package:upwork_freelancer_notifier/ui/common/ui_helpers.dart';

class ExpandableJobTile extends StatefulWidget {
  const ExpandableJobTile({
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
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    _animation = Tween<double>(begin: 0, end: .9).animate(_controller)
      ..addListener(
        () {
          print(_animation.value);
          setState(() {});
        },
      );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: const BoxDecoration(),
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
              const Text('Test Job title'),
              const Spacer(),
              const Text('date'),
            ],
          ),
          if (_isExpanded) ...[
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: AppDecoration.skillDecor,
                  child: const Text('job type'),
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: AppDecoration.skillDecor,
                  child: const Text('contractor type'),
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: AppDecoration.skillDecor,
                  child: const Text('duration'),
                ),
              ],
            ),
            const Text('Full data'),
            const Text('description'),
            Row(
              children: [
                Container(
                    padding: const EdgeInsets.all(15),
                    decoration: AppDecoration.skillDecor,
                    child: const Text('skills')),
              ],
            ),
            Wrap(
              children: [
                'Payment stat',
                'rating',
                'amount spent',
                'country',
              ]
                  .map((e) => Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(e),
                      ))
                  .toList(),
            ),
            const Text('proposal'),
          ]
        ],
      ),
    );
  }
}
