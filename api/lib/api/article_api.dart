part of api.api;

class ArticleApi extends ApiBase<ArticleApi> {
  ArticleApi(Dio dio, {String version = "v1"}) : super(dio, version);

  Future<List<Article>> info() async {
    try {
      var url = '${v}/article';
      var response = await dio.get(url);
      return Article.listFromJson(response.data);
    } on DioError catch (e) {
      return null;
    }
  }

  Future<Article> infoById(int id) async {
    try {
      var url = '${v}/article/${id}';
      var response = await dio.get(url);
      return Article.fromJson(response.data);
    } on DioError catch (e) {
      return null;
    }
  }
}
