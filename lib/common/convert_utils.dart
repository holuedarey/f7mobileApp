import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:math' as math;

class DecimalPrecisionFormatter extends TextInputFormatter {
  DecimalPrecisionFormatter({required this.decimalRange}) : assert(decimalRange > 0);

  final int decimalRange;

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, // unused.
      TextEditingValue newValue,
      ) {
    TextSelection newSelection = newValue.selection;
    String truncated = newValue.text;

    if (decimalRange > 0) {
      String value = newValue.text;

      if (value.contains(".") && value.substring(value.indexOf(".") + 1).length > decimalRange) {
        truncated = oldValue.text;
        newSelection = oldValue.selection;
      } else if (value == ".") {
        truncated = "0.";

        newSelection = newValue.selection.copyWith(
          baseOffset: math.min(truncated.length, truncated.length + 1),
          extentOffset: math.min(truncated.length, truncated.length + 1),
        );
      }

      return TextEditingValue(
        text: truncated,
        selection: newSelection,
        composing: TextRange.empty,
      );
    }
    return newValue;
  }
}

class ConvertUtils {
  static const String symbolNaira = '\u20A6';
  static String currencyFormatter(double amount) {
    final formatter = NumberFormat("###,##0.00", "en-ng");
    String formattedAmount = formatter.format(amount);
    return formattedAmount;
  }

  static String numberFormatter(int amount) {
    final formatter = NumberFormat("###,##0", "en-ng");
    String formattedAmount = formatter.format(amount);
    return formattedAmount;
  }

  // static String normaliseISO8601Date(String date) {
  //   return date.replaceFirstMapped(RegExp("(\\.\\d{6})\\d+"), (m) => m[1]);
  // }

  static double convertCurrencyStringToDouble(String amount) {
    String parsedAmount = (amount).replaceAll(RegExp(r'(,)'), '');
    return double.parse(parsedAmount);
  }

  static double convertToDouble(String value) {
    if (value.isEmpty) {
      return 0;
    } else {
      return ConvertUtils.convertCurrencyStringToDouble(value);
    }
  }

  static String currencyConverter(num amount,
      {String symbol = symbolNaira}) {
    final currencyFormatter = NumberFormat.currency(symbol: symbol);
    return currencyFormatter.format(amount);
  }

  static String dateConverted(DateTime date, {String format = ""}) {
    // if (date == null) {
    //   return '';
    // }
    if (format.isEmpty) {
      return DateFormat('EEEE, dd MMMM yyyy, hh:mm a').format(date);
    }
    return DateFormat(format).format(date);
  }

  static Map<String, dynamic> parseJwt(String token) {
    final parts = token.split('.');
    if (parts.length != 3) {
      throw Exception('invalid token');
    }

    final payload = _decodeBase64(parts[1]);
    final payloadMap = json.decode(payload);
    if (payloadMap is! Map<String, dynamic>) {
      throw Exception('invalid payload');
    }

    return payloadMap;
  }

  static String _decodeBase64(String str) {
    String output = str.replaceAll('-', '+').replaceAll('_', '/');

    switch (output.length % 4) {
      case 0:
        break;
      case 2:
        output += '==';
        break;
      case 3:
        output += '=';
        break;
      default:
        throw Exception('Illegal base64url string!"');
    }

    return utf8.decode(base64Url.decode(output));
  }

  static DateTime? getDataTimeFromString(String formattedString) {
    // if (formattedString == null) {
    //   return null;
    // }
    if (formattedString.isEmpty) {
      return null;
    }
    return DateTime.parse(formattedString);
  }

  static Duration getTimeFromNow(DateTime date) {
    Duration difference = DateTime.now().difference(date);
    return difference;
  }

  static Duration getTimeFromThisTime(DateTime time, DateTime date) {
    Duration difference = date.difference(time);
    return difference;
  }

  static String maskCardNumber(String number) {
    return number
        .substring(
      number.length - 4,
    )
        .padLeft(7, '*');
  }

  static Future<String?> saveImageToTempStorage(String assetPath,
      {String fileName = 'temp_logo'}) async {
    Uint8List? list = await convertImageAssetToImageByte(assetPath);

    String s = String.fromCharCodes(list!);
    var output = Uint8List.fromList(s.codeUnits);

    String dir = (await getTemporaryDirectory()).path;

    String fileDir = '$dir/$fileName.png';

    await File(fileDir).writeAsBytes(output.buffer
        .asUint8List(output.offsetInBytes, output.lengthInBytes));

    return fileDir;
  }

  static Future<Uint8List?> convertImageAssetToImageByte(
      String assetPath) async {
    try {
      final byte = await rootBundle.load(assetPath);

      final Uint8List byteData =
      byte.buffer.asUint8List(byte.offsetInBytes, byte.lengthInBytes);
      return byteData;
    } catch (e) {
      return null;
    }
  }
}



//
// class CurrencyInputFormatter extends TextInputFormatter {
//   @override
//   TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
//     if (newValue.selection.baseOffset == 0) {
//       return newValue;
//     }
//     var newText = newValue.text;
//     if (!newText.contains('£')) {
//       newText = '£$newText';
//     }
//     return newValue.copyWith(
//       text: newText,
//       selection: TextSelection.collapsed(offset: newText.length),
//     );
//   }
// }
//
// class MyFilter extends TextInputFormatter {
//   static final _reg = RegExp(r'^\d+$');
//
//   @override
//   TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
//     return _reg.hasMatch(newValue.text) ? newValue : oldValue;
//   }
// }


class CurrencyInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    double value = double.parse(newValue.text);

    final formatter = NumberFormat("###,##0.00", "en-ng");

    String newText = formatter.format(value / 100);
    return newValue.copyWith(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length));
  }
}
