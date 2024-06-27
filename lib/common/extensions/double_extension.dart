import 'package:intl/intl.dart';

/// Extension for double
extension DoubleExtension on double {
  /// Transform double to string with [decimals] numbers of decimal digits
  ///
  /// If the double is round at the whole number not show the decimals zeros
  /// Example:
  ///   23.456.formatWithoutDecimalZero(2) -> "23.45"
  ///   23.456.formatWithoutDecimalZero(1) -> "23.4"
  ///   23.0.formatWithoutDecimalZero(1) -> "23"
  String formatWithoutDecimalZero(int decimals) =>
      toStringAsFixed(truncateToDouble() == this ? 0 : decimals);

  /// Transform double to String currency with [decimalDigits] decimals
  String toCurrency([int decimalDigits = 2]) {
    return NumberFormat.currency(decimalDigits: decimalDigits, symbol: '£').format(this);
  }

  /// Transforms double to String currency in the shortest possible form
  /// Example:
  ///   10.00.toTruncatedCurrency() -> "£10"
  ///   10.10.toTruncatedCurrency() -> "£10.10"
  ///   10.01.toTruncatedCurrency() -> "£10.01"
  String toTruncatedCurrency() {
    final decimalDigits = this % 1 == 0 ? 0 : 2;
    return toCurrency(decimalDigits);
  }

  

}
