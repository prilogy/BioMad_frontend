part of api.api;



class MemberBiomarkerApi {
  final ApiClient apiClient;

  MemberBiomarkerApi([ApiClient apiClient]) : apiClient = apiClient ?? defaultApiClient;

  /// Adds new member biomarker with HTTP info returned
  ///
  /// 
  Future<Response> apiV1MemberBiomarkerAddPostWithHttpInfo(MemberBiomarkerModel memberBiomarkerModel) async {
    Object postBody = memberBiomarkerModel;

    // verify required params are set
    if(memberBiomarkerModel == null) {
     throw ApiException(400, "Missing required param: memberBiomarkerModel");
    }

    // create path and map variables
    String path = "/api/v1/member/biomarker/add".replaceAll("{format}","json");

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

  /// Adds new member biomarker
  ///
  /// 
  Future<int> apiV1MemberBiomarkerAddPost(MemberBiomarkerModel memberBiomarkerModel) async {
    Response response = await apiV1MemberBiomarkerAddPostWithHttpInfo(memberBiomarkerModel);
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
  Future<Response> apiV1MemberBiomarkerGetWithHttpInfo({ int page, int pageSize, String orderByDate }) async {
    Object postBody;

    // verify required params are set

    // create path and map variables
    String path = "/api/v1/member/biomarker".replaceAll("{format}","json");

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
  Future<List<MemberBiomarker>> apiV1MemberBiomarkerGet({ int page, int pageSize, String orderByDate }) async {
    Response response = await apiV1MemberBiomarkerGetWithHttpInfo( page: page, pageSize: pageSize, orderByDate: orderByDate );
    if(response.statusCode >= 400) {
      throw ApiException(response.statusCode, _decodeBodyBytes(response));
    } else if(response.body != null) {
      return (apiClient.deserialize(_decodeBodyBytes(response), 'List<MemberBiomarker>') as List).map((item) => item as MemberBiomarker).toList();
    } else {
      return null;
    }
  }

  /// Deletes member&#39;s biomarker of given id with HTTP info returned
  ///
  /// 
  Future apiV1MemberBiomarkerIdDeleteWithHttpInfo(int id) async {
    Object postBody;

    // verify required params are set
    if(id == null) {
     throw ApiException(400, "Missing required param: id");
    }

    // create path and map variables
    String path = "/api/v1/member/biomarker/{id}".replaceAll("{format}","json").replaceAll("{" + "id" + "}", id.toString());

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

  /// Deletes member&#39;s biomarker of given id
  ///
  /// 
  Future apiV1MemberBiomarkerIdDelete(int id) async {
    Response response = await apiV1MemberBiomarkerIdDeleteWithHttpInfo(id);
    if(response.statusCode >= 400) {
      throw ApiException(response.statusCode, _decodeBodyBytes(response));
    } else if(response.body != null) {
    } else {
      return;
    }
  }

  /// Gets resource of type of given id with HTTP info returned
  ///
  /// 
  Future<Response> apiV1MemberBiomarkerIdGetWithHttpInfo(int id) async {
    Object postBody;

    // verify required params are set
    if(id == null) {
     throw ApiException(400, "Missing required param: id");
    }

    // create path and map variables
    String path = "/api/v1/member/biomarker/{id}".replaceAll("{format}","json").replaceAll("{" + "id" + "}", id.toString());

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
  Future<MemberBiomarker> apiV1MemberBiomarkerIdGet(int id) async {
    Response response = await apiV1MemberBiomarkerIdGetWithHttpInfo(id);
    if(response.statusCode >= 400) {
      throw ApiException(response.statusCode, _decodeBodyBytes(response));
    } else if(response.body != null) {
      return apiClient.deserialize(_decodeBodyBytes(response), 'MemberBiomarker') as MemberBiomarker;
    } else {
      return null;
    }
  }

  /// Edits member&#39;s biomarker of given id with HTTP info returned
  ///
  /// \&quot;AnalysisId\&quot; is ignored
  Future<Response> apiV1MemberBiomarkerIdPatchWithHttpInfo(int id, MemberBiomarkerModel memberBiomarkerModel) async {
    Object postBody = memberBiomarkerModel;

    // verify required params are set
    if(id == null) {
     throw ApiException(400, "Missing required param: id");
    }
    if(memberBiomarkerModel == null) {
     throw ApiException(400, "Missing required param: memberBiomarkerModel");
    }

    // create path and map variables
    String path = "/api/v1/member/biomarker/{id}".replaceAll("{format}","json").replaceAll("{" + "id" + "}", id.toString());

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

  /// Edits member&#39;s biomarker of given id
  ///
  /// \&quot;AnalysisId\&quot; is ignored
  Future<MemberBiomarker> apiV1MemberBiomarkerIdPatch(int id, MemberBiomarkerModel memberBiomarkerModel) async {
    Response response = await apiV1MemberBiomarkerIdPatchWithHttpInfo(id, memberBiomarkerModel);
    if(response.statusCode >= 400) {
      throw ApiException(response.statusCode, _decodeBodyBytes(response));
    } else if(response.body != null) {
      return apiClient.deserialize(_decodeBodyBytes(response), 'MemberBiomarker') as MemberBiomarker;
    } else {
      return null;
    }
  }

  /// Gets paged resources of type of given ids with HTTP info returned
  ///
  /// 
  Future<Response> apiV1MemberBiomarkerPostWithHttpInfo({ int page, int pageSize, String orderByDate, List<int> requestBody }) async {
    Object postBody = requestBody;

    // verify required params are set

    // create path and map variables
    String path = "/api/v1/member/biomarker".replaceAll("{format}","json");

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
  Future<List<MemberBiomarker>> apiV1MemberBiomarkerPost({ int page, int pageSize, String orderByDate, List<int> requestBody }) async {
    Response response = await apiV1MemberBiomarkerPostWithHttpInfo( page: page, pageSize: pageSize, orderByDate: orderByDate, requestBody: requestBody );
    if(response.statusCode >= 400) {
      throw ApiException(response.statusCode, _decodeBodyBytes(response));
    } else if(response.body != null) {
      return (apiClient.deserialize(_decodeBodyBytes(response), 'List<MemberBiomarker>') as List).map((item) => item as MemberBiomarker).toList();
    } else {
      return null;
    }
  }

}
