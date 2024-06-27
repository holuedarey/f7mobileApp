import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimeHelper {
  DateTimeHelper._();

  static final DateFormat standardDateFormat = DateFormat('dd-MM-yyyy');
  static final DateFormat standardDateFormatYearFirst = DateFormat('yyyy-MM-dd');
  static final DateFormat standardDateTimeFormat =
      DateFormat('dd/MM/yyyy hh:mm a');
  static final DateFormat timeOfDayFormat = DateFormat('HH:mm:ss');
  static final DateFormat timeSlotFormat = DateFormat('Hms', 'en_US');
  static final DateFormat time12hFormat = DateFormat('hh:mm a', 'en_US');
  static final DateFormat time24hformat = DateFormat('H:mm');
  static final DateFormat dateMonthFormat = DateFormat.yMMMMd();

  static String get barCode =>
      DateFormat('yyMMddHHmmss').format(DateTime.now());

  static String get uniqueRef =>
      DateTime.now().millisecondsSinceEpoch.toString();
}

extension TimeOfDayExt on TimeOfDay {
  String get in12hformat =>
      DateTimeHelper.time12hFormat.format(DateTime(1969, 1, 1, hour, minute));

  String get in24hformat =>
      DateTimeHelper.time24hformat.format(DateTime(1969, 1, 1, hour, minute));
}

extension DateTimeExt on int {
  String get dateTime => DateTimeHelper.standardDateTimeFormat
      .format(DateTime.fromMicrosecondsSinceEpoch(this * 1000));

  String get timeInDay => DateTimeHelper.time12hFormat
      .format(DateTime.fromMicrosecondsSinceEpoch(this * 1000));

  String get dateFormat => DateTimeHelper.standardDateFormat
      .format(DateTime.fromMicrosecondsSinceEpoch(this * 1000));

  String get dateMonthFormat => DateTimeHelper.dateMonthFormat
      .format(DateTime.fromMicrosecondsSinceEpoch(this * 1000));
}

extension DateTimeFormat on DateTime? {
  String? get standardDate {
    if (this == null) return null;
    return DateTimeHelper.standardDateFormat.format(this!);
  }

  String? get ymd {
    if (this == null) return null;
    return DateFormat("y-MM-dd").format(this!);
  }

  String? get standardYearFirstDate {
    if (this == null) return null;
    return DateTimeHelper.standardDateFormatYearFirst.format(this!);
  }


  String? get dateMonth {
    if (this == null) return null;
    return DateTimeHelper.dateMonthFormat.format(this!);
  }
}

