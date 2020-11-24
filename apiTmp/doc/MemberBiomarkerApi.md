# api.api.MemberBiomarkerApi

## Load the API package
```dart
import 'package:api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiV1MemberBiomarkerAddPost**](MemberBiomarkerApi.md#apiV1MemberBiomarkerAddPost) | **POST** /api/v1/member/biomarker/add | Adds new member biomarker
[**apiV1MemberBiomarkerGet**](MemberBiomarkerApi.md#apiV1MemberBiomarkerGet) | **GET** /api/v1/member/biomarker | Gets paged resources of type
[**apiV1MemberBiomarkerIdDelete**](MemberBiomarkerApi.md#apiV1MemberBiomarkerIdDelete) | **DELETE** /api/v1/member/biomarker/{id} | Deletes member&#39;s biomarker of given id
[**apiV1MemberBiomarkerIdGet**](MemberBiomarkerApi.md#apiV1MemberBiomarkerIdGet) | **GET** /api/v1/member/biomarker/{id} | Gets resource of type of given id
[**apiV1MemberBiomarkerIdPatch**](MemberBiomarkerApi.md#apiV1MemberBiomarkerIdPatch) | **PATCH** /api/v1/member/biomarker/{id} | Edits member&#39;s biomarker of given id
[**apiV1MemberBiomarkerPost**](MemberBiomarkerApi.md#apiV1MemberBiomarkerPost) | **POST** /api/v1/member/biomarker | Gets paged resources of type of given ids


# **apiV1MemberBiomarkerAddPost**
> int apiV1MemberBiomarkerAddPost(memberBiomarkerModel)

Adds new member biomarker

### Example 
```dart
import 'package:api/api.dart';
// TODO Configure HTTP Bearer authorization: bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearer').setAccessToken(yourTokenGeneratorFunction);

var api_instance = MemberBiomarkerApi();
var memberBiomarkerModel = MemberBiomarkerModel(); // MemberBiomarkerModel | Model of biomarker

try { 
    var result = api_instance.apiV1MemberBiomarkerAddPost(memberBiomarkerModel);
    print(result);
} catch (e) {
    print("Exception when calling MemberBiomarkerApi->apiV1MemberBiomarkerAddPost: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **memberBiomarkerModel** | [**MemberBiomarkerModel**](MemberBiomarkerModel.md)| Model of biomarker | 

### Return type

**int**

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/_*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1MemberBiomarkerGet**
> List<MemberBiomarker> apiV1MemberBiomarkerGet(page, pageSize, orderByDate)

Gets paged resources of type

### Example 
```dart
import 'package:api/api.dart';
// TODO Configure HTTP Bearer authorization: bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearer').setAccessToken(yourTokenGeneratorFunction);

var api_instance = MemberBiomarkerApi();
var page = 56; // int | Number of page to get(starts from 1)
var pageSize = 56; // int | Number of objects on one page
var orderByDate = orderByDate_example; // String | Order by date(asc|desc)

try { 
    var result = api_instance.apiV1MemberBiomarkerGet(page, pageSize, orderByDate);
    print(result);
} catch (e) {
    print("Exception when calling MemberBiomarkerApi->apiV1MemberBiomarkerGet: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**| Number of page to get(starts from 1) | [optional] [default to null]
 **pageSize** | **int**| Number of objects on one page | [optional] [default to null]
 **orderByDate** | **String**| Order by date(asc|desc) | [optional] [default to null]

### Return type

[**List<MemberBiomarker>**](MemberBiomarker.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1MemberBiomarkerIdDelete**
> apiV1MemberBiomarkerIdDelete(id)

Deletes member's biomarker of given id

### Example 
```dart
import 'package:api/api.dart';
// TODO Configure HTTP Bearer authorization: bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearer').setAccessToken(yourTokenGeneratorFunction);

var api_instance = MemberBiomarkerApi();
var id = 56; // int | Id of biomarker

try { 
    api_instance.apiV1MemberBiomarkerIdDelete(id);
} catch (e) {
    print("Exception when calling MemberBiomarkerApi->apiV1MemberBiomarkerIdDelete: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| Id of biomarker | [default to null]

### Return type

void (empty response body)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1MemberBiomarkerIdGet**
> MemberBiomarker apiV1MemberBiomarkerIdGet(id)

Gets resource of type of given id

### Example 
```dart
import 'package:api/api.dart';
// TODO Configure HTTP Bearer authorization: bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearer').setAccessToken(yourTokenGeneratorFunction);

var api_instance = MemberBiomarkerApi();
var id = 56; // int | Number of page to get(starts from 1)

try { 
    var result = api_instance.apiV1MemberBiomarkerIdGet(id);
    print(result);
} catch (e) {
    print("Exception when calling MemberBiomarkerApi->apiV1MemberBiomarkerIdGet: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| Number of page to get(starts from 1) | [default to null]

### Return type

[**MemberBiomarker**](MemberBiomarker.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1MemberBiomarkerIdPatch**
> MemberBiomarker apiV1MemberBiomarkerIdPatch(id, memberBiomarkerModel)

Edits member's biomarker of given id

\"AnalysisId\" is ignored

### Example 
```dart
import 'package:api/api.dart';
// TODO Configure HTTP Bearer authorization: bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearer').setAccessToken(yourTokenGeneratorFunction);

var api_instance = MemberBiomarkerApi();
var id = 56; // int | Id of biomarker
var memberBiomarkerModel = MemberBiomarkerModel(); // MemberBiomarkerModel | New data

try { 
    var result = api_instance.apiV1MemberBiomarkerIdPatch(id, memberBiomarkerModel);
    print(result);
} catch (e) {
    print("Exception when calling MemberBiomarkerApi->apiV1MemberBiomarkerIdPatch: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| Id of biomarker | [default to null]
 **memberBiomarkerModel** | [**MemberBiomarkerModel**](MemberBiomarkerModel.md)| New data | 

### Return type

[**MemberBiomarker**](MemberBiomarker.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/_*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1MemberBiomarkerPost**
> List<MemberBiomarker> apiV1MemberBiomarkerPost(page, pageSize, orderByDate, requestBody)

Gets paged resources of type of given ids

### Example 
```dart
import 'package:api/api.dart';
// TODO Configure HTTP Bearer authorization: bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearer').setAccessToken(yourTokenGeneratorFunction);

var api_instance = MemberBiomarkerApi();
var page = 56; // int | Number of page to get(starts from 1)
var pageSize = 56; // int | Number of objects on one page
var orderByDate = orderByDate_example; // String | Order by date(asc|desc)
var requestBody = [List&lt;int&gt;()]; // List<int> | Ids of resources to get

try { 
    var result = api_instance.apiV1MemberBiomarkerPost(page, pageSize, orderByDate, requestBody);
    print(result);
} catch (e) {
    print("Exception when calling MemberBiomarkerApi->apiV1MemberBiomarkerPost: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**| Number of page to get(starts from 1) | [optional] [default to null]
 **pageSize** | **int**| Number of objects on one page | [optional] [default to null]
 **orderByDate** | **String**| Order by date(asc|desc) | [optional] [default to null]
 **requestBody** | [**List&lt;int&gt;**](int.md)| Ids of resources to get | [optional] 

### Return type

[**List<MemberBiomarker>**](MemberBiomarker.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/_*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

