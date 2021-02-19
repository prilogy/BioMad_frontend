import 'package:api/api.dart';
import 'package:biomad_frontend/config/env.dart';
import 'package:biomad_frontend/extensions/snack_bar_extension.dart';
import 'package:biomad_frontend/helpers/i18n_helper.dart';
import 'package:biomad_frontend/helpers/keys.dart';
import 'package:biomad_frontend/helpers/no_ripple_scroll_behaviour.dart';
import 'package:biomad_frontend/helpers/text_field_validators.dart';
import 'package:biomad_frontend/router/main.dart';
import 'package:biomad_frontend/screens/auth_screen/sign_up_screen.dart';
import 'package:biomad_frontend/services/api.dart';
import 'package:biomad_frontend/store/main.dart';
import 'package:biomad_frontend/store/thunks.dart';
import 'package:biomad_frontend/styles/color_alphas.dart';
import 'package:biomad_frontend/styles/indents.dart';
import 'package:biomad_frontend/widgets/block_base_widget.dart';
import 'package:biomad_frontend/widgets/custom/custom_button.dart';
import 'package:biomad_frontend/widgets/custom/custom_text_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _formKey?.currentState?.dispose();
    _emailController?.dispose();
    _passwordController?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _tr = trWithKey('auth_screen');
    final theme = Theme.of(context);

    return Scaffold(
      body: ScrollConfiguration(
        behavior: NoRippleScrollBehaviour(),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 4),
              child: BlockBaseWidget(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _tr('login'),
                      style: theme.textTheme.headline5.merge(TextStyle(fontWeight: FontWeight.w500, color: theme.primaryColor)),
                    ),
                    Container(
                      height: 30,
                      child: CustomButton.flat(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (x) => SignUpScreen()));
                        },
                        text: _tr('sign_up'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            BlockBaseWidget(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextFormField(
                      icon: Icon(Icons.alternate_email),
                      controller: _emailController,
                      validator: TextFieldValidators.isEmail,
                      labelText: tr('input_hint.email'),
                      hintText: 'example@email.com',
                    ),
                    CustomTextFormField(
                      margin: EdgeInsets.only(bottom: Indents.sm),
                      icon: Icon(Icons.lock),
                      controller: _passwordController,
                      validator: TextFieldValidators.isNotEmpty,
                      labelText: tr('input_hint.password'),
                      obscureText: true,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomButton.flat(
                          onPressed: () {
                            // TODO: implement reset password flow
                          },
                          textColor: theme.canvasColor,
                          text: _tr('reset_password'),
                          padding: EdgeInsets.all(0),
                        ),
                        Row(
                          children: [
                            CustomButton.raised(
                              onPressed: () async {
                                if (_formKey.currentState.validate())
                                  store.dispatch(StoreThunks.authorize(() async {
                                    var authResponse = await api.auth.logIn(
                                        LogInWithCredentialsModel(email: _emailController.text, password: _passwordController.text));

                                    if (authResponse == null) {
                                      SnackBarExtension.error(_tr('log_in_error'), hideCurrent: false);
                                      return null;
                                    } else
                                      return authResponse;
                                  }, onSuccess: () {
                                    SnackBarExtension.success(_tr('log_in_success'));
                                    Keys.rootNavigator.currentState.pushReplacementNamed(Routes.main);
                                  }));
                              },
                              margin: EdgeInsets.only(left: Indents.sm),
                              text: _tr('log_in'),
                            ),
                          ],
                        ),
                      ],
                    ),
//                    Padding(
//                      padding: const EdgeInsets.only(top: Indents.sm),
//                      child: Text(
//                        _tr('login_with_social'),
//                        style: theme.textTheme.caption,
//                      ),
//                    ),
//                    Padding(
//                      padding: EdgeInsets.symmetric(vertical: Indents.lg),
//                      child: Row(
//                        mainAxisAlignment: MainAxisAlignment.center,
//                        children: [
//                          SocialAuthIcon(
//                            svgPath: GoogleAuthService.svgPath,
//                            onPressed: () async {
//                              var googleAuth = GoogleAuthService();
//                              var token = await googleAuth.getToken();
//
//                              await _authWithSocial(context, SocialAccountProvider.google, token);
//                            },
//                            backgroundColor: GoogleAuthService.color,
//                            shadowColor: theme.colorScheme.onBackground,
//                            svgSize: GoogleAuthService.size,
//                          ),
//                          Padding(
//                            padding: EdgeInsets.symmetric(horizontal: Indents.md),
//                            child: SocialAuthIcon(
//                              svgPath: FacebookAuthService.svgPath,
//                              onPressed: () async {
//                                var fbAuth = FacebookAuthService();
//                                var token = await fbAuth.getToken();
//
//                                await _authWithSocial(context, SocialAccountProvider.facebook, token);
//                              },
//                              backgroundColor: FacebookAuthService.color,
//                              svgSize: FacebookAuthService.size,
//                            ),
//                          ),
//                          SocialAuthIcon(
//                            svgPath: VkAuthService.svgPath,
//                            onPressed: () async {
//                              var vkAuth = VkAuthService();
//                              var token = await vkAuth.getToken();
//
//                              await _authWithSocial(context, SocialAccountProvider.vk, token);
//                            },
//                            backgroundColor: VkAuthService.color,
//                            svgSize: VkAuthService.size,
//                          )
//                        ],
//                      ),
//                    ),

                    FlatButton(
                      onPressed: () async {
                        var url = env.API_BASE_URL.replaceAll("/api/", "");
                        url += "/policy/${EasyLocalization.of(context).locale.languageCode}";
                        if (await canLaunch(url)) await launch(url);
                      },
                      child: Text(
                        tr("misc.privacy_policy"),
                        style: theme.textTheme.caption.merge(TextStyle(
                          decoration: TextDecoration.underline,
                        )),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future _authWithSocial(BuildContext context, SocialAccountProvider provider, String token) async {
    if (token == null) {
      var socialName = provider.name[0].toUpperCase() + provider.name.substring(1);
      SnackBarExtension.error(tr('auth_screen.sign_in_social_error'));
      return;
    }

    var r = await api.auth.logInWithSocial(token: token, type: provider.name);
    if (r == null) {
      var identity = await api.auth.signUpWithSocialInfo(token: token, type: provider.name);
      if (identity == null) {
        SnackBarExtension.error(tr('auth_screen.sign_in_social_error'));
        return;
      }
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => SignUpScreen(socialIdentity: identity, socialType: provider.name)));
      return;
    }

    store.dispatch(StoreThunks.authorize(() async {
      return r;
    }, onSuccess: () {
      Keys.rootNavigator.currentState.pushReplacementNamed(Routes.main);
    }));
  }
}

class SocialAuthIcon extends StatelessWidget {
  final String svgPath;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color shadowColor;
  final double svgSize;

  SocialAuthIcon(
      {@required this.svgPath, @required this.onPressed, @required this.backgroundColor, this.svgSize = 25, this.shadowColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [BoxShadow(blurRadius: 20, color: (shadowColor ?? backgroundColor).withOpacity(ColorAlphas.a30), spreadRadius: 1)],
      ),
      child: GestureDetector(
        onTap: onPressed ?? () {},
        child: CircleAvatar(
          backgroundColor: backgroundColor,
          radius: 30.0,
          child: SvgPicture.asset(
            svgPath,
            height: svgSize,
          ),
        ),
      ),
    );
  }
}
