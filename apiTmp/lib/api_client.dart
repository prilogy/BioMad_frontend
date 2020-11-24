part of api.api;

class QueryParam {
  String name;
  String value;

  QueryParam(this.name, this.value);
}

class ApiClient {

  String basePath;
  var client = Client();

  Map<String, String> _defaultHeaderMap = {};
  Map<String, Authentication> _authentications = {};

  final _regList = RegExp(r'^List<(.*)>$');
  final _regMap = RegExp(r'^Map<String,(.*)>$');

  ApiClient({this.basePath = "http://localhost"}) {
    // Setup authentications (key: authentication name, value: authentication).
    _authentications['bearer'] = HttpBearerAuth();
  }

  void addDefaultHeader(String key, String value) {
     _defaultHeaderMap[key] = value;
  }

  dynamic _deserialize(dynamic value, String targetType) {
    try {
      switch (targetType) {
        case 'String':
          return '$value';
        case 'int':
          return value is int ? value : int.parse('$value');
        case 'bool':
          return value is bool ? value : '$value'.toLowerCase() == 'true';
        case 'double':
          return value is double ? value : double.parse('$value');
        case 'Article':
          return Article.fromJson(value);
        case 'ArticleTranslation':
          return ArticleTranslation.fromJson(value);
        case 'AuthenticationResult':
          return AuthenticationResult.fromJson(value);
        case 'Biomarker':
          return Biomarker.fromJson(value);
        case 'BiomarkerArticle':
          return BiomarkerArticle.fromJson(value);
        case 'BiomarkerArticleType':
          return BiomarkerArticleType.fromJson(value);
        case 'BiomarkerReference':
          return BiomarkerReference.fromJson(value);
        case 'BiomarkerReferenceConfig':
          return BiomarkerReferenceConfig.fromJson(value);
        case 'BiomarkerReferenceConfigRange':
          return BiomarkerReferenceConfigRange.fromJson(value);
        case 'BiomarkerTranslation':
          return BiomarkerTranslation.fromJson(value);
        case 'BiomarkerType':
          return BiomarkerType.fromJson(value);
        case 'BiomarkerTypeTranslation':
          return BiomarkerTypeTranslation.fromJson(value);
        case 'BiomarkerUnit':
          return BiomarkerUnit.fromJson(value);
        case 'Category':
          return Category.fromJson(value);
        case 'CategoryBiomarker':
          return CategoryBiomarker.fromJson(value);
        case 'CategoryTranslation':
          return CategoryTranslation.fromJson(value);
        case 'City':
          return City.fromJson(value);
        case 'CityTranslation':
          return CityTranslation.fromJson(value);
        case 'ConfirmationCode':
          return ConfirmationCode.fromJson(value);
        case 'Culture':
          return Culture.fromJson(value);
        case 'Gender':
          return Gender.fromJson(value);
        case 'GenderTranslation':
          return GenderTranslation.fromJson(value);
        case 'Lab':
          return Lab.fromJson(value);
        case 'LabTranslation':
          return LabTranslation.fromJson(value);
        case 'LogInWithCredentialsModel':
          return LogInWithCredentialsModel.fromJson(value);
        case 'Member':
          return Member.fromJson(value);
        case 'MemberAnalysis':
          return MemberAnalysis.fromJson(value);
        case 'MemberAnalysisModel':
          return MemberAnalysisModel.fromJson(value);
        case 'MemberBiomarker':
          return MemberBiomarker.fromJson(value);
        case 'MemberBiomarkerModel':
          return MemberBiomarkerModel.fromJson(value);
        case 'MemberCategoryState':
          return MemberCategoryState.fromJson(value);
        case 'MemberModel':
          return MemberModel.fromJson(value);
        case 'PasswordResetModel':
          return PasswordResetModel.fromJson(value);
        case 'RefreshToken':
          return RefreshToken.fromJson(value);
        case 'RefreshTokenAuthenticationModel':
          return RefreshTokenAuthenticationModel.fromJson(value);
        case 'Role':
          return Role.fromJson(value);
        case 'SignUpModel':
          return SignUpModel.fromJson(value);
        case 'SignUpWithSocialAccountModel':
          return SignUpWithSocialAccountModel.fromJson(value);
        case 'SocialAccount':
          return SocialAccount.fromJson(value);
        case 'SocialAccountProvider':
          return SocialAccountProvider.fromJson(value);
        case 'SocialAuthenticationIdentity':
          return SocialAuthenticationIdentity.fromJson(value);
        case 'TokenModel':
          return TokenModel.fromJson(value);
        case 'Types':
          return new TypesTypeTransformer().decode(value);
        case 'Unit':
          return Unit.fromJson(value);
        case 'UnitTransfer':
          return UnitTransfer.fromJson(value);
        case 'UnitTranslation':
          return UnitTranslation.fromJson(value);
        case 'User':
          return User.fromJson(value);
        case 'UserEditModel':
          return UserEditModel.fromJson(value);
        default:
          {
            Match match;
            if (value is List &&
                (match = _regList.firstMatch(targetType)) != null) {
              var newTargetType = match[1];
              return value.map((v) => _deserialize(v, newTargetType)).toList();
            } else if (value is Map &&
                (match = _regMap.firstMatch(targetType)) != null) {
              var newTargetType = match[1];
              return Map.fromIterables(value.keys,
                  value.values.map((v) => _deserialize(v, newTargetType)));
            }
          }
      }
    } on Exception catch (e, stack) {
      throw ApiException.withInner(500, 'Exception during deserialization.', e, stack);
    }
    throw ApiException(500, 'Could not find a suitable class for deserialization');
  }

  dynamic deserialize(String json, String targetType) {
    // Remove all spaces.  Necessary for reg expressions as well.
    targetType = targetType.replaceAll(' ', '');

    if (targetType == 'String') return json;

    var decodedJson = jsonDecode(json);
    return _deserialize(decodedJson, targetType);
  }

  String serialize(Object obj) {
    String serialized = '';
    if (obj == null) {
      serialized = '';
    } else {
      serialized = json.encode(obj);
    }
    return serialized;
  }

  // We don't use a Map<String, String> for queryParams.
  // If collectionFormat is 'multi' a key might appear multiple times.
  Future<Response> invokeAPI(String path,
                             String method,
                             Iterable<QueryParam> queryParams,
                             Object body,
                             Map<String, String> headerParams,
                             Map<String, String> formParams,
                             String nullableContentType,
                             List<String> authNames) async {

    _updateParamsForAuth(authNames, queryParams, headerParams);

    var ps = queryParams
      .where((p) => p.value != null)
      .map((p) => '${p.name}=${Uri.encodeQueryComponent(p.value)}');

    String queryString = ps.isNotEmpty ?
                         '?' + ps.join('&') :
                         '';

    String url = basePath + path + queryString;

    headerParams.addAll(_defaultHeaderMap);
    if (nullableContentType != null) {
      final contentType = nullableContentType;
      headerParams['Content-Type'] = contentType;
    }

    if(body is MultipartRequest) {
      var request = MultipartRequest(method, Uri.parse(url));
      request.fields.addAll(body.fields);
      request.files.addAll(body.files);
      request.headers.addAll(body.headers);
      request.headers.addAll(headerParams);
      var response = await client.send(request);
      return Response.fromStream(response);
    } else {
      var msgBody = nullableContentType == "application/x-www-form-urlencoded" ? formParams : serialize(body);
      final nullableHeaderParams = (headerParams.isEmpty)? null: headerParams;
      switch(method) {
        case "POST":
          return client.post(url, headers: nullableHeaderParams, body: msgBody);
        case "PUT":
          return client.put(url, headers: nullableHeaderParams, body: msgBody);
        case "DELETE":
          return client.delete(url, headers: nullableHeaderParams);
        case "PATCH":
          return client.patch(url, headers: nullableHeaderParams, body: msgBody);
        case "HEAD":
          return client.head(url, headers: nullableHeaderParams);
        default:
          return client.get(url, headers: nullableHeaderParams);
      }
    }
  }

  /// Update query and header parameters based on authentication settings.
  /// @param authNames The authentications to apply
  void _updateParamsForAuth(List<String> authNames, List<QueryParam> queryParams, Map<String, String> headerParams) {
    authNames.forEach((authName) {
      Authentication auth = _authentications[authName];
      if (auth == null) throw ArgumentError("Authentication undefined: " + authName);
      auth.applyToParams(queryParams, headerParams);
    });
  }

  T getAuthentication<T extends Authentication>(String name) {
    var authentication = _authentications[name];

    return authentication is T ? authentication : null;
  }
}
