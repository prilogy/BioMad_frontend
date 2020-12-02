# api.api.MemberAnalysisApi

## Load the API package
```dart
import 'package:api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiV1MemberAnalysisAddPost**](MemberAnalysisApi.md#apiV1MemberAnalysisAddPost) | **POST** /api/v1/member/analysis/add | Adds new analysis
[**apiV1MemberAnalysisGet**](MemberAnalysisApi.md#apiV1MemberAnalysisGet) | **GET** /api/v1/member/analysis | Gets paged resources of type
[**apiV1MemberAnalysisIdDelete**](MemberAnalysisApi.md#apiV1MemberAnalysisIdDelete) | **DELETE** /api/v1/member/analysis/{id} | Deletes analysis of given id
[**apiV1MemberAnalysisIdGet**](MemberAnalysisApi.md#apiV1MemberAnalysisIdGet) | **GET** /api/v1/member/analysis/{id} | Gets resource of type of given id
[**apiV1MemberAnalysisIdPatch**](MemberAnalysisApi.md#apiV1MemberAnalysisIdPatch) | **PATCH** /api/v1/member/analysis/{id} | Edits analysis of given id
[**apiV1MemberAnalysisPost**](MemberAnalysisApi.md#apiV1MemberAnalysisPost) | **POST** /api/v1/member/analysis | Gets paged resources of type of given ids


# **apiV1MemberAnalysisAddPost**
> int apiV1MemberAnalysisAddPost(memberAnalysisModel)

Adds new analysis

\"Biomarkers\" property IS required

### Example 
```dart
import 'package:api/api.dart';
// TODO Configure HTTP Bearer authorization: bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearer').setAccessToken(yourTokenGeneratorFunction);

var api_instance = MemberAnalysisApi();
var memberAnalysisModel = MemberAnalysisModel(); // MemberAnalysisModel | Model of analysis

try { 
    var result = api_instance.apiV1MemberAnalysisAddPost(memberAnalysisModel);
    print(result);
} catch (e) {
    print("Exception when calling MemberAnalysisApi->apiV1MemberAnalysisAddPost: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **memberAnalysisModel** | [**MemberAnalysisModel**](MemberAnalysisModel.md)| Model of analysis | 

### Return type

**int**

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/_*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1MemberAnalysisGet**
> List<MemberAnalysis> apiV1MemberAnalysisGet(page, pageSize, orderByDate)

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

var api_instance = MemberAnalysisApi();
var page = 56; // int | Number of page to get(starts from 1)
var pageSize = 56; // int | Number of objects on one page
var orderByDate = orderByDate_example; // String | Order by date(asc|desc)

try { 
    var result = api_instance.apiV1MemberAnalysisGet(page, pageSize, orderByDate);
    print(result);
} catch (e) {
    print("Exception when calling MemberAnalysisApi->apiV1MemberAnalysisGet: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**| Number of page to get(starts from 1) | [optional] [default to null]
 **pageSize** | **int**| Number of objects on one page | [optional] [default to null]
 **orderByDate** | **String**| Order by date(asc|desc) | [optional] [default to null]

### Return type

[**List<MemberAnalysis>**](MemberAnalysis.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1MemberAnalysisIdDelete**
> MemberAnalysis apiV1MemberAnalysisIdDelete(id)

Deletes analysis of given id

### Example 
```dart
import 'package:api/api.dart';
// TODO Configure HTTP Bearer authorization: bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearer').setAccessToken(yourTokenGeneratorFunction);

var api_instance = MemberAnalysisApi();
var id = 56; // int | Id of analysis

try { 
    var result = api_instance.apiV1MemberAnalysisIdDelete(id);
    print(result);
} catch (e) {
    print("Exception when calling MemberAnalysisApi->apiV1MemberAnalysisIdDelete: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| Id of analysis | [default to null]

### Return type

[**MemberAnalysis**](MemberAnalysis.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1MemberAnalysisIdGet**
> MemberAnalysis apiV1MemberAnalysisIdGet(id)

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

var api_instance = MemberAnalysisApi();
var id = 56; // int | Number of page to get(starts from 1)

try { 
    var result = api_instance.apiV1MemberAnalysisIdGet(id);
    print(result);
} catch (e) {
    print("Exception when calling MemberAnalysisApi->apiV1MemberAnalysisIdGet: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| Number of page to get(starts from 1) | [default to null]

### Return type

[**MemberAnalysis**](MemberAnalysis.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1MemberAnalysisIdPatch**
> MemberAnalysis apiV1MemberAnalysisIdPatch(id, memberAnalysisModel)

Edits analysis of given id

\"Biomarkers\" property IS NOT required

### Example 
```dart
import 'package:api/api.dart';
// TODO Configure HTTP Bearer authorization: bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearer').setAccessToken(yourTokenGeneratorFunction);

var api_instance = MemberAnalysisApi();
var id = 56; // int | Id of analysis
var memberAnalysisModel = MemberAnalysisModel(); // MemberAnalysisModel | New data

try { 
    var result = api_instance.apiV1MemberAnalysisIdPatch(id, memberAnalysisModel);
    print(result);
} catch (e) {
    print("Exception when calling MemberAnalysisApi->apiV1MemberAnalysisIdPatch: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| Id of analysis | [default to null]
 **memberAnalysisModel** | [**MemberAnalysisModel**](MemberAnalysisModel.md)| New data | 

### Return type

[**MemberAnalysis**](MemberAnalysis.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/_*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1MemberAnalysisPost**
> List<MemberAnalysis> apiV1MemberAnalysisPost(page, pageSize, orderByDate, requestBody)

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

var api_instance = MemberAnalysisApi();
var page = 56; // int | Number of page to get(starts from 1)
var pageSize = 56; // int | Number of objects on one page
var orderByDate = orderByDate_example; // String | Order by date(asc|desc)
var requestBody = [List&lt;int&gt;()]; // List<int> | Ids of resources to get

try { 
    var result = api_instance.apiV1MemberAnalysisPost(page, pageSize, orderByDate, requestBody);
    print(result);
} catch (e) {
    print("Exception when calling MemberAnalysisApi->apiV1MemberAnalysisPost: $e\n");
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

[**List<MemberAnalysis>**](MemberAnalysis.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/_*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

