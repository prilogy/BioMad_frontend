import 'package:biomad_frontend/models/settings.dart';
import 'package:flutter/cupertino.dart';

class SetSettings {
  final Settings settings;

  SetSettings(this.settings);

  @override
  String toString() {
      return 'Settings -> SetSettings{settings: $settings}';
  }
}