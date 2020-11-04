part of api.api;

class HelperApi extends ApiBase<HelperApi> {
  HelperApi(Dio dio, {String version = "v1"}) : super(dio, version);

  Future<List<Gender>> genders() async {
    try {
      var url = '${v}/helper/gender';
      var response = await dio.post(url);
      var genders = List<Gender>();
      response.data.forEach((v) {
        genders.add(Gender.fromJson(v));
      });
      return genders;
    } on DioError catch (e) {
      return null;
    }
  }
}
