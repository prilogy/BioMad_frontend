import 'package:api/api.dart';
import 'package:biomad_frontend/models/settings.dart';

class SetSettings {
  final Settings settings;

  SetSettings(this.settings);

  @override
  String toString() {
      return 'Settings -> SetSettings{settings: $settings}';
  }
}
