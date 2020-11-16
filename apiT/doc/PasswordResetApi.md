# api.api.PasswordResetApi

## Load the API package
```dart
import 'package:api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiV1PasswordResetGet**](PasswordResetApi.md#apiV1PasswordResetGet) | **GET** /api/v1/PasswordReset | Sends confirmation email to user with given email
[**apiV1PasswordResetPatch**](PasswordResetApi.md#apiV1PasswordResetPatch) | **PATCH** /api/v1/PasswordReset | Resets password of user
[**apiV1PasswordResetVerifyGet**](PasswordResetApi.md#apiV1PasswordResetVerifyGet) | **GET** /api/v1/PasswordReset/verify | Verifies code for password reset flow


# **apiV1PasswordResetGet**
> apiV1PasswordResetGet(email)

Sends confirmation email to user with given email

### Example 
```dart
import 'package:api/api.dart';
// TODO Configure HTTP Bearer authorization: bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearer').setAccessToken(yourTokenGeneratorFunction);

var api_instance = PasswordResetApi();
var email = email_example; // String | Email of user that want to reset password

try { 
    api_instance.apiV1PasswordResetGet(email);
} catch (e) {
    print("Exception when calling PasswordResetApi->apiV1PasswordResetGet: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **email** | **String**| Email of user that want to reset password | [default to null]

### Return type

void (empty response body)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1PasswordResetPatch**
> apiV1PasswordResetPatch(passwordResetModel)

Resets password of user

### Example 
```dart
import 'package:api/api.dart';
// TODO Configure HTTP Bearer authorization: bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearer').setAccessToken(yourTokenGeneratorFunction);

var api_instance = PasswordResetApi();
var passwordResetModel = PasswordResetModel(); // PasswordResetModel | Model contains code and new password

try { 
    api_instance.apiV1PasswordResetPatch(passwordResetModel);
} catch (e) {
    print("Exception when calling PasswordResetApi->apiV1PasswordResetPatch: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **passwordResetModel** | [**PasswordResetModel**](PasswordResetModel.md)| Model contains code and new password | 

### Return type

void (empty response body)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/_*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1PasswordResetVerifyGet**
> apiV1PasswordResetVerifyGet(code)

Verifies code for password reset flow

### Example 
```dart
import 'package:api/api.dart';
// TODO Configure HTTP Bearer authorization: bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearer').setAccessToken(yourTokenGeneratorFunction);

var api_instance = PasswordResetApi();
var code = code_example; // String | 

try { 
    api_instance.apiV1PasswordResetVerifyGet(code);
} catch (e) {
    print("Exception when calling PasswordResetApi->apiV1PasswordResetVerifyGet: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **code** | **String**|  | [default to null]

### Return type

void (empty response body)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

