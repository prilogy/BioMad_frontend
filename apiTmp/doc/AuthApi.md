# api.api.AuthApi

## Load the API package
```dart
import 'package:api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiV1AuthLogInPost**](AuthApi.md#apiV1AuthLogInPost) | **POST** /api/v1/Auth/logIn | Logs in user with given credentials
[**apiV1AuthLogInTypePost**](AuthApi.md#apiV1AuthLogInTypePost) | **POST** /api/v1/Auth/logIn/{type} | Logs in user by its social account
[**apiV1AuthRefreshTokenPost**](AuthApi.md#apiV1AuthRefreshTokenPost) | **POST** /api/v1/Auth/refreshToken | Authenticates user with model contains refresh token;  Revokes given refresh token and provides with new
[**apiV1AuthSignUpPost**](AuthApi.md#apiV1AuthSignUpPost) | **POST** /api/v1/Auth/signUp | Signs up new user
[**apiV1AuthSignUpTypeIdentityPost**](AuthApi.md#apiV1AuthSignUpTypeIdentityPost) | **POST** /api/v1/Auth/signUp/{type}/identity | Gets social provider identity to provide data for auth flow
[**apiV1AuthSignUpTypePost**](AuthApi.md#apiV1AuthSignUpTypePost) | **POST** /api/v1/Auth/signUp/{type} | Signs up new user with connected social account


# **apiV1AuthLogInPost**
> AuthenticationResult apiV1AuthLogInPost(culture, logInWithCredentialsModel)

Logs in user with given credentials

### Example 
```dart
import 'package:api/api.dart';
// TODO Configure HTTP Bearer authorization: bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearer').setAccessToken(yourTokenGeneratorFunction);

var api_instance = AuthApi();
var culture = culture_example; // String | Header represents current culture
var logInWithCredentialsModel = LogInWithCredentialsModel(); // LogInWithCredentialsModel | 

try { 
    var result = api_instance.apiV1AuthLogInPost(culture, logInWithCredentialsModel);
    print(result);
} catch (e) {
    print("Exception when calling AuthApi->apiV1AuthLogInPost: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **culture** | **String**| Header represents current culture | [optional] [default to null]
 **logInWithCredentialsModel** | [**LogInWithCredentialsModel**](LogInWithCredentialsModel.md)|  | [optional] 

### Return type

[**AuthenticationResult**](AuthenticationResult.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/_*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1AuthLogInTypePost**
> AuthenticationResult apiV1AuthLogInTypePost(type, tokenModel, culture)

Logs in user by its social account

### Example 
```dart
import 'package:api/api.dart';
// TODO Configure HTTP Bearer authorization: bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearer').setAccessToken(yourTokenGeneratorFunction);

var api_instance = AuthApi();
var type = type_example; // String | Name of social provider
var tokenModel = TokenModel(); // TokenModel | Model contains token of social provider identity
var culture = culture_example; // String | Header represents current culture

try { 
    var result = api_instance.apiV1AuthLogInTypePost(type, tokenModel, culture);
    print(result);
} catch (e) {
    print("Exception when calling AuthApi->apiV1AuthLogInTypePost: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **type** | **String**| Name of social provider | [default to null]
 **tokenModel** | [**TokenModel**](TokenModel.md)| Model contains token of social provider identity | 
 **culture** | **String**| Header represents current culture | [optional] [default to null]

### Return type

[**AuthenticationResult**](AuthenticationResult.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/_*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1AuthRefreshTokenPost**
> AuthenticationResult apiV1AuthRefreshTokenPost(culture, refreshTokenAuthenticationModel)

Authenticates user with model contains refresh token;  Revokes given refresh token and provides with new

### Example 
```dart
import 'package:api/api.dart';
// TODO Configure HTTP Bearer authorization: bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearer').setAccessToken(yourTokenGeneratorFunction);

var api_instance = AuthApi();
var culture = culture_example; // String | Header represents current culture
var refreshTokenAuthenticationModel = RefreshTokenAuthenticationModel(); // RefreshTokenAuthenticationModel | 

try { 
    var result = api_instance.apiV1AuthRefreshTokenPost(culture, refreshTokenAuthenticationModel);
    print(result);
} catch (e) {
    print("Exception when calling AuthApi->apiV1AuthRefreshTokenPost: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **culture** | **String**| Header represents current culture | [optional] [default to null]
 **refreshTokenAuthenticationModel** | [**RefreshTokenAuthenticationModel**](RefreshTokenAuthenticationModel.md)|  | [optional] 

### Return type

[**AuthenticationResult**](AuthenticationResult.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/_*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1AuthSignUpPost**
> apiV1AuthSignUpPost(signUpModel)

Signs up new user

### Example 
```dart
import 'package:api/api.dart';
// TODO Configure HTTP Bearer authorization: bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearer').setAccessToken(yourTokenGeneratorFunction);

var api_instance = AuthApi();
var signUpModel = SignUpModel(); // SignUpModel | 

try { 
    api_instance.apiV1AuthSignUpPost(signUpModel);
} catch (e) {
    print("Exception when calling AuthApi->apiV1AuthSignUpPost: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **signUpModel** | [**SignUpModel**](SignUpModel.md)|  | [optional] 

### Return type

void (empty response body)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/_*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1AuthSignUpTypeIdentityPost**
> SocialAuthenticationIdentity apiV1AuthSignUpTypeIdentityPost(type, tokenModel)

Gets social provider identity to provide data for auth flow

### Example 
```dart
import 'package:api/api.dart';
// TODO Configure HTTP Bearer authorization: bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearer').setAccessToken(yourTokenGeneratorFunction);

var api_instance = AuthApi();
var type = type_example; // String | Name of social provider
var tokenModel = TokenModel(); // TokenModel | Model contains token of social account identity

try { 
    var result = api_instance.apiV1AuthSignUpTypeIdentityPost(type, tokenModel);
    print(result);
} catch (e) {
    print("Exception when calling AuthApi->apiV1AuthSignUpTypeIdentityPost: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **type** | **String**| Name of social provider | [default to null]
 **tokenModel** | [**TokenModel**](TokenModel.md)| Model contains token of social account identity | 

### Return type

[**SocialAuthenticationIdentity**](SocialAuthenticationIdentity.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/_*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1AuthSignUpTypePost**
> apiV1AuthSignUpTypePost(type, signUpWithSocialAccountModel)

Signs up new user with connected social account

### Example 
```dart
import 'package:api/api.dart';
// TODO Configure HTTP Bearer authorization: bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearer').setAccessToken(yourTokenGeneratorFunction);

var api_instance = AuthApi();
var type = type_example; // String | Name of social provider
var signUpWithSocialAccountModel = SignUpWithSocialAccountModel(); // SignUpWithSocialAccountModel | Data for User's sign up

try { 
    api_instance.apiV1AuthSignUpTypePost(type, signUpWithSocialAccountModel);
} catch (e) {
    print("Exception when calling AuthApi->apiV1AuthSignUpTypePost: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **type** | **String**| Name of social provider | [default to null]
 **signUpWithSocialAccountModel** | [**SignUpWithSocialAccountModel**](SignUpWithSocialAccountModel.md)| Data for User&#39;s sign up | 

### Return type

void (empty response body)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/_*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

