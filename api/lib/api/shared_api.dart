part of api.api;

class SharedApi extends ApiBase<MemberBiomarkerApi> {
  SharedApi(Dio dio, {String version = "v1"}) : super(dio, version);

  Future<bool> add(SharedModel model) async {
    try {
      var url = '${v}/shared/add';
      await dio.post(url, data: model);
      return true;
    } on DioError catch (e) {
      print("Adding Shared: ".toUpperCase() + e.toString());
      return false;
    }
  }

  Future<bool> delete(int id) async {
    try {
      var url = '${v}/shared/${id}';
      await dio.delete(url);
      return true;
    } on DioError catch (e) {
      return false;
    }
  }

  Future<Shared?> infoById(int id, int unitId) async {
    try {
      var url = '${v}/shared/${id}';
      var response = await dio.get(url);
      return Shared.fromJson(response.data);
    } on DioError catch (e) {
      return null;
    }
  }

  Future<List<Shared>?> info() async {
    try {
      var url = '${v}/shared';
      var response = await dio.get(url);
      return Shared.listFromJson(response.data);
    } on DioError catch (e) {
      return null;
    }
  }

}
