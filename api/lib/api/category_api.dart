part of api.api;

class CategoryApi extends ApiBase<CategoryApi> {
  CategoryApi(Dio dio, {String version = "v1"}) : super(dio, version);

  Future<Category> info() async {
    try {
      var url = '${v}/category';
      var response = await dio.get(url);
      return Category.fromJson(response.data);
    } on DioError catch (e) {
      return null;
    }
  }

  Future<Category> infoById(int id) async {
    try {
      var url = '${v}/category/${id}';
      var response = await dio.get(url);
      return Category.fromJson(response.data);
    } on DioError catch (e) {
      return null;
    }
  }

  Future<Category> history() async {
    try {
      var url = '${v}/category/history';
      var response = await dio.get(url);
      return Category.fromJson(response.data);
    } on DioError catch (e) {
      return null;
    }
  }

  Future<Category> historyById(int id) async {
    try {
      var url = '${v}/category/${id}/history';
      var response = await dio.get(url);
      return Category.fromJson(response.data);
    } on DioError catch (e) {
      return null;
    }
  }
}
