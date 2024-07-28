import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:f7apparel_mobile/common/commons.dart';
import 'package:f7apparel_mobile/common/patterns.dart';
import 'package:flutter/services.dart' as service;
import 'package:html/dom.dart';
import 'package:html/dom_parsing.dart';
import 'package:html/parser.dart';

/// Extension methods on nullable String
///
RegExp alphaRegExp = RegExp(r'^[a-zA-Z]+$');
extension StringExtension on String? {

  // Image Asset Path
  String get png => "assets/images/$this.png";
  String get png2 => "assets/images/png/$this.png";

  // Icon Asset Path
  String get svg => "assets/icons/$this.svg";

  /// Image regex
  bool get isImage => hasMatch(this, Patterns.image);

  /// Audio regex
  bool get isAudio => hasMatch(this, Patterns.audio);

  /// Video regex
  bool get isVideo => hasMatch(this, Patterns.video);

  /// Txt regex
  bool get isTxt => hasMatch(this, Patterns.txt);

  /// Document regex
  bool get isDoc => hasMatch(this, Patterns.doc);

  /// Excel regex
  bool get isExcel => hasMatch(this, Patterns.excel);

  /// PPT regex
  bool get isPPT => hasMatch(this, Patterns.ppt);

  /// Document regex
  bool get isApk => hasMatch(this, Patterns.apk);

  /// PDF regex
  bool get isPdf => hasMatch(this, Patterns.pdf);

  /// HTML regex
  bool get isHtml => hasMatch(this, Patterns.html);


  /// Whether the string is null or empty
  bool get isNullOrEmpty => this?.isEmpty ?? true;

  /// Whether the string is not null and not empty
  bool get isNotNullAndNotEmpty {
    return this != null && this?.isNotEmpty == true;
  }

  String? get shorten {
    if(this == null) return null;
    final values = this!.split("");
    if(values.length < 3) return this;
    return values.sublist(0, 3).join();
  }

  /// Checks if a String is a valid URL
  bool get isValidUrl {
    if (isNullOrEmpty) {
      return false;
    } else {
      final urlPatternRegex = RegExp(r'^(.*?)((?:https?:\/\/|www\.)[^\s/$.?#].[^\s]*)');
      return urlPatternRegex.hasMatch(this!.toLowerCase());
    }
  }

  /// Removes trailing zeroes after decimal
  String? removeTrailingZeroes() {
    if (!isNullOrEmpty && (this!.contains('.') || this!.contains(','))) {
      return this!.replaceAll(RegExp(r"([.,]*0+)(?!.*\d)"), '');
    } else {
      return this;
    }
  }

  /// Whether the string is representation of negative number or not
  bool get isNegative => isNullOrEmpty ? false : this!.startsWith('-');

  String? sanitisePhoneNo() {
    if (!isNullOrEmpty && (!this!.startsWith('0'))) {
      return "0${this!}";
    } else {
      return this;
    }
  }

  bool? containsIgnoreCase(String otherString) {
    return this!.toLowerCase().contains(otherString.toLowerCase());
  }

  bool? equalsIgnoreCase(String otherString) {
    return this!.toLowerCase() == otherString.toLowerCase();
  }


  /// Removes minus sign from string
  String? toPositive() => isNullOrEmpty ? this : this!.replaceFirst('-', '');

  /// Whether the string is representation of zero
  bool get isZero => isNullOrEmpty ? false : double.tryParse(this!) == 0.0;

  /// Return a string with the first letter uppercase. E.g. mario => Mario
  String? get capitalize {
    if (this != null) {
      final s = this![0];
      final sCap = s.toUpperCase();
      final sFinal = sCap + this!.substring(1);

      return sFinal;
    } else {
      return null;
    }
  }

  /// Return SHA256 value of string.
  // String getHashed() {
  //   var result = '';
  //   final currentString = this;
  //   if (currentString != null && currentString.isNotEmpty) {
  //     result = sha256.convert(utf8.encode(currentString)).toString();
  //   }
  //
  //   return result;
  // }
  /// Check email validation
  bool validateEmail() => hasMatch(this, Patterns.email);

  /// Check phone validation
  bool validatePhone() => hasMatch(this, Patterns.phone);

  /// Check URL validation
  bool validateURL() => hasMatch(this, Patterns.url);

  /// Returns true if given String is null or isEmpty
  bool get isEmptyOrNull =>
      this == null ||
          (this != null && this!.isEmpty) ||
          (this != null && this! == 'null');

  // Check null string, return given value if null
  String validate({String value = ''}) {
    if (isEmptyOrNull) {
      return value;
    } else {
      return this!;
    }
  }

  /// Capitalize given String
  String capitalizeFirstLetter() => (validate().length >= 1)
      ? (this!.substring(0, 1).toUpperCase() + this!.substring(1).toLowerCase())
      : validate();



  /// Return true if given String is Digit
  bool isDigit() {
    if (validate().isEmpty) {
      return false;
    }
    if (validate().length > 1) {
      for (var r in this!.runes) {
        if (r ^ 0x30 > 9) {
          return false;
        }
      }
      return true;
    } else {
      return this!.runes.first ^ 0x30 <= 9;
    }
  }

  bool get isInt => this!.isDigit();

  /// Check weather String is alpha or not
  bool isAlpha() => alphaRegExp.hasMatch(validate());

  bool isJson() {
    try {
      json.decode(validate());
    } catch (e) {
      return false;
    }
    return true;
  }

  // Copy String to Clipboard
  Future<void> copyToClipboard() async {
    await service.Clipboard.setData(
        service.ClipboardData(text: validate()));
  }

  /// for ex. add comma in price
  String formatNumberWithComma({String seperator = ','}) {
    return validate().replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
            (Match m) => '${m[1]}$seperator');
  }
  /// for ex. add comma in price
  String escapeHtmlString() {
    var document = parse(this!);
    return document.body!.text.replaceAll("\n", "").replaceAll("\t", ", ");
  }

  /// Get Color from HEX String
  Color toColor({Color? defaultColor}) {
    return getColorFromHex(this!, defaultColor: defaultColor);
  }
  /// Returns Color from hex String.
  ///
  /// ```dart
  /// Color color = getColorFromHex('#E5E5E5');
  ///
  /// returns default color if not able to parse given hex
  /// ```
 static Color getColorFromHex(String hexColor, {Color? defaultColor}) {
    if (hexColor.validate().isEmpty) {
      if (defaultColor != null) {
        return defaultColor;
      } else {
        throw ArgumentError('Can not parse provided hex $hexColor');
      }
    }

    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return Color(int.parse(hexColor, radix: 16));
  }

  /// It reverses the String
  String get reverse {
    if (validate().isEmpty) {
      return '';
    }
    return toList().reversed.reduce((value, element) => value += element);
  }

  /// It return list of single character from String
  List<String> toList() {
    return validate().trim().split('');
  }

  /// Splits from a [pattern] and returns remaining String after that
  String splitAfter(Pattern pattern) {
    ArgumentError.checkNotNull(pattern, 'pattern');
    var matchIterator = pattern.allMatches(this!).iterator;

    if (matchIterator.moveNext()) {
      var match = matchIterator.current;
      var length = match.end - match.start;
      return validate().substring(match.start + length);
    }
    return '';
  }

  /// Splits from a [pattern] and returns String before that
  String splitBefore(Pattern pattern) {
    ArgumentError.checkNotNull(pattern, 'pattern');
    var matchIterator = pattern.allMatches(validate()).iterator;

    Match? match;
    while (matchIterator.moveNext()) {
      match = matchIterator.current;
    }

    if (match != null) {
      return validate().substring(0, match.start);
    }
    return '';
  }

  /// It matches the String and returns between [startPattern] and [endPattern]
  String splitBetween(Pattern startPattern, Pattern endPattern) {
    return splitAfter(startPattern).splitBefore(endPattern);
  }

  /// Return int value of given string
  int toInt({int defaultValue = 0}) {
    if (this == null) return defaultValue;

    if (isDigit()) {
      return int.parse(this!);
    } else {
      return defaultValue;
    }
  }

  /// Return double value of given string
  double toDouble({double defaultValue = 0.0}) {
    if (this == null) return defaultValue;

    try {
      return double.parse(this!);
    } catch (e) {
      return defaultValue;
    }
  }

  /// Get YouTube Video ID
  String toYouTubeId({bool trimWhitespaces = true}) {
    String url = validate();
    if (!url.contains('http') && (url.length == 11)) return url;
    if (trimWhitespaces) url = url.trim();

    for (var exp in [
      RegExp(
          r"^https:\/\/(?:www\.|m\.)?youtube\.com\/watch\?v=([_\-a-zA-Z0-9]{11}).*$"),
      RegExp(
          r"^https:\/\/(?:www\.|m\.)?youtube(?:-nocookie)?\.com\/embed\/([_\-a-zA-Z0-9]{11}).*$"),
      RegExp(r"^https:\/\/youtu\.be\/([_\-a-zA-Z0-9]{11}).*$")
    ]) {
      Match? match = exp.firstMatch(url);
      if (match != null && match.groupCount >= 1) return match.group(1)!;
    }

    return '';
  }

  /// Get YouTube Video ID
  @Deprecated('Use toYouTubeId Instead')
  String convertYouTubeUrlToId({bool trimWhitespaces = true}) {
    return toYouTubeId(trimWhitespaces: trimWhitespaces);
  }

  /// Returns YouTube thumbnail for given video id
  String getYouTubeThumbnail({bool trimWhitespaces = true}) {
    return 'https://img.youtube.com/vi/${toYouTubeId(trimWhitespaces: trimWhitespaces)}/maxresdefault.jpg';
  }

  /// Removes white space from given String
  String removeAllWhiteSpace() =>
      validate().replaceAll(RegExp(r"\s+\b|\b\s"), "");


  /// Returns only numbers from a string trim Whitespaces
  String getNumericOnly({bool aFirstWordOnly = false}) {
    String numericOnlyString = '';

    for (var i = 0; i < validate().length; i++) {
      if ((this![i].isDigit())) {
        numericOnlyString += this![i];
      }
      if (aFirstWordOnly && numericOnlyString.isNotEmpty && this![i] == " ") {
        break;
      }
    }

    return numericOnlyString;
  }

  /// Returns the given string n times
  String repeat(int n, {String separator = ''}) {
    if (n < 0) ArgumentError('n must be a positive value greater then 0');

    var repeatedString = '';

    for (var i = 0; i < n; i++) {
      if (i > 0) {
        repeatedString += separator;
      }
      repeatedString += validate();
    }

    return repeatedString;
  }

  /// Render a HTML String
  String get renderHtml {
    return this!
        .replaceAll('&ensp;', ' ')
        .replaceAll('&nbsp;', ' ')
        .replaceAll('&emsp;', ' ')
        .replaceAll('<br>', '\n')
        .replaceAll('<br/>', '\n')
        .replaceAll('&lt;', '<')
        .replaceAll('&gt;', '>');
  }
  /// Render a HTML String
  String get renderHtml2 {
    return this!
        .replaceAll('<ul>\r\n \t', '')
        .replaceAll('\r\n</ul>', '')
        .replaceAll('<li class=\"css-1tnot27 e1ltgthi1\">\r\n<div class=\"css-t74662 e1ltgthi2\">', '')
        .replaceAll('</div>', '')
        .replaceAll('</li>\r\n \t', '')
        .replaceAll('</li>', '');
  }

  /// Return average read time duration of given String in seconds
  double calculateReadTime({int wordsPerMinute = 200}) {
    var words = countWords();
    var number = words / wordsPerMinute;
    return number;
  }

  /// Return number of words ina given String
  int countWords() {
    var words = validate().trim().split(RegExp(r'(\s+)'));
    return words.length;
  }

  /// Generate slug of a given String
  String toSlug({String delimiter = '_'}) {
    String text = validate().trim().toLowerCase();
    return text.replaceAll(' ', delimiter);
  }

  /// returns searchable array for Firebase Database
  List<String> setSearchParam() {
    String word = validate();

    List<String> caseSearchList = [];
    String temp = '';

    for (int i = 0; i < word.length; i++) {
      temp = temp + word[i];
      caseSearchList.add(temp.toLowerCase());
    }

    return caseSearchList;
  }
}
