# api.api.HelperApi

## Load the API package
```dart
import 'package:api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiV1HelperCulturePost**](HelperApi.md#apiV1HelperCulturePost) | **POST** /api/v1/Helper/culture | Gets list of cultures
[**apiV1HelperGenderPost**](HelperApi.md#apiV1HelperGenderPost) | **POST** /api/v1/Helper/gender | Gets list of genders


# **apiV1HelperCulturePost**
> List<Culture> apiV1HelperCulturePost()

Gets list of cultures

### Example 
```dart
import 'package:api/api.dart';
// TODO Configure HTTP Bearer authorization: bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearer').setAccessToken(yourTokenGeneratorFunction);

var api_instance = HelperApi();

try { 
    var result = api_instance.apiV1HelperCulturePost();
    print(result);
} catch (e) {
    print("Exception when calling HelperApi->apiV1HelperCulturePost: $e\n");
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**List<Culture>**](Culture.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1HelperGenderPost**
> List<Gender> apiV1HelperGenderPost()

Gets list of genders

### Example 
```dart
import 'package:api/api.dart';
// TODO Configure HTTP Bearer authorization: bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearer').setAccessToken(yourTokenGeneratorFunction);

var api_instance = HelperApi();

try { 
    var result = api_instance.apiV1HelperGenderPost();
    print(result);
} catch (e) {
    print("Exception when calling HelperApi->apiV1HelperGenderPost: $e\n");
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**List<Gender>**](Gender.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

