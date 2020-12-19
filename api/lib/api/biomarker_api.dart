part of api.api;

class BiomarkerApi extends ApiBase<BiomarkerApi> {
  BiomarkerApi(Dio dio, {String version = "v1"}) : super(dio, version);

  Future<MemberBiomarker> history(int id) async {
    try {
      var url = '${v}/biomarker/${id}/history';
      var response = await dio.get(url);
      return MemberBiomarker.fromJson(response.data);
    } on DioError catch (e) {
      return null;
    }
  }

  Future<List<BiomarkerType>> type() async {
    try {
      var url = '${v}/biomarker/type';
      var response = await dio.get(url);
      return BiomarkerType.listFromJson(response.data);
    } on DioError catch (e) {
      return null;
    }
  }

  Future<BiomarkerType> typeById(int id) async {
    try {
      var url = '${v}/biomarker/type/${id}';
      var response = await dio.get(url);
      return BiomarkerType.fromJson(response.data);
    } on DioError catch (e) {
      return null;
    }
  }

  Future<List<Biomarker>> info() async {
    try {
      var url = '${v}/biomarker';
      var response = await dio.get(url);
      return Biomarker.listFromJson(response.data);
    } on DioError catch (e) {
      return null;
    }
  }

  Future<Biomarker> infoById(int id, int unitId) async {
    try {
      var url = unitId != null
          ? '${v}/biomarker/${id}?unitId=$unitId'
          : '${v}/biomarker/${id}';
      var response = await dio.get(url);
      return Biomarker.fromJson(response.data);
    } on DioError catch (e) {
      return null;
    }
  }

  Future<List<Biomarker>> search(String query) async {
    try {
      var url = '${v}/biomarker/search';
      var response = await dio.post(url, data: query);
      return Biomarker.listFromJson(response.data);
    } on DioError catch (e) {
      print(e);
      return null;
    }
  }
}
