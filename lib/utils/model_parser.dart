class ModelParser {
  static int? intFromJson(final dynamic json) {
    if (json is int) {
      return json;
    } else if (json is String) {
      return int.tryParse(json);
    } else {
      return null;
    }
  }

  static double? doubleFromJson(final dynamic json) {
    if (json is double) {
      return json;
    } else if (json is String) {
      return double.tryParse(json);
    } else if (json is int) {
      return json.toDouble();
    } else {
      return null;
    }
  }

  static bool? boolFromJson(final dynamic json) {
    if (json is bool) {
      return json;
    } else if (json is String) {
      return bool.tryParse(json);
    } else {
      return null;
    }
  }

  static DateTime? parseFlexibleDate(String dateStr) {
    try {
      final parts = dateStr.split("-");
      if (parts.length != 3) return null;

      final year = int.tryParse(parts[0]);
      final month = int.tryParse(parts[1].padLeft(2, '0'));
      final day = int.tryParse(parts[2].padLeft(2, '0'));

      if (year == null || month == null || day == null) return null;

      return DateTime(year, month, day);
    } catch (_) {
      return null;
    }
  }
}
