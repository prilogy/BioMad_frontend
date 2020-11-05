part of api.api;

class UserApi extends ApiBase<HelperApi> {
  UserApi(Dio dio, {String version = "v1"}) : super(dio, version);

  Future<User> info() async {
    try {
      var url = '${v}/user';
      var response = await dio.get(url);
      return User.fromJson(response.data);
    } on DioError catch (e) {
      return null;
    }
  }

  /// WARNING: REQUIRED TRY CATCH
  /// Throws exception if connection timed out
  Future<User> infoWithExceptionOnTimeOut() async {
    try {
      var url = '${v}/user';
      var response = await dio.get(url);

      return User.fromJson(response.data);
    } on DioError catch (e) {
      if(e.type == DioErrorType.CONNECT_TIMEOUT)
        throw Exception();
      return null;
    }
  }

  Future<bool> edit(UserEditModel model) async {
    try {
      var url = '${v}/user';
      var response = await dio.patch(url, data: model);

      return true;
    } on DioError catch (e) {
      return false;
    }
  }
}
