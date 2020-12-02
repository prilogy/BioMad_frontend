# api.api.LabApi

## Load the API package
```dart
import 'package:api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiV1LabGet**](LabApi.md#apiV1LabGet) | **GET** /api/v1/Lab | Gets paged resources of type
[**apiV1LabIdGet**](LabApi.md#apiV1LabIdGet) | **GET** /api/v1/Lab/{id} | Gets resource of type of given id
[**apiV1LabPost**](LabApi.md#apiV1LabPost) | **POST** /api/v1/Lab | Gets paged resources of type of given ids
[**apiV1LabSearchPost**](LabApi.md#apiV1LabSearchPost) | **POST** /api/v1/Lab/search | Searches labs by query


# **apiV1LabGet**
> List<Lab> apiV1LabGet(page, pageSize, orderByDate)

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

var api_instance = LabApi();
var page = 56; // int | Number of page to get(starts from 1)
var pageSize = 56; // int | Number of objects on one page
var orderByDate = orderByDate_example; // String | Order by date(asc|desc)

try { 
    var result = api_instance.apiV1LabGet(page, pageSize, orderByDate);
    print(result);
} catch (e) {
    print("Exception when calling LabApi->apiV1LabGet: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**| Number of page to get(starts from 1) | [optional] [default to null]
 **pageSize** | **int**| Number of objects on one page | [optional] [default to null]
 **orderByDate** | **String**| Order by date(asc|desc) | [optional] [default to null]

### Return type

[**List<Lab>**](Lab.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1LabIdGet**
> Lab apiV1LabIdGet(id)

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

var api_instance = LabApi();
var id = 56; // int | Number of page to get(starts from 1)

try { 
    var result = api_instance.apiV1LabIdGet(id);
    print(result);
} catch (e) {
    print("Exception when calling LabApi->apiV1LabIdGet: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| Number of page to get(starts from 1) | [default to null]

### Return type

[**Lab**](Lab.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1LabPost**
> List<Lab> apiV1LabPost(page, pageSize, orderByDate, requestBody)

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

var api_instance = LabApi();
var page = 56; // int | Number of page to get(starts from 1)
var pageSize = 56; // int | Number of objects on one page
var orderByDate = orderByDate_example; // String | Order by date(asc|desc)
var requestBody = [List&lt;int&gt;()]; // List<int> | Ids of resources to get

try { 
    var result = api_instance.apiV1LabPost(page, pageSize, orderByDate, requestBody);
    print(result);
} catch (e) {
    print("Exception when calling LabApi->apiV1LabPost: $e\n");
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

[**List<Lab>**](Lab.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/_*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1LabSearchPost**
> List<Lab> apiV1LabSearchPost(body, page, pageSize, orderByDate)

Searches labs by query

### Example 
```dart
import 'package:api/api.dart';
// TODO Configure HTTP Bearer authorization: bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearer').setAccessToken(yourTokenGeneratorFunction);

var api_instance = LabApi();
var body = String(); // String | Query to search(by name)
var page = 56; // int | Number of page to get(starts from 1)
var pageSize = 56; // int | Number of objects on one page
var orderByDate = orderByDate_example; // String | Order by date(asc|desc)

try { 
    var result = api_instance.apiV1LabSearchPost(body, page, pageSize, orderByDate);
    print(result);
} catch (e) {
    print("Exception when calling LabApi->apiV1LabSearchPost: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | **String**| Query to search(by name) | 
 **page** | **int**| Number of page to get(starts from 1) | [optional] [default to null]
 **pageSize** | **int**| Number of objects on one page | [optional] [default to null]
 **orderByDate** | **String**| Order by date(asc|desc) | [optional] [default to null]

### Return type

[**List<Lab>**](Lab.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/_*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

