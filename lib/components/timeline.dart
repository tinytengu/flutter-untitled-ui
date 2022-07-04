import 'package:flutter/material.dart';

enum TimeLineEventStatus {
  pending,
  current,
  completed,
}

class TimeLineEvent {
  final String title;
  final String caption;
  final TimeLineEventStatus status;

  const TimeLineEvent({
    required this.title,
    required this.caption,
    this.status = TimeLineEventStatus.pending,
  });
}

class Timeline extends StatelessWidget {
  final List<TimeLineEvent> events;

  const Timeline({Key? key, required this.events}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (BuildContext context) {
      return Column(
        children: _buildEvents(context, events),
      );
    });
  }

  List<Widget> _buildEvents(BuildContext context, List<TimeLineEvent> events) {
    var idx = 0;
    return events.map((event) {
      idx++;
      return _buildEvent(context, event, isLast: idx == events.length);
    }).toList();
  }

  Widget _buildCircle(BuildContext context, TimeLineEvent event) {
    switch (event.status) {
      case TimeLineEventStatus.completed:
        return DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Icon(
              Icons.check,
              color: Theme.of(context).colorScheme.primary,
              size: 18,
            ),
          ),
        );
      case TimeLineEventStatus.current:
        return DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(width: 9, color: Colors.white),
            color: Theme.of(context).colorScheme.secondary,
          ),
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: SizedBox(
              width: 18,
              height: 18,
            ),
          ),
        );
      case TimeLineEventStatus.pending:
        return DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(width: 2, color: Colors.white),
          ),
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(
                  width: 6,
                  color: Theme.of(context).colorScheme.primary,
                ),
                color: Colors.white,
              ),
              child: SizedBox(
                width: 18,
                height: 18,
              ),
            ),
          ),
        );
    }
  }

  Widget _buildEvent(BuildContext context, TimeLineEvent event,
      {bool isLast = false}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Graphics
        Column(
          children: [
            _buildCircle(context, event),
            SizedBox(height: 5),
            // Vertical line
            Visibility(
              visible: !isLast,
              child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.white),
                child: SizedBox(width: 2, height: 60),
              ),
            ),
            SizedBox(height: 5),
          ],
        ),
        SizedBox(width: 15),
        // Text
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5),
            Text(
              event.title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 10),
            Text(
              event.caption,
              style: TextStyle(
                color: Colors.white60,
                fontWeight: FontWeight.w100,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
