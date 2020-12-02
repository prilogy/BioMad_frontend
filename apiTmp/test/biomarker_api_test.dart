import 'package:api/api.dart';
import 'package:test/test.dart';


/// tests for BiomarkerApi
void main() {
  var instance = BiomarkerApi();

  group('tests for BiomarkerApi', () {
    // Gets paged resources of type
    //
    //Future<List<Biomarker>> apiV1BiomarkerGet({ int page, int pageSize, String orderByDate }) async 
    test('test apiV1BiomarkerGet', () async {
      // TODO
    });

    // Gets resource of type of given id
    //
    //Future<Biomarker> apiV1BiomarkerIdGet(int id) async 
    test('test apiV1BiomarkerIdGet', () async {
      // TODO
    });

    // Gets history of member's biomarker values for given Id of biomarker
    //
    //Future<List<MemberBiomarker>> apiV1BiomarkerIdHistoryGet(int id, { int page, int pageSize, String orderByDate }) async 
    test('test apiV1BiomarkerIdHistoryGet', () async {
      // TODO
    });

    // Gets paged resources of type of given ids
    //
    //Future<List<Biomarker>> apiV1BiomarkerPost({ int page, int pageSize, String orderByDate, List<int> requestBody }) async 
    test('test apiV1BiomarkerPost', () async {
      // TODO
    });

    // Searches biomarkers by query
    //
    //Future<List<Biomarker>> apiV1BiomarkerSearchPost(String body, { int page, int pageSize, String orderByDate }) async 
    test('test apiV1BiomarkerSearchPost', () async {
      // TODO
    });

    // Gets types of biomarkers
    //
    //Future<List<BiomarkerType>> apiV1BiomarkerTypeGet({ int page, int pageSize, String orderByDate }) async 
    test('test apiV1BiomarkerTypeGet', () async {
      // TODO
    });

    // Gets type of biomarker of given id
    //
    //Future<List<BiomarkerType>> apiV1BiomarkerTypeIdGet(int id) async 
    test('test apiV1BiomarkerTypeIdGet', () async {
      // TODO
    });

  });
}
