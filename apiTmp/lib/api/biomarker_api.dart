part of api.api;



class BiomarkerApi {
  final ApiClient apiClient;

  BiomarkerApi([ApiClient apiClient]) : apiClient = apiClient ?? defaultApiClient;

  /// Gets paged resources of type with HTTP info returned
  ///
  /// 
  Future<Response> apiV1BiomarkerGetWithHttpInfo({ int page, int pageSize, String orderByDate }) async {
    Object postBody;

    // verify required params are set

    // create path and map variables
    String path = "/api/v1/Biomarker".replaceAll("{format}","json");

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
  Future<List<Biomarker>> apiV1BiomarkerGet({ int page, int pageSize, String orderByDate }) async {
    Response response = await apiV1BiomarkerGetWithHttpInfo( page: page, pageSize: pageSize, orderByDate: orderByDate );
    if(response.statusCode >= 400) {
      throw ApiException(response.statusCode, _decodeBodyBytes(response));
    } else if(response.body != null) {
      return (apiClient.deserialize(_decodeBodyBytes(response), 'List<Biomarker>') as List).map((item) => item as Biomarker).toList();
    } else {
      return null;
    }
  }

  /// Gets resource of type of given id with HTTP info returned
  ///
  /// 
  Future<Response> apiV1BiomarkerIdGetWithHttpInfo(int id) async {
    Object postBody;

    // verify required params are set
    if(id == null) {
     throw ApiException(400, "Missing required param: id");
    }

    // create path and map variables
    String path = "/api/v1/Biomarker/{id}".replaceAll("{format}","json").replaceAll("{" + "id" + "}", id.toString());

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
  Future<Biomarker> apiV1BiomarkerIdGet(int id) async {
    Response response = await apiV1BiomarkerIdGetWithHttpInfo(id);
    if(response.statusCode >= 400) {
      throw ApiException(response.statusCode, _decodeBodyBytes(response));
    } else if(response.body != null) {
      return apiClient.deserialize(_decodeBodyBytes(response), 'Biomarker') as Biomarker;
    } else {
      return null;
    }
  }

  /// Gets history of member&#39;s biomarker values for given Id of biomarker with HTTP info returned
  ///
  /// 
  Future<Response> apiV1BiomarkerIdHistoryGetWithHttpInfo(int id, { int page, int pageSize, String orderByDate }) async {
    Object postBody;

    // verify required params are set
    if(id == null) {
     throw ApiException(400, "Missing required param: id");
    }

    // create path and map variables
    String path = "/api/v1/Biomarker/{id}/history".replaceAll("{format}","json").replaceAll("{" + "id" + "}", id.toString());

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

  /// Gets history of member&#39;s biomarker values for given Id of biomarker
  ///
  /// 
  Future<List<MemberBiomarker>> apiV1BiomarkerIdHistoryGet(int id, { int page, int pageSize, String orderByDate }) async {
    Response response = await apiV1BiomarkerIdHistoryGetWithHttpInfo(id,  page: page, pageSize: pageSize, orderByDate: orderByDate );
    if(response.statusCode >= 400) {
      throw ApiException(response.statusCode, _decodeBodyBytes(response));
    } else if(response.body != null) {
      return (apiClient.deserialize(_decodeBodyBytes(response), 'List<MemberBiomarker>') as List).map((item) => item as MemberBiomarker).toList();
    } else {
      return null;
    }
  }

  /// Gets paged resources of type of given ids with HTTP info returned
  ///
  /// 
  Future<Response> apiV1BiomarkerPostWithHttpInfo({ int page, int pageSize, String orderByDate, List<int> requestBody }) async {
    Object postBody = requestBody;

    // verify required params are set

    // create path and map variables
    String path = "/api/v1/Biomarker".replaceAll("{format}","json");

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
  Future<List<Biomarker>> apiV1BiomarkerPost({ int page, int pageSize, String orderByDate, List<int> requestBody }) async {
    Response response = await apiV1BiomarkerPostWithHttpInfo( page: page, pageSize: pageSize, orderByDate: orderByDate, requestBody: requestBody );
    if(response.statusCode >= 400) {
      throw ApiException(response.statusCode, _decodeBodyBytes(response));
    } else if(response.body != null) {
      return (apiClient.deserialize(_decodeBodyBytes(response), 'List<Biomarker>') as List).map((item) => item as Biomarker).toList();
    } else {
      return null;
    }
  }

  /// Searches biomarkers by query with HTTP info returned
  ///
  /// 
  Future<Response> apiV1BiomarkerSearchPostWithHttpInfo(String body, { int page, int pageSize, String orderByDate }) async {
    Object postBody = body;

    // verify required params are set
    if(body == null) {
     throw ApiException(400, "Missing required param: body");
    }

    // create path and map variables
    String path = "/api/v1/Biomarker/search".replaceAll("{format}","json");

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

  /// Searches biomarkers by query
  ///
  /// 
  Future<List<Biomarker>> apiV1BiomarkerSearchPost(String body, { int page, int pageSize, String orderByDate }) async {
    Response response = await apiV1BiomarkerSearchPostWithHttpInfo(body,  page: page, pageSize: pageSize, orderByDate: orderByDate );
    if(response.statusCode >= 400) {
      throw ApiException(response.statusCode, _decodeBodyBytes(response));
    } else if(response.body != null) {
      return (apiClient.deserialize(_decodeBodyBytes(response), 'List<Biomarker>') as List).map((item) => item as Biomarker).toList();
    } else {
      return null;
    }
  }

  /// Gets types of biomarkers with HTTP info returned
  ///
  /// 
  Future<Response> apiV1BiomarkerTypeGetWithHttpInfo({ int page, int pageSize, String orderByDate }) async {
    Object postBody;

    // verify required params are set

    // create path and map variables
    String path = "/api/v1/Biomarker/type".replaceAll("{format}","json");

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

  /// Gets types of biomarkers
  ///
  /// 
  Future<List<BiomarkerType>> apiV1BiomarkerTypeGet({ int page, int pageSize, String orderByDate }) async {
    Response response = await apiV1BiomarkerTypeGetWithHttpInfo( page: page, pageSize: pageSize, orderByDate: orderByDate );
    if(response.statusCode >= 400) {
      throw ApiException(response.statusCode, _decodeBodyBytes(response));
    } else if(response.body != null) {
      return (apiClient.deserialize(_decodeBodyBytes(response), 'List<BiomarkerType>') as List).map((item) => item as BiomarkerType).toList();
    } else {
      return null;
    }
  }

  /// Gets type of biomarker of given id with HTTP info returned
  ///
  /// 
  Future<Response> apiV1BiomarkerTypeIdGetWithHttpInfo(int id) async {
    Object postBody;

    // verify required params are set
    if(id == null) {
     throw ApiException(400, "Missing required param: id");
    }

    // create path and map variables
    String path = "/api/v1/Biomarker/type/{id}".replaceAll("{format}","json").replaceAll("{" + "id" + "}", id.toString());

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

  /// Gets type of biomarker of given id
  ///
  /// 
  Future<List<BiomarkerType>> apiV1BiomarkerTypeIdGet(int id) async {
    Response response = await apiV1BiomarkerTypeIdGetWithHttpInfo(id);
    if(response.statusCode >= 400) {
      throw ApiException(response.statusCode, _decodeBodyBytes(response));
    } else if(response.body != null) {
      return (apiClient.deserialize(_decodeBodyBytes(response), 'List<BiomarkerType>') as List).map((item) => item as BiomarkerType).toList();
    } else {
      return null;
    }
  }

}
