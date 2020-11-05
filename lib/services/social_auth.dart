import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter_vk_login/flutter_vk_login.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class SocialAuthService {
  Future<String> getToken() => null;
  static final String svgPath = "";
  static final Color color = null;
}

class GoogleAuthService implements SocialAuthService {
  final GoogleSignIn googleSignIn;
  static final String svgPath = "assets/svg/google_logo.svg";
  static final Color color = Colors.white;

  GoogleAuthService(): googleSignIn = GoogleSignIn();

  @override
  Future<String> getToken() async {
    var result = await googleSignIn.signIn();
    var googleKey = await result.authentication;
    return googleKey?.idToken ?? null;
  }
}

class FacebookAuthService implements SocialAuthService {
  final FacebookLogin facebookLogin;
  static final String svgPath = "assets/svg/fb_logo.svg";
  static final Color color = Color(0xff4267B2);

  FacebookAuthService(): facebookLogin = FacebookLogin();

  @override
  Future<String> getToken() async {
    var result =  await facebookLogin.logIn(['email']);
    return result?.accessToken?.token ?? null;
  }
}

class VkAuthService implements SocialAuthService {
  final FlutterVkLogin vkLogin;
  static final String svgPath = "assets/svg/vk_logo.svg";
  static final Color color = Color(0xff4A76A8);

  VkAuthService(): vkLogin = FlutterVkLogin();

  @override
  Future<String> getToken() async {
    var result = await vkLogin.logIn(['email']);
    return result?.token?.token ?? null;
  }
}