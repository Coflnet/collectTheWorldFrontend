extension StringExtension on String {
    String capitalize() {
      return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
    }
}

extension OrdinalExtension on int {
  String get ordinal {
    if (this % 100 >= 11 && this % 100 <= 13) {
      return "${this}th";
    }

    switch (this % 10) {
      case 1:
        return "${this}st";
      case 2:
        return "${this}nd";
      case 3:
        return "${this}rd";
      default:
        return "${this}th";
    }
  }
}
