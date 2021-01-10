library api.api;

import 'package:devicelocale/devicelocale.dart';
import 'package:flutter/services.dart';
import 'package:dio/dio.dart';
import 'dart:core';
import 'dart:async';
import 'dart:convert';
// import 'package:biomad_frontend/services/localstorage.dart';

// apis
part 'api/auth_api.dart';

part 'api/member_analysis_api.dart';

part 'api/social_account_api.dart';

part 'api/member_api.dart';

part 'api/helper_api.dart';

part 'api/article_api.dart';

part 'api/city_api.dart';

part 'api/user_api.dart';

part 'api/lab_api.dart';

part 'api/category_api.dart';

part 'api/member_biomarker_api.dart';

part 'api/biomarker_api.dart';

part 'api/unit_api.dart';

// helpers
part 'helpers/api_base.dart';

// models
part 'models/authentication_result.dart';

part 'models/gender.dart';

part 'models/search_result_model.dart';

part 'models/log_in_with_credentials_model.dart';

part 'models/member.dart';

part 'models/member_model.dart';

part 'models/refresh_token.dart';

part 'models/refresh_token_authentication_model.dart';

part 'models/role.dart';

part 'models/biomarker_state_type.dart';

part 'models/member_biomarker_reference_model.dart';

part 'models/shared.dart';

part 'models/shared_model.dart';

part 'models/sign_up_model.dart';

part 'models/biomarker_reference_config_range.dart';

part 'models/sign_up_with_social_account_model.dart';

part 'models/social_account.dart';

part 'models/social_account_provider.dart';

part 'models/social_authentication_identity.dart';

part 'models/user.dart';

part 'models/city.dart';

part 'models/city_translation.dart';

part 'models/lab.dart';

part 'models/lab_translation.dart';

part 'models/member_analysis.dart';

part 'models/member_analysis_model.dart';

part 'models/member_biomarker.dart';

part 'models/member_category_state.dart';

part 'models/member_biomarker_model.dart';

part 'models/user_edit_model.dart';

part 'models/article.dart';

part 'models/article_translation.dart';

part 'models/biomarker.dart';

part 'models/biomarker_article.dart';

part 'models/culture.dart';

part 'models/unit.dart';

part 'models/unit_transfer.dart';

part 'models/unit_translation.dart';

part 'models/gender_translation.dart';

part 'models/confirmation_code.dart';

part 'models/category_biomarker.dart';

part 'models/category.dart';

part 'models/category_translation.dart';

part 'models/biomarker_unit.dart';

part 'models/biomarker_type.dart';

part 'models/biomarker_type_translation.dart';

part 'models/biomarker_reference.dart';

part 'models/biomarker_reference_config.dart';

part 'models/biomarker_reference_config_dependency.dart';

part 'models/biomarker_reference_config_dependency_range.dart';

part 'models/biomarker_reference_config_dependency_type.dart';

part 'models/types.dart';

part 'models/biomarker_translation.dart';

part 'models/biomarker_article_type.dart';

/// Main api class
class Api {
  final AuthApi auth;
  final SocialAccountApi socialAccount;
  final MemberApi member;
  final HelperApi helper;
  final UserApi user;
  final UnitApi unit;
  final LabApi lab;
  final CityApi city;
  final BiomarkerApi biomarker;
  final MemberBiomarkerApi memberBiomarker;
  final CategoryApi category;
  final ArticleApi article;
  final MemberAnalysisApi memberAnalysis;

  Api(Dio dio)
      : auth = AuthApi(dio),
        socialAccount = SocialAccountApi(dio),
        member = MemberApi(dio),
        helper = HelperApi(dio),
        user = UserApi(dio),
        unit = UnitApi(dio),
        lab = LabApi(dio),
        city = CityApi(dio),
        biomarker = BiomarkerApi(dio),
        memberBiomarker = MemberBiomarkerApi(dio),
        memberAnalysis = MemberAnalysisApi(dio),
        article = ArticleApi(dio),
        category = CategoryApi(dio);
}
