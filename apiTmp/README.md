# api
Web API documentation for BioMad application.

This Dart package is automatically generated by the [OpenAPI Generator](https://openapi-generator.tech) project:

- API version: v1
- Build package: org.openapitools.codegen.languages.DartClientCodegen

## Requirements

Dart 2.0 or later

## Installation & Usage

### Github
If this Dart package is published to Github, add the following dependency to your pubspec.yaml
```
dependencies:
  api:
    git: https://github.com/GIT_USER_ID/GIT_REPO_ID.git
```

### Local
To use the package in your local drive, add the following dependency to your pubspec.yaml
```
dependencies:
  api:
    path: /path/to/api
```

## Tests

TODO

## Getting Started

Please follow the [installation procedure](#installation--usage) and then run the following:

```dart
import 'package:api/api.dart';

// TODO Configure HTTP Bearer authorization: bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearer').setAccessToken(yourTokenGeneratorFunction);

var api_instance = AuthApi();
var culture = culture_example; // String | Header represents current culture
var logInWithCredentialsModel = LogInWithCredentialsModel(); // LogInWithCredentialsModel | 

try {
    var result = api_instance.apiV1AuthLogInPost(culture, logInWithCredentialsModel);
    print(result);
} catch (e) {
    print("Exception when calling AuthApi->apiV1AuthLogInPost: $e\n");
}

```

## Documentation for API Endpoints

All URIs are relative to *http://localhost*

Class | Method | HTTP request | Description
------------ | ------------- | ------------- | -------------
*AuthApi* | [**apiV1AuthLogInPost**](doc\/AuthApi.md#apiv1authloginpost) | **POST** /api/v1/Auth/logIn | Logs in user with given credentials
*AuthApi* | [**apiV1AuthLogInTypePost**](doc\/AuthApi.md#apiv1authlogintypepost) | **POST** /api/v1/Auth/logIn/{type} | Logs in user by its social account
*AuthApi* | [**apiV1AuthRefreshTokenPost**](doc\/AuthApi.md#apiv1authrefreshtokenpost) | **POST** /api/v1/Auth/refreshToken | Authenticates user with model contains refresh token;  Revokes given refresh token and provides with new
*AuthApi* | [**apiV1AuthSignUpPost**](doc\/AuthApi.md#apiv1authsignuppost) | **POST** /api/v1/Auth/signUp | Signs up new user
*AuthApi* | [**apiV1AuthSignUpTypeIdentityPost**](doc\/AuthApi.md#apiv1authsignuptypeidentitypost) | **POST** /api/v1/Auth/signUp/{type}/identity | Gets social provider identity to provide data for auth flow
*AuthApi* | [**apiV1AuthSignUpTypePost**](doc\/AuthApi.md#apiv1authsignuptypepost) | **POST** /api/v1/Auth/signUp/{type} | Signs up new user with connected social account
*BiomarkerApi* | [**apiV1BiomarkerGet**](doc\/BiomarkerApi.md#apiv1biomarkerget) | **GET** /api/v1/Biomarker | Gets paged resources of type
*BiomarkerApi* | [**apiV1BiomarkerIdGet**](doc\/BiomarkerApi.md#apiv1biomarkeridget) | **GET** /api/v1/Biomarker/{id} | Gets resource of type of given id
*BiomarkerApi* | [**apiV1BiomarkerIdHistoryGet**](doc\/BiomarkerApi.md#apiv1biomarkeridhistoryget) | **GET** /api/v1/Biomarker/{id}/history | Gets history of member&#39;s biomarker values for given Id of biomarker
*BiomarkerApi* | [**apiV1BiomarkerPost**](doc\/BiomarkerApi.md#apiv1biomarkerpost) | **POST** /api/v1/Biomarker | Gets paged resources of type of given ids
*BiomarkerApi* | [**apiV1BiomarkerSearchPost**](doc\/BiomarkerApi.md#apiv1biomarkersearchpost) | **POST** /api/v1/Biomarker/search | Searches biomarkers by query
*BiomarkerApi* | [**apiV1BiomarkerTypeGet**](doc\/BiomarkerApi.md#apiv1biomarkertypeget) | **GET** /api/v1/Biomarker/type | Gets types of biomarkers
*BiomarkerApi* | [**apiV1BiomarkerTypeIdGet**](doc\/BiomarkerApi.md#apiv1biomarkertypeidget) | **GET** /api/v1/Biomarker/type/{id} | Gets type of biomarker of given id
*CategoryApi* | [**apiV1CategoryGet**](doc\/CategoryApi.md#apiv1categoryget) | **GET** /api/v1/Category | Gets paged resources of type
*CategoryApi* | [**apiV1CategoryHistoryGet**](doc\/CategoryApi.md#apiv1categoryhistoryget) | **GET** /api/v1/Category/history | Gets state history of categories
*CategoryApi* | [**apiV1CategoryIdGet**](doc\/CategoryApi.md#apiv1categoryidget) | **GET** /api/v1/Category/{id} | Gets resource of type of given id
*CategoryApi* | [**apiV1CategoryIdHistoryGet**](doc\/CategoryApi.md#apiv1categoryidhistoryget) | **GET** /api/v1/Category/{id}/history | Gets state history of category with given id
*CategoryApi* | [**apiV1CategoryPost**](doc\/CategoryApi.md#apiv1categorypost) | **POST** /api/v1/Category | Gets paged resources of type of given ids
*CategoryApi* | [**apiV1CategorySearchPost**](doc\/CategoryApi.md#apiv1categorysearchpost) | **POST** /api/v1/Category/search | Searches categories by query
*CityApi* | [**apiV1CityGet**](doc\/CityApi.md#apiv1cityget) | **GET** /api/v1/City | Gets paged resources of type
*CityApi* | [**apiV1CityIdGet**](doc\/CityApi.md#apiv1cityidget) | **GET** /api/v1/City/{id} | Gets resource of type of given id
*CityApi* | [**apiV1CityPost**](doc\/CityApi.md#apiv1citypost) | **POST** /api/v1/City | Gets paged resources of type of given ids
*CityApi* | [**apiV1CitySearchPost**](doc\/CityApi.md#apiv1citysearchpost) | **POST** /api/v1/City/search | Searches cities by query
*HelperApi* | [**apiV1HelperCulturePost**](doc\/HelperApi.md#apiv1helperculturepost) | **POST** /api/v1/Helper/culture | Gets list of cultures
*HelperApi* | [**apiV1HelperGenderPost**](doc\/HelperApi.md#apiv1helpergenderpost) | **POST** /api/v1/Helper/gender | Gets list of genders
*HelperApi* | [**apiV1HelperSearchPost**](doc\/HelperApi.md#apiv1helpersearchpost) | **POST** /api/v1/Helper/search | Searches resources by query
*LabApi* | [**apiV1LabGet**](doc\/LabApi.md#apiv1labget) | **GET** /api/v1/Lab | Gets paged resources of type
*LabApi* | [**apiV1LabIdGet**](doc\/LabApi.md#apiv1labidget) | **GET** /api/v1/Lab/{id} | Gets resource of type of given id
*LabApi* | [**apiV1LabPost**](doc\/LabApi.md#apiv1labpost) | **POST** /api/v1/Lab | Gets paged resources of type of given ids
*LabApi* | [**apiV1LabSearchPost**](doc\/LabApi.md#apiv1labsearchpost) | **POST** /api/v1/Lab/search | Searches labs by query
*MemberApi* | [**apiV1MemberIdDelete**](doc\/MemberApi.md#apiv1memberiddelete) | **DELETE** /api/v1/Member/{id} | Removes member out of user
*MemberApi* | [**apiV1MemberIdPatch**](doc\/MemberApi.md#apiv1memberidpatch) | **PATCH** /api/v1/Member/{id} | Edits data of member
*MemberApi* | [**apiV1MemberPost**](doc\/MemberApi.md#apiv1memberpost) | **POST** /api/v1/Member | Adds new member to user
*MemberAnalysisApi* | [**apiV1MemberAnalysisAddPost**](doc\/MemberAnalysisApi.md#apiv1memberanalysisaddpost) | **POST** /api/v1/member/analysis/add | Adds new analysis
*MemberAnalysisApi* | [**apiV1MemberAnalysisGet**](doc\/MemberAnalysisApi.md#apiv1memberanalysisget) | **GET** /api/v1/member/analysis | Gets paged resources of type
*MemberAnalysisApi* | [**apiV1MemberAnalysisIdDelete**](doc\/MemberAnalysisApi.md#apiv1memberanalysisiddelete) | **DELETE** /api/v1/member/analysis/{id} | Deletes analysis of given id
*MemberAnalysisApi* | [**apiV1MemberAnalysisIdGet**](doc\/MemberAnalysisApi.md#apiv1memberanalysisidget) | **GET** /api/v1/member/analysis/{id} | Gets resource of type of given id
*MemberAnalysisApi* | [**apiV1MemberAnalysisIdPatch**](doc\/MemberAnalysisApi.md#apiv1memberanalysisidpatch) | **PATCH** /api/v1/member/analysis/{id} | Edits analysis of given id
*MemberAnalysisApi* | [**apiV1MemberAnalysisPost**](doc\/MemberAnalysisApi.md#apiv1memberanalysispost) | **POST** /api/v1/member/analysis | Gets paged resources of type of given ids
*MemberBiomarkerApi* | [**apiV1MemberBiomarkerAddPost**](doc\/MemberBiomarkerApi.md#apiv1memberbiomarkeraddpost) | **POST** /api/v1/member/biomarker/add | Adds new member biomarker
*MemberBiomarkerApi* | [**apiV1MemberBiomarkerGet**](doc\/MemberBiomarkerApi.md#apiv1memberbiomarkerget) | **GET** /api/v1/member/biomarker | Gets paged resources of type
*MemberBiomarkerApi* | [**apiV1MemberBiomarkerIdDelete**](doc\/MemberBiomarkerApi.md#apiv1memberbiomarkeriddelete) | **DELETE** /api/v1/member/biomarker/{id} | Deletes member&#39;s biomarker of given id
*MemberBiomarkerApi* | [**apiV1MemberBiomarkerIdGet**](doc\/MemberBiomarkerApi.md#apiv1memberbiomarkeridget) | **GET** /api/v1/member/biomarker/{id} | Gets resource of type of given id
*MemberBiomarkerApi* | [**apiV1MemberBiomarkerIdPatch**](doc\/MemberBiomarkerApi.md#apiv1memberbiomarkeridpatch) | **PATCH** /api/v1/member/biomarker/{id} | Edits member&#39;s biomarker of given id
*MemberBiomarkerApi* | [**apiV1MemberBiomarkerPost**](doc\/MemberBiomarkerApi.md#apiv1memberbiomarkerpost) | **POST** /api/v1/member/biomarker | Gets paged resources of type of given ids
*PasswordResetApi* | [**apiV1PasswordResetGet**](doc\/PasswordResetApi.md#apiv1passwordresetget) | **GET** /api/v1/PasswordReset | Sends confirmation email to user with given email
*PasswordResetApi* | [**apiV1PasswordResetPatch**](doc\/PasswordResetApi.md#apiv1passwordresetpatch) | **PATCH** /api/v1/PasswordReset | Resets password of user
*PasswordResetApi* | [**apiV1PasswordResetVerifyGet**](doc\/PasswordResetApi.md#apiv1passwordresetverifyget) | **GET** /api/v1/PasswordReset/verify | Verifies code for password reset flow
*SocialAccountApi* | [**apiV1SocialAccountProviderGet**](doc\/SocialAccountApi.md#apiv1socialaccountproviderget) | **GET** /api/v1/SocialAccount/provider | Gets social providers list
*SocialAccountApi* | [**apiV1SocialAccountTypeDelete**](doc\/SocialAccountApi.md#apiv1socialaccounttypedelete) | **DELETE** /api/v1/SocialAccount/{type} | Removes social account from current user
*SocialAccountApi* | [**apiV1SocialAccountTypePost**](doc\/SocialAccountApi.md#apiv1socialaccounttypepost) | **POST** /api/v1/SocialAccount/{type} | Adds social account to current user
*UnitApi* | [**apiV1UnitGet**](doc\/UnitApi.md#apiv1unitget) | **GET** /api/v1/Unit | Gets paged resources of type
*UnitApi* | [**apiV1UnitIdGet**](doc\/UnitApi.md#apiv1unitidget) | **GET** /api/v1/Unit/{id} | Gets resource of type of given id
*UnitApi* | [**apiV1UnitPost**](doc\/UnitApi.md#apiv1unitpost) | **POST** /api/v1/Unit | Gets paged resources of type of given ids
*UnitApi* | [**apiV1UnitSearchPost**](doc\/UnitApi.md#apiv1unitsearchpost) | **POST** /api/v1/Unit/search | Searches units by query
*UserApi* | [**apiV1UserEmailGet**](doc\/UserApi.md#apiv1useremailget) | **GET** /api/v1/User/email | Sends email with code to confirm email
*UserApi* | [**apiV1UserEmailPatch**](doc\/UserApi.md#apiv1useremailpatch) | **PATCH** /api/v1/User/email | Verifies user&#39;s email with given code
*UserApi* | [**apiV1UserGet**](doc\/UserApi.md#apiv1userget) | **GET** /api/v1/User | Gets user&#39;s account info
*UserApi* | [**apiV1UserPatch**](doc\/UserApi.md#apiv1userpatch) | **PATCH** /api/v1/User | Edits user&#39;s data


## Documentation For Models

 - [Article](doc\/Article.md)
 - [ArticleTranslation](doc\/ArticleTranslation.md)
 - [AuthenticationResult](doc\/AuthenticationResult.md)
 - [Biomarker](doc\/Biomarker.md)
 - [BiomarkerArticle](doc\/BiomarkerArticle.md)
 - [BiomarkerArticleType](doc\/BiomarkerArticleType.md)
 - [BiomarkerReference](doc\/BiomarkerReference.md)
 - [BiomarkerReferenceConfig](doc\/BiomarkerReferenceConfig.md)
 - [BiomarkerReferenceConfigRange](doc\/BiomarkerReferenceConfigRange.md)
 - [BiomarkerTranslation](doc\/BiomarkerTranslation.md)
 - [BiomarkerType](doc\/BiomarkerType.md)
 - [BiomarkerTypeTranslation](doc\/BiomarkerTypeTranslation.md)
 - [BiomarkerUnit](doc\/BiomarkerUnit.md)
 - [Category](doc\/Category.md)
 - [CategoryBiomarker](doc\/CategoryBiomarker.md)
 - [CategoryTranslation](doc\/CategoryTranslation.md)
 - [City](doc\/City.md)
 - [CityTranslation](doc\/CityTranslation.md)
 - [ConfirmationCode](doc\/ConfirmationCode.md)
 - [Culture](doc\/Culture.md)
 - [Gender](doc\/Gender.md)
 - [GenderTranslation](doc\/GenderTranslation.md)
 - [Lab](doc\/Lab.md)
 - [LabTranslation](doc\/LabTranslation.md)
 - [LogInWithCredentialsModel](doc\/LogInWithCredentialsModel.md)
 - [Member](doc\/Member.md)
 - [MemberAnalysis](doc\/MemberAnalysis.md)
 - [MemberAnalysisModel](doc\/MemberAnalysisModel.md)
 - [MemberBiomarker](doc\/MemberBiomarker.md)
 - [MemberBiomarkerModel](doc\/MemberBiomarkerModel.md)
 - [MemberCategoryState](doc\/MemberCategoryState.md)
 - [MemberModel](doc\/MemberModel.md)
 - [PasswordResetModel](doc\/PasswordResetModel.md)
 - [RefreshToken](doc\/RefreshToken.md)
 - [RefreshTokenAuthenticationModel](doc\/RefreshTokenAuthenticationModel.md)
 - [Role](doc\/Role.md)
 - [SignUpModel](doc\/SignUpModel.md)
 - [SignUpWithSocialAccountModel](doc\/SignUpWithSocialAccountModel.md)
 - [SocialAccount](doc\/SocialAccount.md)
 - [SocialAccountProvider](doc\/SocialAccountProvider.md)
 - [SocialAuthenticationIdentity](doc\/SocialAuthenticationIdentity.md)
 - [TokenModel](doc\/TokenModel.md)
 - [Types](doc\/Types.md)
 - [Unit](doc\/Unit.md)
 - [UnitTransfer](doc\/UnitTransfer.md)
 - [UnitTranslation](doc\/UnitTranslation.md)
 - [User](doc\/User.md)
 - [UserEditModel](doc\/UserEditModel.md)


## Documentation For Authorization


## bearer

- **Type**: HTTP Bearer authentication


## Author

artglz63@gmail.com

