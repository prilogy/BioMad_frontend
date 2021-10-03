part of api.api;

class LabApi extends ApiBase<LabApi> {
  LabApi(Dio dio, {String version = "v1"}) : super(dio, version);

  Future<List<Lab>?> info() async {
    try {
      var url = '${v}/lab';
      var response = await dio.get(url);
      return Lab.listFromJson(response.data);
    } on DioError catch (e) {
      return null;
    }
  }

  Future<Lab?> infoById(int id) async {
    try {
      var url = '${v}/lab/${id}';
      var response = await dio.get(url);
      return Lab.fromJson(response.data);
    } on DioError catch (e) {
      return null;
    }
  }
}
