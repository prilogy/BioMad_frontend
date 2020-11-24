import 'package:api/api.dart';
import 'package:test/test.dart';


/// tests for AuthApi
void main() {
  var instance = AuthApi();

  group('tests for AuthApi', () {
    // Logs in user with given credentials
    //
    //Future<AuthenticationResult> apiV1AuthLogInPost({ String culture, LogInWithCredentialsModel logInWithCredentialsModel }) async 
    test('test apiV1AuthLogInPost', () async {
      // TODO
    });

    // Logs in user by its social account
    //
    //Future<AuthenticationResult> apiV1AuthLogInTypePost(String type, TokenModel tokenModel, { String culture }) async 
    test('test apiV1AuthLogInTypePost', () async {
      // TODO
    });

    // Authenticates user with model contains refresh token;  Revokes given refresh token and provides with new
    //
    //Future<AuthenticationResult> apiV1AuthRefreshTokenPost({ String culture, RefreshTokenAuthenticationModel refreshTokenAuthenticationModel }) async 
    test('test apiV1AuthRefreshTokenPost', () async {
      // TODO
    });

    // Signs up new user
    //
    //Future apiV1AuthSignUpPost({ SignUpModel signUpModel }) async 
    test('test apiV1AuthSignUpPost', () async {
      // TODO
    });

    // Gets social provider identity to provide data for auth flow
    //
    //Future<SocialAuthenticationIdentity> apiV1AuthSignUpTypeIdentityPost(String type, TokenModel tokenModel) async 
    test('test apiV1AuthSignUpTypeIdentityPost', () async {
      // TODO
    });

    // Signs up new user with connected social account
    //
    //Future apiV1AuthSignUpTypePost(String type, SignUpWithSocialAccountModel signUpWithSocialAccountModel) async 
    test('test apiV1AuthSignUpTypePost', () async {
      // TODO
    });

  });
}
