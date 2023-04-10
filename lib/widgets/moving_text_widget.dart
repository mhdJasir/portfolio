import 'package:flutter/material.dart';

class MovingTextWidget extends StatefulWidget {
  const MovingTextWidget({
    Key? key,
    required this.builder,
    this.offset,
    this.duration,
  }) : super(key: key);
  final Offset? offset;
  final Duration? duration;
  final Widget Function(AnimationController) builder;

  @override
  State<MovingTextWidget> createState() => _MovingTextWidgetState();
}

class _MovingTextWidgetState extends State<MovingTextWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: widget.duration ?? const Duration(milliseconds: 300),
    );
    animation = Tween<Offset>(
      begin: Offset.zero,
      end: widget.offset ??
          const Offset(
            0,
            -4,
          ),
    ).animate(controller);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, _) {
        return Transform.translate(
          offset: animation.value,
          child: widget.builder(controller),
        );
      },
    );
  }
}
