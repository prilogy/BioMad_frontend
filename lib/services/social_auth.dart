import 'package:biomad_frontend/config/env.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter_login_vk/flutter_login_vk.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class SocialAuthService {
  Future<String> getToken() => null;
  static final String svgPath = "";
  static final Color color = null;
  static final double size = null;
}

class GoogleAuthService implements SocialAuthService {
  final GoogleSignIn googleSignIn;
  static final String svgPath = "assets/svg/google_logo.svg";
  static final Color color = Colors.white;
  static final double size = 25;

  GoogleAuthService() : googleSignIn = GoogleSignIn();

  @override
  Future<String> getToken() async {
    try {
      var result = await googleSignIn.signIn();
      var googleKey = await result.authentication;
      print(googleKey.accessToken);
      return googleKey?.idToken ?? null;
    } catch (e) {
      print("GOOGLE ERROR: " + e.toString());
      return null;
    }
  }
}

class FacebookAuthService implements SocialAuthService {
  final FacebookLogin facebookLogin;
  static final String svgPath = "assets/svg/fb_logo.svg";
  static final Color color = Color(0xff4267B2);
  static final double size = 22;

  FacebookAuthService() : facebookLogin = FacebookLogin();

  @override
  Future<String> getToken() async {
    var result = await facebookLogin.logIn(['email']);
    return result?.accessToken?.token ?? null;
  }
}

class VkAuthService implements SocialAuthService {
  final VKLogin vkLogin;
  static final String svgPath = "assets/svg/vk_logo.svg";
  static final Color color = Color(0xff4A76A8);
  static final double size = 17;

  VkAuthService() : vkLogin = VKLogin();

  @override
  Future<String> getToken() async {
    await vkLogin.initSdk(env.VK_APP_ID);
    var result = await vkLogin.logIn(scope: [VKScope.email]);
    if (result.isValue) {} else
      print(result.asError);

    var token = result.asValue?.value?.accessToken ?? null;

    return token?.token ?? null;
  }
}