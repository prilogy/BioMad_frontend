library api.api;

import 'dart:io';

import 'package:dio/dio.dart';
import 'dart:core';
import 'dart:async';

// apis
part 'api/auth_api.dart';

part 'api/social_account_api.dart';

part 'api/member_api.dart';

part 'api/helper_api.dart';

part 'api/user_api.dart';

// helpers
part 'helpers/api_base.dart';

// models
part 'models/authentication_result.dart';

part 'models/gender.dart';

part 'models/log_in_with_credentials_model.dart';

part 'models/member.dart';

part 'models/member_model.dart';

part 'models/refresh_token.dart';

part 'models/refresh_token_authentication_model.dart';

part 'models/role.dart';

part 'models/sign_up_model.dart';

part 'models/sign_up_with_social_account_model.dart';

part 'models/social_account.dart';

part 'models/social_account_provider.dart';

part 'models/social_authentication_identity.dart';

part 'models/user.dart';

part 'models/user_edit_model.dart';

/// Main api class
class Api {
  final AuthApi auth;
  final SocialAccountApi socialAccount;
  final MemberApi member;
  final HelperApi helper;
  final UserApi user;

  Api(Dio dio)
      : auth = AuthApi(dio),
        socialAccount = SocialAccountApi(dio),
        member = MemberApi(dio),
        helper = HelperApi(dio),
        user = UserApi(dio);
}
