# api.api.MemberApi

## Load the API package
```dart
import 'package:api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiV1MemberIdDelete**](MemberApi.md#apiV1MemberIdDelete) | **DELETE** /api/v1/Member/{id} | Removes member out of user
[**apiV1MemberIdPatch**](MemberApi.md#apiV1MemberIdPatch) | **PATCH** /api/v1/Member/{id} | Edits data of member
[**apiV1MemberPost**](MemberApi.md#apiV1MemberPost) | **POST** /api/v1/Member | Adds new member to user


# **apiV1MemberIdDelete**
> apiV1MemberIdDelete(id)

Removes member out of user

### Example 
```dart
import 'package:api/api.dart';
// TODO Configure HTTP Bearer authorization: bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearer').setAccessToken(yourTokenGeneratorFunction);

var api_instance = MemberApi();
var id = 56; // int | Id of member to remove from user

try { 
    api_instance.apiV1MemberIdDelete(id);
} catch (e) {
    print("Exception when calling MemberApi->apiV1MemberIdDelete: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| Id of member to remove from user | [default to null]

### Return type

void (empty response body)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1MemberIdPatch**
> apiV1MemberIdPatch(id, memberModel)

Edits data of member

### Example 
```dart
import 'package:api/api.dart';
// TODO Configure HTTP Bearer authorization: bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearer').setAccessToken(yourTokenGeneratorFunction);

var api_instance = MemberApi();
var id = 56; // int | Id of member to edit
var memberModel = MemberModel(); // MemberModel | Model with new data

try { 
    api_instance.apiV1MemberIdPatch(id, memberModel);
} catch (e) {
    print("Exception when calling MemberApi->apiV1MemberIdPatch: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| Id of member to edit | [default to null]
 **memberModel** | [**MemberModel**](MemberModel.md)| Model with new data | [optional] 

### Return type

void (empty response body)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/_*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1MemberPost**
> apiV1MemberPost(memberModel)

Adds new member to user

### Example 
```dart
import 'package:api/api.dart';
// TODO Configure HTTP Bearer authorization: bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearer').setAccessToken(yourTokenGeneratorFunction);

var api_instance = MemberApi();
var memberModel = MemberModel(); // MemberModel | 

try { 
    api_instance.apiV1MemberPost(memberModel);
} catch (e) {
    print("Exception when calling MemberApi->apiV1MemberPost: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **memberModel** | [**MemberModel**](MemberModel.md)|  | [optional] 

### Return type

void (empty response body)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/_*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

