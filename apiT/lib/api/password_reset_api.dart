part of api.api;



class PasswordResetApi {
  final ApiClient apiClient;

  PasswordResetApi([ApiClient apiClient]) : apiClient = apiClient ?? defaultApiClient;

  /// Sends confirmation email to user with given email with HTTP info returned
  ///
  /// 
  Future apiV1PasswordResetGetWithHttpInfo(String email) async {
    Object postBody;

    // verify required params are set
    if(email == null) {
     throw ApiException(400, "Missing required param: email");
    }

    // create path and map variables
    String path = "/api/v1/PasswordReset".replaceAll("{format}","json");

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};
      queryParams.addAll(_convertParametersForCollectionFormat("", "email", email));

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

  /// Sends confirmation email to user with given email
  ///
  /// 
  Future apiV1PasswordResetGet(String email) async {
    Response response = await apiV1PasswordResetGetWithHttpInfo(email);
    if(response.statusCode >= 400) {
      throw ApiException(response.statusCode, _decodeBodyBytes(response));
    } else if(response.body != null) {
    } else {
      return;
    }
  }

  /// Resets password of user with HTTP info returned
  ///
  /// 
  Future apiV1PasswordResetPatchWithHttpInfo(PasswordResetModel passwordResetModel) async {
    Object postBody = passwordResetModel;

    // verify required params are set
    if(passwordResetModel == null) {
     throw ApiException(400, "Missing required param: passwordResetModel");
    }

    // create path and map variables
    String path = "/api/v1/PasswordReset".replaceAll("{format}","json");

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

  /// Resets password of user
  ///
  /// 
  Future apiV1PasswordResetPatch(PasswordResetModel passwordResetModel) async {
    Response response = await apiV1PasswordResetPatchWithHttpInfo(passwordResetModel);
    if(response.statusCode >= 400) {
      throw ApiException(response.statusCode, _decodeBodyBytes(response));
    } else if(response.body != null) {
    } else {
      return;
    }
  }

  /// Verifies code for password reset flow with HTTP info returned
  ///
  /// 
  Future apiV1PasswordResetVerifyGetWithHttpInfo(String code) async {
    Object postBody;

    // verify required params are set
    if(code == null) {
     throw ApiException(400, "Missing required param: code");
    }

    // create path and map variables
    String path = "/api/v1/PasswordReset/verify".replaceAll("{format}","json");

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};
      queryParams.addAll(_convertParametersForCollectionFormat("", "code", code));

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

  /// Verifies code for password reset flow
  ///
  /// 
  Future apiV1PasswordResetVerifyGet(String code) async {
    Response response = await apiV1PasswordResetVerifyGetWithHttpInfo(code);
    if(response.statusCode >= 400) {
      throw ApiException(response.statusCode, _decodeBodyBytes(response));
    } else if(response.body != null) {
    } else {
      return;
    }
  }

}
