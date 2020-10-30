# api.model.User

## Load the model package
```dart
import 'package:api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **int** |  | [optional] [default to null]
**email** | **String** |  | [optional] [default to null]
**password** | **String** |  | [optional] [default to null]
**dateCreatedAt** | [**DateTime**](DateTime.md) |  | [optional] [default to null]
**members** | [**List&lt;Member&gt;**](Member.md) |  | [optional] [default to []]
**currentMemberId** | **int** |  | [optional] [default to null]
**socialAccounts** | [**List&lt;SocialAccount&gt;**](SocialAccount.md) |  | [optional] [default to []]
**roleId** | **int** |  | [optional] [default to null]
**role** | [**Role**](Role.md) |  | [optional] [default to null]
**refreshTokens** | [**List&lt;RefreshToken&gt;**](RefreshToken.md) |  | [optional] [default to []]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


