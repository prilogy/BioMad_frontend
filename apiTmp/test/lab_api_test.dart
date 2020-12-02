import 'package:api/api.dart';
import 'package:test/test.dart';


/// tests for LabApi
void main() {
  var instance = LabApi();

  group('tests for LabApi', () {
    // Gets paged resources of type
    //
    //Future<List<Lab>> apiV1LabGet({ int page, int pageSize, String orderByDate }) async 
    test('test apiV1LabGet', () async {
      // TODO
    });

    // Gets resource of type of given id
    //
    //Future<Lab> apiV1LabIdGet(int id) async 
    test('test apiV1LabIdGet', () async {
      // TODO
    });

    // Gets paged resources of type of given ids
    //
    //Future<List<Lab>> apiV1LabPost({ int page, int pageSize, String orderByDate, List<int> requestBody }) async 
    test('test apiV1LabPost', () async {
      // TODO
    });

    // Searches labs by query
    //
    //Future<List<Lab>> apiV1LabSearchPost(String body, { int page, int pageSize, String orderByDate }) async 
    test('test apiV1LabSearchPost', () async {
      // TODO
    });

  });
}
