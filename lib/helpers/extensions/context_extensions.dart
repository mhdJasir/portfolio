import 'package:flutter/material.dart';
import 'package:portfolio/helpers/app_colors.dart';

extension Context on BuildContext {
  double get height {
    return MediaQuery.of(this).size.height;
  }

  double get h {
    return MediaQuery.of(this).size.height / 100;
  }

  double get width {
    return MediaQuery.of(this).size.width;
  }

  double get w {
    return MediaQuery.of(this).size.width / 100;
  }


}


extension ContextExtensions on BuildContext {
  ///THEME
  ColorScheme get cs => Theme.of(this).colorScheme;

  TextTheme get tt => Theme.of(this).textTheme;

  TextStyle? get formLabelStyle => labelMedium;

  TextStyle? get hintStyle => TextStyle(
    color: Colors.grey,
    fontSize: isPhone ? 14 : 16,
  );

  TextStyle? get fieldStyle => TextStyle(
    color: Colors.black,
    fontSize: isPhone ? 14 : 16,
  );

  TextStyle? get largeText => tt.titleLarge?.copyWith(
    fontSize: toPlatformFont(tt.titleLarge?.fontSize ?? 0),
    color: AppColors.primaryColor,
  );

  TextStyle? get titleMedium => tt.titleMedium?.copyWith(
    fontSize: toPlatformFont(tt.titleMedium?.fontSize ?? 0),
    color: AppColors.primaryColor,
  );

  TextStyle? get normalStyle => Theme.of(this).textTheme.labelMedium?.copyWith(
    color: cs.primary,
  );

  TextStyle? get labelLarge => tt.labelLarge?.copyWith(
    fontSize: (isPhone || isPortrait) ? 16 : 18,
  );

  TextStyle? get labelMedium => tt.labelMedium?.copyWith(
    fontSize: (isPhone || isPortrait) ? 14 : 16,
  );

  TextStyle? get labelSmall => tt.labelSmall?.copyWith(
    fontSize: toPlatformFont(tt.labelSmall?.fontSize ?? 0),
  );

  TextStyle? get dialogTitle => tt.titleMedium?.copyWith(
    color: cs.primary,
    fontWeight: FontWeight.w600,
  );

  TextStyle? get titleStyle => Theme.of(this).textTheme.labelLarge?.copyWith(
    color: cs.primary,
    fontWeight: FontWeight.w500,
  );

  TextStyle? get titleStyleBlack =>
      Theme.of(this).textTheme.labelLarge?.copyWith(
        fontWeight: FontWeight.w500,
      );

  TextStyle? get h1 => tt.titleLarge?.copyWith(
      fontWeight: FontWeight.w500,
      fontSize: (isPhone || isPortrait) ? 20 : (isPortrait ? 22 : 24));

  ///SIZES
  double toPlatformSize(double val) {
    if (isPhone) {
      return val * 0.75;
    }
    if (isPortrait) val * 90;
    return val;
  }

  double toPlatformFont(double val) {
    if (isPhone) {
      return val * 0.85;
    }
    if (isPortrait) val * 90;
    return val;
  }

  double get getItemFullWidth {
    return isPhone
        ? w * 90
        : isPortrait
        ? w * 50
        : w * 35;
  }

  double get getDialogWidth {
    return isPhone
        ? w * 95
        : isPortrait
        ? w * 80
        : w * 50;
  }

  double getHSpace(double val) {
    if (isPhone) {
      return w * val * 0.75;
    }
    if (isPortrait) w * val * 85;
    return w * val;
  }

  double getVSpace(double val) {
    if (isPhone) {
      return h * val * 0.75;
    }
    if (isPortrait) h * val * 85;
    return h * val;
  }

  bool get isTablet {
    final double width = MediaQuery.of(this).size.shortestSide;
    return width >= 600;
  }

  bool get isPortrait {
    return isTablet && MediaQuery.of(this).orientation == Orientation.portrait;
  }

  bool get isPhone {
    final double width = MediaQuery.of(this).size.shortestSide;
    return width < 600;
  }

  EdgeInsets get keyboardPadding =>
      EdgeInsets.only(bottom: MediaQuery.of(this).viewInsets.bottom);

  void showSnackBar(String content) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(
          content,
          style: labelMedium?.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
