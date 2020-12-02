part of api.api;



class MemberAnalysisApi {
  final ApiClient apiClient;

  MemberAnalysisApi([ApiClient apiClient]) : apiClient = apiClient ?? defaultApiClient;

  /// Adds new analysis with HTTP info returned
  ///
  /// \&quot;Biomarkers\&quot; property IS required
  Future<Response> apiV1MemberAnalysisAddPostWithHttpInfo(MemberAnalysisModel memberAnalysisModel) async {
    Object postBody = memberAnalysisModel;

    // verify required params are set
    if(memberAnalysisModel == null) {
     throw ApiException(400, "Missing required param: memberAnalysisModel");
    }

    // create path and map variables
    String path = "/api/v1/member/analysis/add".replaceAll("{format}","json");

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};

    List<String> contentTypes = ["application/json-patch+json","application/json","text/json","application/_*+json"];

    String nullableContentType = contentTypes.isNotEmpty ? contentTypes[0] : null;
    List<String> authNames = ["bearer"];

    if(nullableContentType != null && nullableContentType.startsWith("multipart/form-data")) {
      bool hasFields = false;
      MultipartRequest mp = MultipartRequest(null, null);
      if(hasFields)
        postBody = mp;
    }
    else {
    }

    var response = await apiClient.invokeAPI(path,
                                             'POST',
                                             queryParams,
                                             postBody,
                                             headerParams,
                                             formParams,
                                             nullableContentType,
                                             authNames);
    return response;
  }

  /// Adds new analysis
  ///
  /// \&quot;Biomarkers\&quot; property IS required
  Future<int> apiV1MemberAnalysisAddPost(MemberAnalysisModel memberAnalysisModel) async {
    Response response = await apiV1MemberAnalysisAddPostWithHttpInfo(memberAnalysisModel);
    if(response.statusCode >= 400) {
      throw ApiException(response.statusCode, _decodeBodyBytes(response));
    } else if(response.body != null) {
      return apiClient.deserialize(_decodeBodyBytes(response), 'int') as int;
    } else {
      return null;
    }
  }

  /// Gets paged resources of type with HTTP info returned
  ///
  /// 
  Future<Response> apiV1MemberAnalysisGetWithHttpInfo({ int page, int pageSize, String orderByDate }) async {
    Object postBody;

    // verify required params are set

    // create path and map variables
    String path = "/api/v1/member/analysis".replaceAll("{format}","json");

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};
    if(page != null) {
      queryParams.addAll(_convertParametersForCollectionFormat("", "page", page));
    }
    if(pageSize != null) {
      queryParams.addAll(_convertParametersForCollectionFormat("", "pageSize", pageSize));
    }
    if(orderByDate != null) {
      queryParams.addAll(_convertParametersForCollectionFormat("", "orderByDate", orderByDate));
    }

    List<String> contentTypes = [];

    String nullableContentType = contentTypes.isNotEmpty ? contentTypes[0] : null;
    List<String> authNames = ["bearer"];

    if(nullableContentType != null && nullableContentType.startsWith("multipart/form-data")) {
      bool hasFields = false;
      MultipartRequest mp = MultipartRequest(null, null);
      if(hasFields)
        postBody = mp;
    }
    else {
    }

    var response = await apiClient.invokeAPI(path,
                                             'GET',
                                             queryParams,
                                             postBody,
                                             headerParams,
                                             formParams,
                                             nullableContentType,
                                             authNames);
    return response;
  }

  /// Gets paged resources of type
  ///
  /// 
  Future<List<MemberAnalysis>> apiV1MemberAnalysisGet({ int page, int pageSize, String orderByDate }) async {
    Response response = await apiV1MemberAnalysisGetWithHttpInfo( page: page, pageSize: pageSize, orderByDate: orderByDate );
    if(response.statusCode >= 400) {
      throw ApiException(response.statusCode, _decodeBodyBytes(response));
    } else if(response.body != null) {
      return (apiClient.deserialize(_decodeBodyBytes(response), 'List<MemberAnalysis>') as List).map((item) => item as MemberAnalysis).toList();
    } else {
      return null;
    }
  }

  /// Deletes analysis of given id with HTTP info returned
  ///
  /// 
  Future<Response> apiV1MemberAnalysisIdDeleteWithHttpInfo(int id) async {
    Object postBody;

    // verify required params are set
    if(id == null) {
     throw ApiException(400, "Missing required param: id");
    }

    // create path and map variables
    String path = "/api/v1/member/analysis/{id}".replaceAll("{format}","json").replaceAll("{" + "id" + "}", id.toString());

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};

    List<String> contentTypes = [];

    String nullableContentType = contentTypes.isNotEmpty ? contentTypes[0] : null;
    List<String> authNames = ["bearer"];

    if(nullableContentType != null && nullableContentType.startsWith("multipart/form-data")) {
      bool hasFields = false;
      MultipartRequest mp = MultipartRequest(null, null);
      if(hasFields)
        postBody = mp;
    }
    else {
    }

    var response = await apiClient.invokeAPI(path,
                                             'DELETE',
                                             queryParams,
                                             postBody,
                                             headerParams,
                                             formParams,
                                             nullableContentType,
                                             authNames);
    return response;
  }

  /// Deletes analysis of given id
  ///
  /// 
  Future<MemberAnalysis> apiV1MemberAnalysisIdDelete(int id) async {
    Response response = await apiV1MemberAnalysisIdDeleteWithHttpInfo(id);
    if(response.statusCode >= 400) {
      throw ApiException(response.statusCode, _decodeBodyBytes(response));
    } else if(response.body != null) {
      return apiClient.deserialize(_decodeBodyBytes(response), 'MemberAnalysis') as MemberAnalysis;
    } else {
      return null;
    }
  }

  /// Gets resource of type of given id with HTTP info returned
  ///
  /// 
  Future<Response> apiV1MemberAnalysisIdGetWithHttpInfo(int id) async {
    Object postBody;

    // verify required params are set
    if(id == null) {
     throw ApiException(400, "Missing required param: id");
    }

    // create path and map variables
    String path = "/api/v1/member/analysis/{id}".replaceAll("{format}","json").replaceAll("{" + "id" + "}", id.toString());

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};

    List<String> contentTypes = [];

    String nullableContentType = contentTypes.isNotEmpty ? contentTypes[0] : null;
    List<String> authNames = ["bearer"];

    if(nullableContentType != null && nullableContentType.startsWith("multipart/form-data")) {
      bool hasFields = false;
      MultipartRequest mp = MultipartRequest(null, null);
      if(hasFields)
        postBody = mp;
    }
    else {
    }

    var response = await apiClient.invokeAPI(path,
                                             'GET',
                                             queryParams,
                                             postBody,
                                             headerParams,
                                             formParams,
                                             nullableContentType,
                                             authNames);
    return response;
  }

  /// Gets resource of type of given id
  ///
  /// 
  Future<MemberAnalysis> apiV1MemberAnalysisIdGet(int id) async {
    Response response = await apiV1MemberAnalysisIdGetWithHttpInfo(id);
    if(response.statusCode >= 400) {
      throw ApiException(response.statusCode, _decodeBodyBytes(response));
    } else if(response.body != null) {
      return apiClient.deserialize(_decodeBodyBytes(response), 'MemberAnalysis') as MemberAnalysis;
    } else {
      return null;
    }
  }

  /// Edits analysis of given id with HTTP info returned
  ///
  /// \&quot;Biomarkers\&quot; property IS NOT required
  Future<Response> apiV1MemberAnalysisIdPatchWithHttpInfo(int id, MemberAnalysisModel memberAnalysisModel) async {
    Object postBody = memberAnalysisModel;

    // verify required params are set
    if(id == null) {
     throw ApiException(400, "Missing required param: id");
    }
    if(memberAnalysisModel == null) {
     throw ApiException(400, "Missing required param: memberAnalysisModel");
    }

    // create path and map variables
    String path = "/api/v1/member/analysis/{id}".replaceAll("{format}","json").replaceAll("{" + "id" + "}", id.toString());

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};

    List<String> contentTypes = ["application/json-patch+json","application/json","text/json","application/_*+json"];

    String nullableContentType = contentTypes.isNotEmpty ? contentTypes[0] : null;
    List<String> authNames = ["bearer"];

    if(nullableContentType != null && nullableContentType.startsWith("multipart/form-data")) {
      bool hasFields = false;
      MultipartRequest mp = MultipartRequest(null, null);
      if(hasFields)
        postBody = mp;
    }
    else {
    }

    var response = await apiClient.invokeAPI(path,
                                             'PATCH',
                                             queryParams,
                                             postBody,
                                             headerParams,
                                             formParams,
                                             nullableContentType,
                                             authNames);
    return response;
  }

  /// Edits analysis of given id
  ///
  /// \&quot;Biomarkers\&quot; property IS NOT required
  Future<MemberAnalysis> apiV1MemberAnalysisIdPatch(int id, MemberAnalysisModel memberAnalysisModel) async {
    Response response = await apiV1MemberAnalysisIdPatchWithHttpInfo(id, memberAnalysisModel);
    if(response.statusCode >= 400) {
      throw ApiException(response.statusCode, _decodeBodyBytes(response));
    } else if(response.body != null) {
      return apiClient.deserialize(_decodeBodyBytes(response), 'MemberAnalysis') as MemberAnalysis;
    } else {
      return null;
    }
  }

  /// Gets paged resources of type of given ids with HTTP info returned
  ///
  /// 
  Future<Response> apiV1MemberAnalysisPostWithHttpInfo({ int page, int pageSize, String orderByDate, List<int> requestBody }) async {
    Object postBody = requestBody;

    // verify required params are set

    // create path and map variables
    String path = "/api/v1/member/analysis".replaceAll("{format}","json");

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};
    if(page != null) {
      queryParams.addAll(_convertParametersForCollectionFormat("", "page", page));
    }
    if(pageSize != null) {
      queryParams.addAll(_convertParametersForCollectionFormat("", "pageSize", pageSize));
    }
    if(orderByDate != null) {
      queryParams.addAll(_convertParametersForCollectionFormat("", "orderByDate", orderByDate));
    }

    List<String> contentTypes = ["application/json-patch+json","application/json","text/json","application/_*+json"];

    String nullableContentType = contentTypes.isNotEmpty ? contentTypes[0] : null;
    List<String> authNames = ["bearer"];

    if(nullableContentType != null && nullableContentType.startsWith("multipart/form-data")) {
      bool hasFields = false;
      MultipartRequest mp = MultipartRequest(null, null);
      if(hasFields)
        postBody = mp;
    }
    else {
    }

    var response = await apiClient.invokeAPI(path,
                                             'POST',
                                             queryParams,
                                             postBody,
                                             headerParams,
                                             formParams,
                                             nullableContentType,
                                             authNames);
    return response;
  }

  /// Gets paged resources of type of given ids
  ///
  /// 
  Future<List<MemberAnalysis>> apiV1MemberAnalysisPost({ int page, int pageSize, String orderByDate, List<int> requestBody }) async {
    Response response = await apiV1MemberAnalysisPostWithHttpInfo( page: page, pageSize: pageSize, orderByDate: orderByDate, requestBody: requestBody );
    if(response.statusCode >= 400) {
      throw ApiException(response.statusCode, _decodeBodyBytes(response));
    } else if(response.body != null) {
      return (apiClient.deserialize(_decodeBodyBytes(response), 'List<MemberAnalysis>') as List).map((item) => item as MemberAnalysis).toList();
    } else {
      return null;
    }
  }

}
