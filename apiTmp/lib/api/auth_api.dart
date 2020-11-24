part of api.api;



class AuthApi {
  final ApiClient apiClient;

  AuthApi([ApiClient apiClient]) : apiClient = apiClient ?? defaultApiClient;

  /// Logs in user with given credentials with HTTP info returned
  ///
  /// 
  Future<Response> apiV1AuthLogInPostWithHttpInfo({ String culture, LogInWithCredentialsModel logInWithCredentialsModel }) async {
    Object postBody = logInWithCredentialsModel;

    // verify required params are set

    // create path and map variables
    String path = "/api/v1/Auth/logIn".replaceAll("{format}","json");

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};
    headerParams["culture"] = culture;

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

  /// Logs in user with given credentials
  ///
  /// 
  Future<AuthenticationResult> apiV1AuthLogInPost({ String culture, LogInWithCredentialsModel logInWithCredentialsModel }) async {
    Response response = await apiV1AuthLogInPostWithHttpInfo( culture: culture, logInWithCredentialsModel: logInWithCredentialsModel );
    if(response.statusCode >= 400) {
      throw ApiException(response.statusCode, _decodeBodyBytes(response));
    } else if(response.body != null) {
      return apiClient.deserialize(_decodeBodyBytes(response), 'AuthenticationResult') as AuthenticationResult;
    } else {
      return null;
    }
  }

  /// Logs in user by its social account with HTTP info returned
  ///
  /// 
  Future<Response> apiV1AuthLogInTypePostWithHttpInfo(String type, TokenModel tokenModel, { String culture }) async {
    Object postBody = tokenModel;

    // verify required params are set
    if(type == null) {
     throw ApiException(400, "Missing required param: type");
    }
    if(tokenModel == null) {
     throw ApiException(400, "Missing required param: tokenModel");
    }

    // create path and map variables
    String path = "/api/v1/Auth/logIn/{type}".replaceAll("{format}","json").replaceAll("{" + "type" + "}", type.toString());

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};
    headerParams["culture"] = culture;

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

  /// Logs in user by its social account
  ///
  /// 
  Future<AuthenticationResult> apiV1AuthLogInTypePost(String type, TokenModel tokenModel, { String culture }) async {
    Response response = await apiV1AuthLogInTypePostWithHttpInfo(type, tokenModel,  culture: culture );
    if(response.statusCode >= 400) {
      throw ApiException(response.statusCode, _decodeBodyBytes(response));
    } else if(response.body != null) {
      return apiClient.deserialize(_decodeBodyBytes(response), 'AuthenticationResult') as AuthenticationResult;
    } else {
      return null;
    }
  }

  /// Authenticates user with model contains refresh token;  Revokes given refresh token and provides with new with HTTP info returned
  ///
  /// 
  Future<Response> apiV1AuthRefreshTokenPostWithHttpInfo({ String culture, RefreshTokenAuthenticationModel refreshTokenAuthenticationModel }) async {
    Object postBody = refreshTokenAuthenticationModel;

    // verify required params are set

    // create path and map variables
    String path = "/api/v1/Auth/refreshToken".replaceAll("{format}","json");

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};
    headerParams["culture"] = culture;

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

  /// Authenticates user with model contains refresh token;  Revokes given refresh token and provides with new
  ///
  /// 
  Future<AuthenticationResult> apiV1AuthRefreshTokenPost({ String culture, RefreshTokenAuthenticationModel refreshTokenAuthenticationModel }) async {
    Response response = await apiV1AuthRefreshTokenPostWithHttpInfo( culture: culture, refreshTokenAuthenticationModel: refreshTokenAuthenticationModel );
    if(response.statusCode >= 400) {
      throw ApiException(response.statusCode, _decodeBodyBytes(response));
    } else if(response.body != null) {
      return apiClient.deserialize(_decodeBodyBytes(response), 'AuthenticationResult') as AuthenticationResult;
    } else {
      return null;
    }
  }

  /// Signs up new user with HTTP info returned
  ///
  /// 
  Future apiV1AuthSignUpPostWithHttpInfo({ SignUpModel signUpModel }) async {
    Object postBody = signUpModel;

    // verify required params are set

    // create path and map variables
    String path = "/api/v1/Auth/signUp".replaceAll("{format}","json");

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

  /// Signs up new user
  ///
  /// 
  Future apiV1AuthSignUpPost({ SignUpModel signUpModel }) async {
    Response response = await apiV1AuthSignUpPostWithHttpInfo( signUpModel: signUpModel );
    if(response.statusCode >= 400) {
      throw ApiException(response.statusCode, _decodeBodyBytes(response));
    } else if(response.body != null) {
    } else {
      return;
    }
  }

  /// Gets social provider identity to provide data for auth flow with HTTP info returned
  ///
  /// 
  Future<Response> apiV1AuthSignUpTypeIdentityPostWithHttpInfo(String type, TokenModel tokenModel) async {
    Object postBody = tokenModel;

    // verify required params are set
    if(type == null) {
     throw ApiException(400, "Missing required param: type");
    }
    if(tokenModel == null) {
     throw ApiException(400, "Missing required param: tokenModel");
    }

    // create path and map variables
    String path = "/api/v1/Auth/signUp/{type}/identity".replaceAll("{format}","json").replaceAll("{" + "type" + "}", type.toString());

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

  /// Gets social provider identity to provide data for auth flow
  ///
  /// 
  Future<SocialAuthenticationIdentity> apiV1AuthSignUpTypeIdentityPost(String type, TokenModel tokenModel) async {
    Response response = await apiV1AuthSignUpTypeIdentityPostWithHttpInfo(type, tokenModel);
    if(response.statusCode >= 400) {
      throw ApiException(response.statusCode, _decodeBodyBytes(response));
    } else if(response.body != null) {
      return apiClient.deserialize(_decodeBodyBytes(response), 'SocialAuthenticationIdentity') as SocialAuthenticationIdentity;
    } else {
      return null;
    }
  }

  /// Signs up new user with connected social account with HTTP info returned
  ///
  /// 
  Future apiV1AuthSignUpTypePostWithHttpInfo(String type, SignUpWithSocialAccountModel signUpWithSocialAccountModel) async {
    Object postBody = signUpWithSocialAccountModel;

    // verify required params are set
    if(type == null) {
     throw ApiException(400, "Missing required param: type");
    }
    if(signUpWithSocialAccountModel == null) {
     throw ApiException(400, "Missing required param: signUpWithSocialAccountModel");
    }

    // create path and map variables
    String path = "/api/v1/Auth/signUp/{type}".replaceAll("{format}","json").replaceAll("{" + "type" + "}", type.toString());

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

  /// Signs up new user with connected social account
  ///
  /// 
  Future apiV1AuthSignUpTypePost(String type, SignUpWithSocialAccountModel signUpWithSocialAccountModel) async {
    Response response = await apiV1AuthSignUpTypePostWithHttpInfo(type, signUpWithSocialAccountModel);
    if(response.statusCode >= 400) {
      throw ApiException(response.statusCode, _decodeBodyBytes(response));
    } else if(response.body != null) {
    } else {
      return;
    }
  }

}
