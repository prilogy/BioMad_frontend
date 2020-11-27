part of api.api;

class BiomarkerApi extends ApiBase<MemberApi> {
  BiomarkerApi(Dio dio, {String version = "v1"}) : super(dio, version);

  Future<bool> add(BiomarkerApi model) async {
    try {
      var url = '${v}/v1/member/biomarker/add';
      await dio.post(url, data: model);
      return true;
    } on DioError catch (e) {
      return false;
    }
  }
}
