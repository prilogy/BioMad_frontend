import 'package:api/api.dart';

class SetGender {
  final Gender gender;

  SetGender(this.gender);

  @override
  String toString() {
    return 'Gender -> SetGender{gender: $gender}';
  }
}