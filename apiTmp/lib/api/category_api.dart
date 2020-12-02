part of api.api;



class CategoryApi {
  final ApiClient apiClient;

  CategoryApi([ApiClient apiClient]) : apiClient = apiClient ?? defaultApiClient;

  /// Gets paged resources of type with HTTP info returned
  ///
  /// 
  Future<Response> apiV1CategoryGetWithHttpInfo({ int page, int pageSize, String orderByDate }) async {
    Object postBody;

    // verify required params are set

    // create path and map variables
    String path = "/api/v1/Category".replaceAll("{format}","json");

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
  Future<List<Category>> apiV1CategoryGet({ int page, int pageSize, String orderByDate }) async {
    Response response = await apiV1CategoryGetWithHttpInfo( page: page, pageSize: pageSize, orderByDate: orderByDate );
    if(response.statusCode >= 400) {
      throw ApiException(response.statusCode, _decodeBodyBytes(response));
    } else if(response.body != null) {
      return (apiClient.deserialize(_decodeBodyBytes(response), 'List<Category>') as List).map((item) => item as Category).toList();
    } else {
      return null;
    }
  }

  /// Gets state history of categories with HTTP info returned
  ///
  /// 
  Future<Response> apiV1CategoryHistoryGetWithHttpInfo({ int page, int pageSize, String orderByDate }) async {
    Object postBody;

    // verify required params are set

    // create path and map variables
    String path = "/api/v1/Category/history".replaceAll("{format}","json");

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

  /// Gets state history of categories
  ///
  /// 
  Future<List<MemberCategoryState>> apiV1CategoryHistoryGet({ int page, int pageSize, String orderByDate }) async {
    Response response = await apiV1CategoryHistoryGetWithHttpInfo( page: page, pageSize: pageSize, orderByDate: orderByDate );
    if(response.statusCode >= 400) {
      throw ApiException(response.statusCode, _decodeBodyBytes(response));
    } else if(response.body != null) {
      return (apiClient.deserialize(_decodeBodyBytes(response), 'List<MemberCategoryState>') as List).map((item) => item as MemberCategoryState).toList();
    } else {
      return null;
    }
  }

  /// Gets resource of type of given id with HTTP info returned
  ///
  /// 
  Future<Response> apiV1CategoryIdGetWithHttpInfo(int id) async {
    Object postBody;

    // verify required params are set
    if(id == null) {
     throw ApiException(400, "Missing required param: id");
    }

    // create path and map variables
    String path = "/api/v1/Category/{id}".replaceAll("{format}","json").replaceAll("{" + "id" + "}", id.toString());

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
  Future<Category> apiV1CategoryIdGet(int id) async {
    Response response = await apiV1CategoryIdGetWithHttpInfo(id);
    if(response.statusCode >= 400) {
      throw ApiException(response.statusCode, _decodeBodyBytes(response));
    } else if(response.body != null) {
      return apiClient.deserialize(_decodeBodyBytes(response), 'Category') as Category;
    } else {
      return null;
    }
  }

  /// Gets state history of category with given id with HTTP info returned
  ///
  /// 
  Future<Response> apiV1CategoryIdHistoryGetWithHttpInfo(int id, { int page, int pageSize, String orderByDate }) async {
    Object postBody;

    // verify required params are set
    if(id == null) {
     throw ApiException(400, "Missing required param: id");
    }

    // create path and map variables
    String path = "/api/v1/Category/{id}/history".replaceAll("{format}","json").replaceAll("{" + "id" + "}", id.toString());

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

  /// Gets state history of category with given id
  ///
  /// 
  Future<List<MemberCategoryState>> apiV1CategoryIdHistoryGet(int id, { int page, int pageSize, String orderByDate }) async {
    Response response = await apiV1CategoryIdHistoryGetWithHttpInfo(id,  page: page, pageSize: pageSize, orderByDate: orderByDate );
    if(response.statusCode >= 400) {
      throw ApiException(response.statusCode, _decodeBodyBytes(response));
    } else if(response.body != null) {
      return (apiClient.deserialize(_decodeBodyBytes(response), 'List<MemberCategoryState>') as List).map((item) => item as MemberCategoryState).toList();
    } else {
      return null;
    }
  }

  /// Gets paged resources of type of given ids with HTTP info returned
  ///
  /// 
  Future<Response> apiV1CategoryPostWithHttpInfo({ int page, int pageSize, String orderByDate, List<int> requestBody }) async {
    Object postBody = requestBody;

    // verify required params are set

    // create path and map variables
    String path = "/api/v1/Category".replaceAll("{format}","json");

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
  Future<List<Category>> apiV1CategoryPost({ int page, int pageSize, String orderByDate, List<int> requestBody }) async {
    Response response = await apiV1CategoryPostWithHttpInfo( page: page, pageSize: pageSize, orderByDate: orderByDate, requestBody: requestBody );
    if(response.statusCode >= 400) {
      throw ApiException(response.statusCode, _decodeBodyBytes(response));
    } else if(response.body != null) {
      return (apiClient.deserialize(_decodeBodyBytes(response), 'List<Category>') as List).map((item) => item as Category).toList();
    } else {
      return null;
    }
  }

  /// Searches categories by query with HTTP info returned
  ///
  /// 
  Future<Response> apiV1CategorySearchPostWithHttpInfo(String body, { int page, int pageSize, String orderByDate }) async {
    Object postBody = body;

    // verify required params are set
    if(body == null) {
     throw ApiException(400, "Missing required param: body");
    }

    // create path and map variables
    String path = "/api/v1/Category/search".replaceAll("{format}","json");

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

  /// Searches categories by query
  ///
  /// 
  Future<List<Category>> apiV1CategorySearchPost(String body, { int page, int pageSize, String orderByDate }) async {
    Response response = await apiV1CategorySearchPostWithHttpInfo(body,  page: page, pageSize: pageSize, orderByDate: orderByDate );
    if(response.statusCode >= 400) {
      throw ApiException(response.statusCode, _decodeBodyBytes(response));
    } else if(response.body != null) {
      return (apiClient.deserialize(_decodeBodyBytes(response), 'List<Category>') as List).map((item) => item as Category).toList();
    } else {
      return null;
    }
  }

}
