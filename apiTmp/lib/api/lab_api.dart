part of api.api;



class LabApi {
  final ApiClient apiClient;

  LabApi([ApiClient apiClient]) : apiClient = apiClient ?? defaultApiClient;

  /// Gets paged resources of type with HTTP info returned
  ///
  /// 
  Future<Response> apiV1LabGetWithHttpInfo({ int page, int pageSize, String orderByDate }) async {
    Object postBody;

    // verify required params are set

    // create path and map variables
    String path = "/api/v1/Lab".replaceAll("{format}","json");

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
  Future<List<Lab>> apiV1LabGet({ int page, int pageSize, String orderByDate }) async {
    Response response = await apiV1LabGetWithHttpInfo( page: page, pageSize: pageSize, orderByDate: orderByDate );
    if(response.statusCode >= 400) {
      throw ApiException(response.statusCode, _decodeBodyBytes(response));
    } else if(response.body != null) {
      return (apiClient.deserialize(_decodeBodyBytes(response), 'List<Lab>') as List).map((item) => item as Lab).toList();
    } else {
      return null;
    }
  }

  /// Gets resource of type of given id with HTTP info returned
  ///
  /// 
  Future<Response> apiV1LabIdGetWithHttpInfo(int id) async {
    Object postBody;

    // verify required params are set
    if(id == null) {
     throw ApiException(400, "Missing required param: id");
    }

    // create path and map variables
    String path = "/api/v1/Lab/{id}".replaceAll("{format}","json").replaceAll("{" + "id" + "}", id.toString());

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
  Future<Lab> apiV1LabIdGet(int id) async {
    Response response = await apiV1LabIdGetWithHttpInfo(id);
    if(response.statusCode >= 400) {
      throw ApiException(response.statusCode, _decodeBodyBytes(response));
    } else if(response.body != null) {
      return apiClient.deserialize(_decodeBodyBytes(response), 'Lab') as Lab;
    } else {
      return null;
    }
  }

  /// Gets paged resources of type of given ids with HTTP info returned
  ///
  /// 
  Future<Response> apiV1LabPostWithHttpInfo({ int page, int pageSize, String orderByDate, List<int> requestBody }) async {
    Object postBody = requestBody;

    // verify required params are set

    // create path and map variables
    String path = "/api/v1/Lab".replaceAll("{format}","json");

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
  Future<List<Lab>> apiV1LabPost({ int page, int pageSize, String orderByDate, List<int> requestBody }) async {
    Response response = await apiV1LabPostWithHttpInfo( page: page, pageSize: pageSize, orderByDate: orderByDate, requestBody: requestBody );
    if(response.statusCode >= 400) {
      throw ApiException(response.statusCode, _decodeBodyBytes(response));
    } else if(response.body != null) {
      return (apiClient.deserialize(_decodeBodyBytes(response), 'List<Lab>') as List).map((item) => item as Lab).toList();
    } else {
      return null;
    }
  }

  /// Searches labs by query with HTTP info returned
  ///
  /// 
  Future<Response> apiV1LabSearchPostWithHttpInfo(String body, { int page, int pageSize, String orderByDate }) async {
    Object postBody = body;

    // verify required params are set
    if(body == null) {
     throw ApiException(400, "Missing required param: body");
    }

    // create path and map variables
    String path = "/api/v1/Lab/search".replaceAll("{format}","json");

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

  /// Searches labs by query
  ///
  /// 
  Future<List<Lab>> apiV1LabSearchPost(String body, { int page, int pageSize, String orderByDate }) async {
    Response response = await apiV1LabSearchPostWithHttpInfo(body,  page: page, pageSize: pageSize, orderByDate: orderByDate );
    if(response.statusCode >= 400) {
      throw ApiException(response.statusCode, _decodeBodyBytes(response));
    } else if(response.body != null) {
      return (apiClient.deserialize(_decodeBodyBytes(response), 'List<Lab>') as List).map((item) => item as Lab).toList();
    } else {
      return null;
    }
  }

}
