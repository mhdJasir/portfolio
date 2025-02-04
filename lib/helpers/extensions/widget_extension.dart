import 'package:flutter/material.dart'
    show Widget, Row, Text, CrossAxisAlignment;

extension ContextExtensions on Text {
  Widget get addMandatoryTag {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        this,
        Text(
          "*",
          style: style,
        )
      ],
    );
  }
}

extension StringExtensions on dynamic {
  bool get isNullOrEmpty =>
      this == null || this.isEmpty || this == "" || this == "null";
}

bool nullOrEmpty(dynamic value) {
  if (value == null) return true;
  if (value is String && value.isEmpty) return true;
  return false;
}