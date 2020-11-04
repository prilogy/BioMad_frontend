import 'package:easy_localization/easy_localization.dart';

class TextFieldValidators {
  static String isNotEmpty(String v) {
    if (v.isEmpty) {
      return tr('input_hint.not_empty');
    }

    return null;
  }

  static String isEmail(String v) {
    var ie = isNotEmpty(v);
    if (ie != null) return ie;

    if (!RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$').hasMatch(v))
      return tr('input_hint.email_invalid');

    return null;
  }
}
