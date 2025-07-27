
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

/// global navigator key....
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class CardNumberInputFormatter extends TextInputFormatter {
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

    // Limit to 4 digits max (MMYY)
    if (digitsOnly.length > 4) digitsOnly = digitsOnly.substring(0, 4);

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

