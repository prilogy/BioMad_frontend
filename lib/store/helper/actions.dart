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

class SetGenders {
  final List<Gender> genders;

  SetGenders(this.genders);

  @override
  String toString() {
    return 'Genders -> SetGenders{settings: $genders}';
  }
}

// TODO: implement SetCultures
