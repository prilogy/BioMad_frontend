# api.model.Unit

## Load the model package
```dart
import 'package:api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **int** |  | [optional] [default to null]
**translations** | [**List&lt;UnitTranslation&gt;**](UnitTranslation.md) |  | [optional] [default to []]
**content** | [**UnitTranslation**](UnitTranslation.md) |  | [optional] [default to null]
**biomarkers** | [**List&lt;Biomarker&gt;**](Biomarker.md) |  | [optional] [readonly] [default to []]
**transfersToIds** | **List&lt;int&gt;** |  | [optional] [readonly] [default to []]
**transfersFromIds** | **List&lt;int&gt;** |  | [optional] [readonly] [default to []]
**transfersTo** | [**List&lt;UnitTransfer&gt;**](UnitTransfer.md) |  | [optional] [default to []]
**transfersFrom** | [**List&lt;UnitTransfer&gt;**](UnitTransfer.md) |  | [optional] [default to []]
**biomarkerUnits** | [**List&lt;BiomarkerUnit&gt;**](BiomarkerUnit.md) |  | [optional] [default to []]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


