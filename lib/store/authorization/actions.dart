import 'package:biomad_frontend/models/authorization.dart';

class SetAuthorization {
  final Authorization? authorization;

  SetAuthorization(this.authorization);

  @override
  String toString() {
    return 'Authorization -> SetAuthorization{authorization: $authorization}';
  }
}

class SetAuthorizationMemberId {
  final int id;

  SetAuthorizationMemberId(this.id);

  @override
  String toString() {
    return 'Authorization -> SetAuthorizationMemberId{id: $id}';
  }
}


