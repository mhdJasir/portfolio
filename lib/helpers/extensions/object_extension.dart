import 'dart:convert';

import 'package:flutter/foundation.dart';

extension ObjectExtension on Object? {
  get log {
    if (this == null) {
      debugPrint("Got Null");
      return;
    }
    debugPrint("$this");
  }

  void logIt([val]) {
    if (this == null) {
      debugPrint("Got Null");
      return;
    }
    debugPrint("$val");
  }

  void get prettyPrint {
    if (this == null) {
      debugPrint("Got Null");
      return;
    }
    try {
      JsonEncoder encoder = const JsonEncoder.withIndent('  ');
      String prettyprint = encoder.convert(this);
      debugPrint(prettyprint);
    } catch (_) {
      debugPrint("Couldn't pretty print");
      debugPrint(toString());
    }
  }
}

extension IterableExtension<E> on Iterable<E> {
  E? get firstElseNull {
    if (isEmpty) return null;
    return elementAt(0);
  }
}

String? emptyNullCheck(String? val) {
  if (val == null || val.isEmpty) return null;
  return val;
}
