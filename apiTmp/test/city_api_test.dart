import 'package:api/api.dart';
import 'package:test/test.dart';


/// tests for CityApi
void main() {
  var instance = CityApi();

  group('tests for CityApi', () {
    // Gets paged resources of type
    //
    //Future<List<City>> apiV1CityGet({ int page, int pageSize, String orderByDate }) async 
    test('test apiV1CityGet', () async {
      // TODO
    });

    // Gets resource of type of given id
    //
    //Future<City> apiV1CityIdGet(int id) async 
    test('test apiV1CityIdGet', () async {
      // TODO
    });

    // Gets paged resources of type of given ids
    //
    //Future<List<City>> apiV1CityPost({ int page, int pageSize, String orderByDate, List<int> requestBody }) async 
    test('test apiV1CityPost', () async {
      // TODO
    });

    // Searches cities by query
    //
    //Future<List<City>> apiV1CitySearchPost(String body, { int page, int pageSize, String orderByDate }) async 
    test('test apiV1CitySearchPost', () async {
      // TODO
    });

  });
}
