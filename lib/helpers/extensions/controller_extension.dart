import 'package:flutter/cupertino.dart'
    show TextEditingController, TextSelection;

extension ControllerExtension on TextEditingController? {
  void selectAll() {
    if (this == null) return;
    this!.selection = TextSelection(
      baseOffset: 0,
      extentOffset: this!.text.length,
    );
  }
}
