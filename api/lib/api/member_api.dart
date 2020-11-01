part of api.api;

class MemberApi extends ApiBase<AuthApi> {
  MemberApi(Dio dio, {String version = "v1"}) : super(dio, version);

  Future<bool> add(MemberModel model) async {
    try {
      var url = '${v}/member';
      await dio.post(url, data: model);
      return true;
    } on DioError catch (e) {
      return false;
    }
  }

  Future<bool> delete(int id) async {
    try {
      var url = '${v}/member/${id}';
      await dio.delete(url);
      return true;
    } on DioError catch (e) {
      return false;
    }
  }

  Future<bool> edit(MemberModel model, int id) async {
    try {
      var url = '${v}/member/${id}';
      await dio.patch(url, data: model);
      return true;
    } on DioError catch (e) {
      return false;
    }
  }
}
