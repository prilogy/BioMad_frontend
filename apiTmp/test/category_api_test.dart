import 'package:api/api.dart';
import 'package:test/test.dart';


/// tests for CategoryApi
void main() {
  var instance = CategoryApi();

  group('tests for CategoryApi', () {
    // Gets paged resources of type
    //
    //Future<List<Category>> apiV1CategoryGet({ int page, int pageSize, String orderByDate }) async 
    test('test apiV1CategoryGet', () async {
      // TODO
    });

    // Gets state history of categories
    //
    //Future<List<MemberCategoryState>> apiV1CategoryHistoryGet({ int page, int pageSize, String orderByDate }) async 
    test('test apiV1CategoryHistoryGet', () async {
      // TODO
    });

    // Gets resource of type of given id
    //
    //Future<Category> apiV1CategoryIdGet(int id) async 
    test('test apiV1CategoryIdGet', () async {
      // TODO
    });

    // Gets state history of category with given id
    //
    //Future<List<MemberCategoryState>> apiV1CategoryIdHistoryGet(int id, { int page, int pageSize, String orderByDate }) async 
    test('test apiV1CategoryIdHistoryGet', () async {
      // TODO
    });

    // Gets paged resources of type of given ids
    //
    //Future<List<Category>> apiV1CategoryPost({ int page, int pageSize, String orderByDate, List<int> requestBody }) async 
    test('test apiV1CategoryPost', () async {
      // TODO
    });

    // Searches categories by query
    //
    //Future<List<Category>> apiV1CategorySearchPost(String body, { int page, int pageSize, String orderByDate }) async 
    test('test apiV1CategorySearchPost', () async {
      // TODO
    });

  });
}
