
extension CapitalizeFirstLetter on String {
  String capitalizeFirstLetter() {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1);
  }
}

extension StringExtension on String? {
  // DateTime? get toDateTime {
  //   if (this == null) return null;
  //   final formatter = DateFormat('dd-MM-yyyy hh:mm:ss');
  //   return formatter.tryParse(this!);
  // }

  String get makeShort {
    if (this == null || this!.isEmpty) return "";
    final list = this!.split(" ");
    if (list.length == 1) {
      return this![0].toUpperCase();
    }
    String data = "";
    int i = 0;
    for (var element in list) {
      if (element.trim() == "&" || element.isEmpty) continue;
      data += element[0];
      i++;
      if (i == 2) break;
    }
    return data.toUpperCase();
  }

  String get firstLetter {
    if (this == null || this!.isEmpty) return "";
    return this![0].toUpperCase();
  }

  // DateTime? get toDateOnly {
  //   if (this == null) return null;
  //   final formatter = DateFormat('dd-MM-yyyy');
  //   return formatter.tryParse(this!);
  // }
}

extension DateTimeExtensions on DateTime? {
  // String get toApiDate {
  //   if (this == null) return "";
  //   final DateFormat formatter = DateFormat('dd-MM-yyyy');
  //   return formatter.format(this!);
  // }
}
