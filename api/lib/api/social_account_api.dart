part of api.api;

class SocialAccountApi extends ApiBase<AuthApi> {
  SocialAccountApi(Dio dio, {String version = "v1"}) : super(dio, version);

  Future<List<SocialAccountProvider>> socialProviders() async {
    try {
      var url = '${v}/socialAccount/provider';
      var response = await dio.get(url);
      var accounts = List<SocialAccountProvider>();
      response.data.forEach((v) {
        accounts.add(SocialAccountProvider.fromJson(v));
      });
      return accounts;
    } on DioError catch (e) {
      return null;
    }
  }

  Future<bool> add(String token, String type) async {
    try {
      var url = '$v/socialAccount/$type';
      var response = await dio.post(url, data: {"token": token});

      return true;
    } on DioError catch (e) {
      return false;
    }
  }

  Future<bool> remove(String type) async {
    try {
      var url = '$v/socialAccount/$type';
      var response = await dio.delete(url);

      return true;
    } on DioError catch (e) {
      return false;
    }
  }
}
