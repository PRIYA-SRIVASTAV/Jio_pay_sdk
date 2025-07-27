
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

/// global navigator key....
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class CardNumberInputFormatter extends TextInputFormatter{
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    final digitsOnly = newValue.text.replaceAll(RegExp(r'\D'), '');
    final spaced = digitsOnly.replaceAllMapped(
      RegExp(r".{1,4}"),
          (match) => "${match.group(0)} ",
    ).trimRight();

    return TextEditingValue(
      text: spaced,
      selection: TextSelection.collapsed(offset: spaced.length),
    );
  }
}
class ExpiryDateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    String digitsOnly = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');

    // Limit to 7 digits max (MMYYYY)
    if (digitsOnly.length > 7) digitsOnly = digitsOnly.substring(0, 7);

    String formatted = '';
    if (digitsOnly.length >= 3) {
      formatted = '${digitsOnly.substring(0, 2)}/${digitsOnly.substring(2)}';
    } else if (digitsOnly.length >= 1) {
      formatted = digitsOnly;
    }

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}
class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double blockWidth;
  static late double blockHeight;

  static late double textScaleFactor;

  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockWidth = screenWidth / 100;
    blockHeight = screenHeight / 100;
    textScaleFactor = _mediaQueryData.textScaleFactor;
  }

  /// Get width as a % of screen width
  static double w(double percent) => blockWidth * percent;

  /// Get height as a % of screen height
  static double h(double percent) => blockHeight * percent;

  /// Get font size responsive to screen
  static double sp(double fontSize) => fontSize * textScaleFactor;

  /// Get size for text fields
  static double textFieldHeight([double scale = 6.5]) => h(scale);
}

