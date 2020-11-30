part of api.api;

class BiomarkerApi extends ApiBase<BiomarkerApi> {
  BiomarkerApi(Dio dio, {String version = "v1"}) : super(dio, version);

  Future<List<Biomarker>> info() async {
    try {
      var url = '${v}/biomarker';
      var response = await dio.get(url);
      return Biomarker.listFromJson(response.data);
    } on DioError catch (e) {
      return null;
    }
  }

  Future<Biomarker> infoById(int id) async {
    try {
      var url = '${v}/biomarker/${id}';
      var response = await dio.get(url);
      return Biomarker.fromJson(response.data);
    } on DioError catch (e) {
      return null;
    }
  }

  Future<bool> add(MemberBiomarkerModel model) async {
    try {
      var url = '${v}/member/biomarker/add';
      await dio.post(url, data: model);
      return true;
    } on DioError catch (e) {
      return false;
    }
  }

  Future<bool> delete(int id) async {
    try {
      var url = '${v}/member/biomarker/${id}';
      await dio.delete(url);
      return true;
    } on DioError catch (e) {
      return false;
    }
  }

  Future<bool> edit(MemberBiomarkerModel model, int id) async {
    try {
      var url = '${v}/member/biomarker/${id}';
      await dio.patch(url, data: model);
      return true;
    } on DioError catch (e) {
      return false;
    }
  }
}
