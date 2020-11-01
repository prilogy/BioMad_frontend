part of api.api;

class Auth extends ApiBase<Auth> {
  Auth(Dio dio, {String version = "v1"}) : super(dio, version);

  /// Logs in with email and password
  Future<AuthenticationResult> logIn(LogInWithCredentialsModel model) async {
    try {
      var url = '${v}/auth/logIn';
      var response = await dio.post(url, data: model);
      return AuthenticationResult.fromJson(response.data);
    } on DioError catch (e) {
      return null;
    }
  }

  /// Logs in with social identity token
  Future<AuthenticationResult> logInWithSocial(
      {String token, String type}) async {
    try {
      var url = '${v}/auth/logIn/${type}';
      var response = await dio.post(url, data: {'token': token});

      return AuthenticationResult.fromJson(response.data);
    } on DioError catch (e) {
      print(e);
      return null;
    }
  }

  /// Refreshes token, also logs in
  Future<AuthenticationResult> refreshToken(
      RefreshTokenAuthenticationModel model) async {
    try {
      var url = '${v}/auth/refreshToken';
      var response = await dio.post(url, data: model);

      return AuthenticationResult.fromJson(response.data);
    } on DioError catch (e) {
      print(e);
      return null;
    }
  }

  /// Signs up
  Future<AuthenticationResult> signUp(SignUpModel model) async {
    try {
      var url = '${v}/auth/signUp';
      var response = await dio.post(url, data: model);

      return AuthenticationResult.fromJson(response.data);
    } on DioError catch (e) {
      print(e);
      return null;
    }
  }

  /// Gets identity info
  Future<SocialAuthenticationIdentity> signUpWithSocialInfo(
      {String token, String type}) async {
    try {
      var url = '${v}/auth/signUp/${type}/identity';
      var response = await dio.post(url, data: {'token': token});

      return SocialAuthenticationIdentity.fromJson(response.data);
    } on DioError catch (e) {
      print(e);
      return null;
    }
  }

  /// Signs up with social identity
  Future<AuthenticationResult> signUpWithSocial(
      SignUpWithSocialAccountModel model, String type) async {
    try {
      var url = '${v}/auth/signUp/${type}';
      var response = await dio.post(url, data: model);

      return AuthenticationResult.fromJson(response.data);
    } on DioError catch (e) {
      print(e);
      return null;
    }
  }
}
