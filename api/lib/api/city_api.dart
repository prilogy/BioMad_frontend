part of api.api;

class CityApi extends ApiBase<CityApi> {
  CityApi(Dio dio, {String version = "v1"}) : super(dio, version);

  Future<List<City>> info() async {
    try {
      var url = '${v}/city';
      var response = await dio.get(url);
      return City.listFromJson(response.data);
    } on DioError catch (e) {
      return null;
    }
  }

  Future<City> infoById(int id) async {
    try {
      var url = '${v}/city/${id}';
      var response = await dio.get(url);
      return City.fromJson(response.data);
    } on DioError catch (e) {
      return null;
    }
  }
}
