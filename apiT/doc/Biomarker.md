# api.model.Biomarker

## Load the model package
```dart
import 'package:api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **int** |  | [optional] [default to null]
**typeId** | **int** |  | [optional] [default to null]
**type** | [**BiomarkerType**](BiomarkerType.md) |  | [optional] [default to null]
**translations** | [**List&lt;BiomarkerTranslation&gt;**](BiomarkerTranslation.md) |  | [optional] [default to []]
**content** | [**BiomarkerTranslation**](BiomarkerTranslation.md) |  | [optional] [default to null]
**categories** | [**List&lt;Category&gt;**](Category.md) |  | [optional] [readonly] [default to []]
**articles** | [**List&lt;Article&gt;**](Article.md) |  | [optional] [readonly] [default to []]
**units** | [**List&lt;Unit&gt;**](Unit.md) |  | [optional] [readonly] [default to []]
**references** | [**List&lt;BiomarkerReference&gt;**](BiomarkerReference.md) |  | [optional] [default to []]
**categoryBiomarkers** | [**List&lt;CategoryBiomarker&gt;**](CategoryBiomarker.md) |  | [optional] [default to []]
**biomarkerArticles** | [**List&lt;BiomarkerArticle&gt;**](BiomarkerArticle.md) |  | [optional] [default to []]
**biomarkerUnits** | [**List&lt;BiomarkerUnit&gt;**](BiomarkerUnit.md) |  | [optional] [default to []]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


