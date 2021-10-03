part of api.api;

class MemberBiomarkerApi extends ApiBase<MemberBiomarkerApi> {
  MemberBiomarkerApi(Dio dio, {String version = "v1"}) : super(dio, version);

  Future<bool> add(MemberBiomarkerModel model) async {
    try {
      var url = '${v}/member/biomarker/add';
      await dio.post(url, data: model);
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

  Future<bool> delete(int id) async {
    try {
      var url = '${v}/member/biomarker/${id}';
      await dio.delete(url);
      return true;
    } on DioError catch (e) {
      return false;
    }
  }

  Future<MemberBiomarker?> infoById(int id, int unitId) async {
    try {
      var url = unitId != null
          ? '${v}/member/biomarker/${id}?unitId=$unitId'
          : '${v}/member/biomarker/${id}';
      var response = await dio.get(url);
      return MemberBiomarker.fromJson(response.data);
    } on DioError catch (e) {
      return null;
    }
  }

  Future<List<MemberBiomarker>?> info() async {
    try {
      var url = '${v}/member/biomarker';
      var response = await dio.get(url);
      return MemberBiomarker.listFromJson(response.data);
    } on DioError catch (e) {
      return null;
    }
  }

  Future<List<MemberBiomarker>?> history(int id, int unitId) async {
    try {
      var url = unitId != null
          ? '${v}/biomarker/${id}/history?unitId=$unitId'
          : '${v}/biomarker/${id}/history';
      var response = await dio.get(url);
      print(response.data.toString());
      return MemberBiomarker.listFromJson(response.data);
    } on DioError catch (e) {
      return null;
    }
  }

  Future<bool> addReference(MemberBiomarkerReferenceModel model) async {
    try {
      var url = '${v}/member/biomarker/reference';
      await dio.post(url, data: model);
      return true;
    } on DioError catch (e) {
      print("MEMBER REFERENCE: " + e.toString());
      return false;
    }
  }

  Future<bool> deleteReference(int id) async {
    try {
      var url = '${v}/member/biomarker/reference/${id}';
      await dio.delete(url);
      print("REFERENCE DELETED!");
      return true;
    } on DioError catch (e) {
      print("REFERENCE DELETE ERROR!" + e.toString());
      return false;
    }
  }
}
