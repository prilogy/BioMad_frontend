part of api.api;



class SocialAccountApi {
  final ApiClient apiClient;

  SocialAccountApi([ApiClient apiClient]) : apiClient = apiClient ?? defaultApiClient;

  /// Gets social providers list with HTTP info returned
  ///
  /// 
  Future<Response> apiV1SocialAccountProviderGetWithHttpInfo() async {
    Object postBody;

    // verify required params are set

    // create path and map variables
    String path = "/api/v1/SocialAccount/provider".replaceAll("{format}","json");

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

  /// Gets social providers list
  ///
  /// 
  Future<List<SocialAccountProvider>> apiV1SocialAccountProviderGet() async {
    Response response = await apiV1SocialAccountProviderGetWithHttpInfo();
    if(response.statusCode >= 400) {
      throw ApiException(response.statusCode, _decodeBodyBytes(response));
    } else if(response.body != null) {
      return (apiClient.deserialize(_decodeBodyBytes(response), 'List<SocialAccountProvider>') as List).map((item) => item as SocialAccountProvider).toList();
    } else {
      return null;
    }
  }

  /// Removes social account from current user with HTTP info returned
  ///
  /// 
  Future apiV1SocialAccountTypeDeleteWithHttpInfo(String type) async {
    Object postBody;

    // verify required params are set
    if(type == null) {
     throw ApiException(400, "Missing required param: type");
    }

    // create path and map variables
    String path = "/api/v1/SocialAccount/{type}".replaceAll("{format}","json").replaceAll("{" + "type" + "}", type.toString());

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

  /// Removes social account from current user
  ///
  /// 
  Future apiV1SocialAccountTypeDelete(String type) async {
    Response response = await apiV1SocialAccountTypeDeleteWithHttpInfo(type);
    if(response.statusCode >= 400) {
      throw ApiException(response.statusCode, _decodeBodyBytes(response));
    } else if(response.body != null) {
    } else {
      return;
    }
  }

  /// Adds social account to current user with HTTP info returned
  ///
  /// 
  Future apiV1SocialAccountTypePostWithHttpInfo(String type, TokenModel tokenModel) async {
    Object postBody = tokenModel;

    // verify required params are set
    if(type == null) {
     throw ApiException(400, "Missing required param: type");
    }
    if(tokenModel == null) {
     throw ApiException(400, "Missing required param: tokenModel");
    }

    // create path and map variables
    String path = "/api/v1/SocialAccount/{type}".replaceAll("{format}","json").replaceAll("{" + "type" + "}", type.toString());

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

  /// Adds social account to current user
  ///
  /// 
  Future apiV1SocialAccountTypePost(String type, TokenModel tokenModel) async {
    Response response = await apiV1SocialAccountTypePostWithHttpInfo(type, tokenModel);
    if(response.statusCode >= 400) {
      throw ApiException(response.statusCode, _decodeBodyBytes(response));
    } else if(response.body != null) {
    } else {
      return;
    }
  }

}
