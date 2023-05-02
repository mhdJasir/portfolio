import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/extensions/context_extensions.dart';

class TextAnimation extends StatefulWidget {
  const TextAnimation({super.key, required this.word,required this.style});

  final String word;
  final TextStyle style;

  @override
  State<TextAnimation> createState() => _TextAnimationState();
}

class _TextAnimationState extends State<TextAnimation>
    with TickerProviderStateMixin {
  late AnimationController textController;

  @override
  void initState() {
    textController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int i = 1; i <= widget.word.length; i++)
          _textWidget(widget.word[i - 1], i),
      ],
    );
  }

  Widget _textWidget(String value, int i) {
    double startTime = 0.4;
    double singleChildAnimationDuration = 0.5;
    double begin = startTime * (i / widget.word.length);
    double end = singleChildAnimationDuration + begin;
    Animation<Offset> animation = Tween<Offset>(
      begin: Offset(kIsWeb ? context.width : 400, 0),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: textController,
        curve: Interval(
          begin,
          end,
          curve: Curves.easeIn,
        ),
      ),
    );
    Animation<double> anim = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: textController,
        curve: Interval(
          begin,
          end,
          curve: Curves.easeIn,
        ),
      ),
    );
    return AnimatedBuilder(
      animation: animation,
      builder: (c, widget) {
        return Transform.translate(
          offset: animation.value,
          child: Opacity(
            opacity: anim.value,
            child: widget,
          ),
        );
      },
      child: Text(
        value,
        style: widget.style,
      ),
    );
  }
}
