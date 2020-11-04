import 'package:easy_localization/easy_localization.dart';

Function trWithKey(String key) {
  if(key[key.length -1] != '.')
    key = key + '.';
  return (String subKey) => tr(key + subKey);
}