# api.api.SocialAccountApi

## Load the API package
```dart
import 'package:api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiV1SocialAccountProviderGet**](SocialAccountApi.md#apiV1SocialAccountProviderGet) | **GET** /api/v1/SocialAccount/provider | Gets social providers list
[**apiV1SocialAccountTypeDelete**](SocialAccountApi.md#apiV1SocialAccountTypeDelete) | **DELETE** /api/v1/SocialAccount/{type} | Removes social account from current user
[**apiV1SocialAccountTypePost**](SocialAccountApi.md#apiV1SocialAccountTypePost) | **POST** /api/v1/SocialAccount/{type} | Adds social account to current user


# **apiV1SocialAccountProviderGet**
> List<SocialAccountProvider> apiV1SocialAccountProviderGet()

Gets social providers list

### Example 
```dart
import 'package:api/api.dart';
// TODO Configure HTTP Bearer authorization: bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearer').setAccessToken(yourTokenGeneratorFunction);

var api_instance = SocialAccountApi();

try { 
    var result = api_instance.apiV1SocialAccountProviderGet();
    print(result);
} catch (e) {
    print("Exception when calling SocialAccountApi->apiV1SocialAccountProviderGet: $e\n");
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**List<SocialAccountProvider>**](SocialAccountProvider.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1SocialAccountTypeDelete**
> apiV1SocialAccountTypeDelete(type)

Removes social account from current user

### Example 
```dart
import 'package:api/api.dart';
// TODO Configure HTTP Bearer authorization: bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearer').setAccessToken(yourTokenGeneratorFunction);

var api_instance = SocialAccountApi();
var type = type_example; // String | Social provider name to delete

try { 
    api_instance.apiV1SocialAccountTypeDelete(type);
} catch (e) {
    print("Exception when calling SocialAccountApi->apiV1SocialAccountTypeDelete: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **type** | **String**| Social provider name to delete | [default to null]

### Return type

void (empty response body)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1SocialAccountTypePost**
> apiV1SocialAccountTypePost(token, type)

Adds social account to current user

### Example 
```dart
import 'package:api/api.dart';
// TODO Configure HTTP Bearer authorization: bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearer').setAccessToken(yourTokenGeneratorFunction);

var api_instance = SocialAccountApi();
var token = token_example; // String | Token of social provider account
var type = type_example; // String | Social provider name

try { 
    api_instance.apiV1SocialAccountTypePost(token, type);
} catch (e) {
    print("Exception when calling SocialAccountApi->apiV1SocialAccountTypePost: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **token** | **String**| Token of social provider account | [default to null]
 **type** | **String**| Social provider name | [default to null]

### Return type

void (empty response body)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

