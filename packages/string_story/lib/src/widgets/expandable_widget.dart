import 'package:flutter/widgets.dart';

/// https://stackoverflow.com/questions/49029841/how-to-animate-collapse-elements-in-flutter
class ExpandableWidget extends StatefulWidget {
  /// default constructor
  const ExpandableWidget({
    this.expand = false,
    required this.child,
    super.key,
  });

  /// child to be expaned or not
  final Widget child;

  /// expanded state
  final bool expand;

  @override
  ExpandedSectionState createState() => ExpandedSectionState();
}

class ExpandedSectionState extends State<ExpandableWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController expandController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    expandController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
    expandController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {}); // trigger rebuild without clipping
      }
    });
    animation = CurvedAnimation(
      parent: expandController,
      curve: Curves.fastOutSlowIn,
    );
    expandController.value = widget.expand ? 1.0 : 0.0;
  }

  void _runExpandCheck() {
    if (widget.expand) {
      expandController.forward();
    } else {
      expandController.reverse();
    }
  }

  @override
  void didUpdateWidget(ExpandableWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    _runExpandCheck();
  }

  @override
  void dispose() {
    expandController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (animation.value == 1.0 && animation.isCompleted) {
      // avoid clipping when item is fully expanded (e.g. item might be casting a shadow)
      return widget.child;
    }
    // this transition clips widget using ClipRect as it expands
    return SizeTransition(
      axisAlignment: 1.0,
      sizeFactor: animation,
      child: widget.child,
    );
  }
}
