part of api.api;



class HelperApi {
  final ApiClient apiClient;

  HelperApi([ApiClient apiClient]) : apiClient = apiClient ?? defaultApiClient;

  /// Gets list of cultures with HTTP info returned
  ///
  /// 
  Future<Response> apiV1HelperCulturePostWithHttpInfo() async {
    Object postBody;

    // verify required params are set

    // create path and map variables
    String path = "/api/v1/Helper/culture".replaceAll("{format}","json");

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
                                             'POST',
                                             queryParams,
                                             postBody,
                                             headerParams,
                                             formParams,
                                             nullableContentType,
                                             authNames);
    return response;
  }

  /// Gets list of cultures
  ///
  /// 
  Future<List<Culture>> apiV1HelperCulturePost() async {
    Response response = await apiV1HelperCulturePostWithHttpInfo();
    if(response.statusCode >= 400) {
      throw ApiException(response.statusCode, _decodeBodyBytes(response));
    } else if(response.body != null) {
      return (apiClient.deserialize(_decodeBodyBytes(response), 'List<Culture>') as List).map((item) => item as Culture).toList();
    } else {
      return null;
    }
  }

  /// Gets list of genders with HTTP info returned
  ///
  /// 
  Future<Response> apiV1HelperGenderPostWithHttpInfo({ String culture }) async {
    Object postBody;

    // verify required params are set

    // create path and map variables
    String path = "/api/v1/Helper/gender".replaceAll("{format}","json");

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};
    headerParams["culture"] = culture;

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
                                             'POST',
                                             queryParams,
                                             postBody,
                                             headerParams,
                                             formParams,
                                             nullableContentType,
                                             authNames);
    return response;
  }

  /// Gets list of genders
  ///
  /// 
  Future<List<Gender>> apiV1HelperGenderPost({ String culture }) async {
    Response response = await apiV1HelperGenderPostWithHttpInfo( culture: culture );
    if(response.statusCode >= 400) {
      throw ApiException(response.statusCode, _decodeBodyBytes(response));
    } else if(response.body != null) {
      return (apiClient.deserialize(_decodeBodyBytes(response), 'List<Gender>') as List).map((item) => item as Gender).toList();
    } else {
      return null;
    }
  }

}
