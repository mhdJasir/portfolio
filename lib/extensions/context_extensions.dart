import 'package:flutter/material.dart';

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
