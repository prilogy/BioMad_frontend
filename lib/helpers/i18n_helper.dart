import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

typedef TrFunc = String Function(String subKey,
    {BuildContext context,
    List<String> args,
    Map<String, String> namedArgs,
    String gender});

TrFunc trWithKey(String key) {
  if (key[key.length - 1] != '.') key = key + '.';
  return (String subKey,
          {BuildContext context,
          List<String> args,
          Map<String, String> namedArgs,
          String gender}) =>
      tr(key + subKey,
          context: context, args: args, namedArgs: namedArgs, gender: gender);
}
