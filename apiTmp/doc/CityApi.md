# api.api.CityApi

## Load the API package
```dart
import 'package:api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiV1CityGet**](CityApi.md#apiV1CityGet) | **GET** /api/v1/City | Gets paged resources of type
[**apiV1CityIdGet**](CityApi.md#apiV1CityIdGet) | **GET** /api/v1/City/{id} | Gets resource of type of given id
[**apiV1CityPost**](CityApi.md#apiV1CityPost) | **POST** /api/v1/City | Gets paged resources of type of given ids
[**apiV1CitySearchPost**](CityApi.md#apiV1CitySearchPost) | **POST** /api/v1/City/search | Searches cities by query


# **apiV1CityGet**
> List<City> apiV1CityGet(page, pageSize, orderByDate)

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

var api_instance = CityApi();
var page = 56; // int | Number of page to get(starts from 1)
var pageSize = 56; // int | Number of objects on one page
var orderByDate = orderByDate_example; // String | Order by date(asc|desc)

try { 
    var result = api_instance.apiV1CityGet(page, pageSize, orderByDate);
    print(result);
} catch (e) {
    print("Exception when calling CityApi->apiV1CityGet: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**| Number of page to get(starts from 1) | [optional] [default to null]
 **pageSize** | **int**| Number of objects on one page | [optional] [default to null]
 **orderByDate** | **String**| Order by date(asc|desc) | [optional] [default to null]

### Return type

[**List<City>**](City.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1CityIdGet**
> City apiV1CityIdGet(id)

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

var api_instance = CityApi();
var id = 56; // int | Number of page to get(starts from 1)

try { 
    var result = api_instance.apiV1CityIdGet(id);
    print(result);
} catch (e) {
    print("Exception when calling CityApi->apiV1CityIdGet: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| Number of page to get(starts from 1) | [default to null]

### Return type

[**City**](City.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1CityPost**
> List<City> apiV1CityPost(page, pageSize, orderByDate, requestBody)

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

var api_instance = CityApi();
var page = 56; // int | Number of page to get(starts from 1)
var pageSize = 56; // int | Number of objects on one page
var orderByDate = orderByDate_example; // String | Order by date(asc|desc)
var requestBody = [List&lt;int&gt;()]; // List<int> | Ids of resources to get

try { 
    var result = api_instance.apiV1CityPost(page, pageSize, orderByDate, requestBody);
    print(result);
} catch (e) {
    print("Exception when calling CityApi->apiV1CityPost: $e\n");
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

[**List<City>**](City.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/_*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1CitySearchPost**
> List<City> apiV1CitySearchPost(body, page, pageSize, orderByDate)

Searches cities by query

### Example 
```dart
import 'package:api/api.dart';
// TODO Configure HTTP Bearer authorization: bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearer').setAccessToken(yourTokenGeneratorFunction);

var api_instance = CityApi();
var body = String(); // String | Query to search(by name)
var page = 56; // int | Number of page to get(starts from 1)
var pageSize = 56; // int | Number of objects on one page
var orderByDate = orderByDate_example; // String | Order by date(asc|desc)

try { 
    var result = api_instance.apiV1CitySearchPost(body, page, pageSize, orderByDate);
    print(result);
} catch (e) {
    print("Exception when calling CityApi->apiV1CitySearchPost: $e\n");
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

[**List<City>**](City.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/_*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

