# api.api.UnitApi

## Load the API package
```dart
import 'package:api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiV1UnitGet**](UnitApi.md#apiV1UnitGet) | **GET** /api/v1/Unit | Gets paged resources of type
[**apiV1UnitIdGet**](UnitApi.md#apiV1UnitIdGet) | **GET** /api/v1/Unit/{id} | Gets resource of type of given id
[**apiV1UnitPost**](UnitApi.md#apiV1UnitPost) | **POST** /api/v1/Unit | Gets paged resources of type of given ids


# **apiV1UnitGet**
> List<Unit> apiV1UnitGet(page, pageSize, orderByDate)

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

var api_instance = UnitApi();
var page = 56; // int | Number of page to get(starts from 1)
var pageSize = 56; // int | Number of objects on one page
var orderByDate = orderByDate_example; // String | Order by date(asc|desc)

try { 
    var result = api_instance.apiV1UnitGet(page, pageSize, orderByDate);
    print(result);
} catch (e) {
    print("Exception when calling UnitApi->apiV1UnitGet: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**| Number of page to get(starts from 1) | [optional] [default to null]
 **pageSize** | **int**| Number of objects on one page | [optional] [default to null]
 **orderByDate** | **String**| Order by date(asc|desc) | [optional] [default to null]

### Return type

[**List<Unit>**](Unit.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1UnitIdGet**
> Unit apiV1UnitIdGet(id)

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

var api_instance = UnitApi();
var id = 56; // int | Number of page to get(starts from 1)

try { 
    var result = api_instance.apiV1UnitIdGet(id);
    print(result);
} catch (e) {
    print("Exception when calling UnitApi->apiV1UnitIdGet: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| Number of page to get(starts from 1) | [default to null]

### Return type

[**Unit**](Unit.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1UnitPost**
> List<Unit> apiV1UnitPost(page, pageSize, orderByDate, requestBody)

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

var api_instance = UnitApi();
var page = 56; // int | Number of page to get(starts from 1)
var pageSize = 56; // int | Number of objects on one page
var orderByDate = orderByDate_example; // String | Order by date(asc|desc)
var requestBody = [List&lt;int&gt;()]; // List<int> | Ids of resources to get

try { 
    var result = api_instance.apiV1UnitPost(page, pageSize, orderByDate, requestBody);
    print(result);
} catch (e) {
    print("Exception when calling UnitApi->apiV1UnitPost: $e\n");
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

[**List<Unit>**](Unit.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/_*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

