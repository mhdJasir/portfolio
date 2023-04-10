import 'package:flutter/material.dart';
import 'package:portfolio/helpers/app_colors.dart';
import 'package:portfolio/helpers/constants.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    super.key,
    required this.currentIndex,
    required this.length,
  });

  final int currentIndex;
  final int length;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ListView.separated(
        padding: const EdgeInsets.only(left: 15),
        itemCount: length,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (c, i) => sbw(5),
        itemBuilder: (c, i) {
          bool primeIndex = currentIndex == i;
          int radius = primeIndex ? 12 : (i > currentIndex ? 11 - i : 5 + i);
          Color color = primeIndex ? AppColors.neonColor : Colors.grey.shade300;
          return AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            height: radius.toDouble(),
            width: radius.toDouble(),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
            ),
          );
        },
      ),
    );
  }
}
