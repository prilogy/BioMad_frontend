part of api.api;

class UnitApi extends ApiBase<UnitApi> {
  UnitApi(Dio dio, {String version = "v1"}) : super(dio, version);

  Future<List<Unit>?> info() async {
    try {
      var url = '${v}/unit';
      var response = await dio.get(url);
      return Unit.listFromJson(response.data);
    } on DioError catch (e) {
      return null;
    }
  }

  Future<Unit?> infoById(int id) async {
    try {
      var url = '${v}/unit/${id}';
      var response = await dio.get(url);
      return Unit.fromJson(response.data);
    } on DioError catch (e) {
      return null;
    }
  }

  Future<List<Unit>?> search(String query) async {
    try {
      var url = '${v}/unit/search';
      var response = await dio.post(url, data: query);
      return Unit.listFromJson(response.data);
    } on DioError catch (e) {
      return null;
    }
  }
}
