part of api.api;


class AuthApi extends ApiBase<AuthApi> {
  AuthApi(Dio dio, {String version = "v1"}) : super(dio, version);

  /// Logs in with email and password
  Future<AuthenticationResult?> logIn(LogInWithCredentialsModel model) async {
    try {
      var url = '${v}/auth/logIn';
      String? currentLocale;
      try {
        currentLocale = await Devicelocale.currentLocale;
        currentLocale = currentLocale!.substring(0,2);
        print(currentLocale);
      } on PlatformException {
        print("Error obtaining current locale");
      }
      var response = await dio.post(url,
          data: model);
      return AuthenticationResult.fromJson(response.data);
    } on DioError catch (e) {
      return null;
    }
  }

  /// Logs in with social identity token
  Future<AuthenticationResult?> logInWithSocial(
      {String? token, String? type}) async {
    try {
      var url = '${v}/auth/logIn/${type}';
      var response = await dio.post(url, data: {'token': token});

      return AuthenticationResult.fromJson(response.data);
    } on DioError catch (e) {
      return null;
    }
  }

  /// Refreshes token, also logs in
  Future<AuthenticationResult?> refreshToken(
      RefreshTokenAuthenticationModel model) async {
    String? currentLocale;
    try {
      currentLocale = await Devicelocale.currentLocale;
      currentLocale = currentLocale!.substring(0,2);
      print(currentLocale);
    } on PlatformException {
      print("Error obtaining current locale");
    }
    try {
      var url = '${v}/auth/refreshToken';
      print(model);
      var response = await dio.post(url, data: model, options: Options(headers: {"Culture": currentLocale}));
      return AuthenticationResult.fromJson(response.data);
    } on DioError catch (e) {
      print(e);
      return null;
    }
  }

  /// Signs up
  Future<bool> signUp(SignUpModel model) async {
    try {
      var url = '${v}/auth/signUp';
      var response = await dio.post(url, data: model);

      return true;
    } on DioError catch (e) {
      return false;
    }
  }

  /// Gets identity info
  Future<SocialAuthenticationIdentity?> signUpWithSocialInfo(
      {String? token, String? type}) async {
    try {
      var url = '${v}/auth/signUp/${type}/identity';
      var response = await dio.post(url, data: {"token": token});
      return SocialAuthenticationIdentity.fromJson(response.data);
    } on DioError catch (e) {
      return null;
    }
  }

  /// Signs up with social identity
  Future<bool?> signUpWithSocial(
      SignUpWithSocialAccountModel model, String type) async {
    try {
      var url = '${v}/auth/signUp/${type}';
      await dio.post(url, data: model);
      return true;
    } on DioError catch (e) {
      if (e.response?.statusCode == 409) return false;
      return null;
    }
  }
}
