part of api.api;

class HelperApi extends ApiBase<HelperApi> {
  HelperApi(Dio dio, {String version = "v1"}) : super(dio, version);

  Future<List<Gender>> genders() async {
    try {
      var url = '${v}/helper/gender';
      var response = await dio.post(url);
      return Gender.listFromJson(response.data);
    } on DioError catch (e) {
      return null;
    }
  }

  Future<List<Culture>> cultures() async {
    try {
      var url = '${v}/helper/culture';
      var response = await dio.post(url);
      return Culture.listFromJson(response.data);
    } on DioError catch (e) {
      return null;
    }
  }
}
