part of api.api;

class MemberAnalysisApi extends ApiBase<MemberAnalysisApi> {
  MemberAnalysisApi(Dio dio, {String version = "v1"}) : super(dio, version);

  Future<List<MemberAnalysis>> info() async {
    try {
      var url = '${v}/unit';
      var response = await dio.get(url);
      return Unit.listFromJson(response.data);
    } on DioError catch (e) {
      return null;
    }
  }

  Future<bool> add(MemberAnalysisModel model) async {
    try {
      var url = '${v}/member/analysis/add';
      await dio.post(url, data: model);
      return true;
    } on DioError catch (e) {
      return false;
    }
  }

  Future<bool> delete(int id) async {
    try {
      var url = '${v}/member/analysis/${id}';
      await dio.delete(url);
      return true;
    } on DioError catch (e) {
      return false;
    }
  }

  Future<bool> edit(MemberAnalysisModel model, int id) async {
    try {
      var url = '${v}/member/analysis/${id}';
      await dio.patch(url, data: model);
      return true;
    } on DioError catch (e) {
      return false;
    }
  }
}
