import 'package:api/api.dart';
import 'package:test/test.dart';


/// tests for MemberAnalysisApi
void main() {
  var instance = MemberAnalysisApi();

  group('tests for MemberAnalysisApi', () {
    // Adds new analysis
    //
    // \"Biomarkers\" property IS required
    //
    //Future<int> apiV1MemberAnalysisAddPost(MemberAnalysisModel memberAnalysisModel) async 
    test('test apiV1MemberAnalysisAddPost', () async {
      // TODO
    });

    // Gets paged resources of type
    //
    //Future<List<MemberAnalysis>> apiV1MemberAnalysisGet({ int page, int pageSize, String orderByDate }) async 
    test('test apiV1MemberAnalysisGet', () async {
      // TODO
    });

    // Deletes analysis of given id
    //
    //Future<MemberAnalysis> apiV1MemberAnalysisIdDelete(int id) async 
    test('test apiV1MemberAnalysisIdDelete', () async {
      // TODO
    });

    // Gets resource of type of given id
    //
    //Future<MemberAnalysis> apiV1MemberAnalysisIdGet(int id) async 
    test('test apiV1MemberAnalysisIdGet', () async {
      // TODO
    });

    // Edits analysis of given id
    //
    // \"Biomarkers\" property IS NOT required
    //
    //Future<MemberAnalysis> apiV1MemberAnalysisIdPatch(int id, MemberAnalysisModel memberAnalysisModel) async 
    test('test apiV1MemberAnalysisIdPatch', () async {
      // TODO
    });

    // Gets paged resources of type of given ids
    //
    //Future<List<MemberAnalysis>> apiV1MemberAnalysisPost({ int page, int pageSize, String orderByDate, List<int> requestBody }) async 
    test('test apiV1MemberAnalysisPost', () async {
      // TODO
    });

  });
}
