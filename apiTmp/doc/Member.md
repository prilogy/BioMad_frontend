# api.model.Member

## Load the model package
```dart
import 'package:api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **int** |  | [optional] [default to null]
**name** | **String** |  | [optional] [default to null]
**color** | **String** |  | [optional] [default to null]
**dateCreatedAt** | [**DateTime**](DateTime.md) |  | [optional] [default to null]
**dateBirthday** | [**DateTime**](DateTime.md) |  | [optional] [default to null]
**age** | **int** |  | [optional] [readonly] [default to null]
**genderId** | **int** |  | [optional] [default to null]
**gender** | [**Gender**](Gender.md) |  | [optional] [default to null]
**analyzes** | [**List&lt;MemberAnalysis&gt;**](MemberAnalysis.md) |  | [optional] [default to []]
**analysisIds** | **List&lt;int&gt;** |  | [optional] [readonly] [default to []]
**categoryStates** | [**List&lt;MemberCategoryState&gt;**](MemberCategoryState.md) |  | [optional] [default to []]
**userId** | **int** |  | [optional] [default to null]
**user** | [**User**](User.md) |  | [optional] [default to null]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)

