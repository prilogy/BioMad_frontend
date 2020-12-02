part of api.api;

class CategoryApi extends ApiBase<CategoryApi> {
  CategoryApi(Dio dio, {String version = "v1"}) : super(dio, version);

  Future<List<MemberCategoryState>> history() async {
    try {
      var url = '${v}/category/history';
      var response = await dio.get(url);
      return MemberCategoryState.listFromJson(response.data);
    } on DioError catch (e) {
      return null;
    }
  }

  Future<List<MemberCategoryState>> historyById(int id) async {
    try {
      var url = '${v}/category/${id}/history';
      var response = await dio.get(url);
      return MemberCategoryState.listFromJson(response.data);
    } on DioError catch (e) {
      return null;
    }
  }

  //TODO: из массива json в string
//  Future<List<String>> search(String query) async {
//    try {
//      var url = '${v}/category/search';
//      var response = await dio.post(url, data: query);
//      return ;
//    } on DioError catch (e) {
//      return response;
//    }
//  }

  Future<List<Category>> info() async {
    try {
      var url = '${v}/category';
      var response = await dio.get(url);
      return Category.listFromJson(response.data);
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

}
