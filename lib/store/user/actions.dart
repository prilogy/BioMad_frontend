import 'package:api/api.dart';

class SetUser {
  final User user;

  SetUser(this.user);

  @override
  String toString() {
    return 'User -> SetUser{user: $user}';
  }
}