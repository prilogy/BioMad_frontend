import 'package:api/api.dart';
import 'file:///Z:/flutter/biomad_frontend/lib/helpers/i18n_helper.dart';
import 'package:biomad_frontend/extensions/snack_bar_extension.dart';
import 'package:biomad_frontend/helpers/keys.dart';
import 'package:biomad_frontend/helpers/no_ripple_scroll_behaviour.dart';
import 'package:biomad_frontend/helpers/text_field_validators.dart';
import 'package:biomad_frontend/router/main.dart';
import 'package:biomad_frontend/services/api.dart';
import 'package:biomad_frontend/services/social_auth.dart';
import 'package:biomad_frontend/store/main.dart';
import 'package:biomad_frontend/store/thunks.dart';
import 'package:biomad_frontend/styles/color_alphas.dart';
import 'package:biomad_frontend/styles/indents.dart';
import 'package:biomad_frontend/widgets/block_base_widget.dart';
import 'package:biomad_frontend/widgets/custom_button.dart';
import 'package:biomad_frontend/widgets/custom_text_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
              padding:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height / 4),
              child: BlockBaseWidget(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _tr('login'),
                      style: theme.textTheme.headline5.merge(TextStyle(
                          fontWeight: FontWeight.w500,
                          color: theme.primaryColor)),
                    )
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
                      formValidator: () {
                        return _formKey?.currentState?.validate();
                      },
                      validator: TextFieldValidators.isEmail,
                      labelText: tr('input_hint.email'),
                      hintText: 'example@email.com',
                    ),
                    CustomTextFormField(
                      margin: EdgeInsets.only(bottom: Indents.sm),
                      icon: Icon(Icons.lock),
                      controller: _passwordController,
                      formValidator: () {
                        return _formKey?.currentState?.validate();
                      },
                      validator: TextFieldValidators.isNotEmpty,
                      labelText: tr('input_hint.password'),
                      obscureText: true,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomButton.flat(
                          onPressed: () {},
                          text: _tr('sign_up'),
                        ),
                        CustomButton.raised(
                          onPressed: () async {
                            print(_formKey.currentState.validate());
                            if (_formKey.currentState.validate())
                              store
                                  .dispatch(StoreThunks.authorize(() async {
                                var authResponse = await api.auth.logIn(
                                    LogInWithCredentialsModel(
                                        email: _emailController.text,
                                        password: _passwordController.text));

                                if (authResponse == null) {
                                  SnackBarExtension.error(_tr('log_in_error'),
                                      hideCurrent: false);
                                  return null;
                                } else
                                  return authResponse;
                                }, onSuccess: () {
                                SnackBarExtension.success(
                                    _tr('log_in_success'));
                                Keys.rootNavigator.currentState
                                    .pushReplacementNamed(Routes.main);
                              }));
                          },
                          margin: EdgeInsets.only(left: Indents.sm),
                          text: _tr('log_in'),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: Indents.lg),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // TODO: impelment flow
                          SocialAuthIcon(
                            svgPath: GoogleAuthService.svgPath,
                            onPressed: () {},
                            backgroundColor: GoogleAuthService.color,
                            shadowColor: theme.colorScheme.onBackground,
                          ),
                          SocialAuthIcon(
                            svgPath: FacebookAuthService.svgPath,
                            onPressed: () {},
                            backgroundColor: FacebookAuthService.color,
                            svgSize: 22,
                          ),
                          SocialAuthIcon(
                            svgPath: VkAuthService.svgPath,
                            onPressed: () {},
                            backgroundColor: VkAuthService.color,
                            svgSize: 15,
                          )
                        ],
                      ),
                    ),
                    Text(
                      _tr('login_with_social'),
                      style: theme.textTheme.caption,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SocialAuthIcon extends StatelessWidget {
  final String svgPath;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color shadowColor;
  final double svgSize;

  SocialAuthIcon(
      {@required this.svgPath,
      @required this.onPressed,
      @required this.backgroundColor,
      this.svgSize = 25,
      this.shadowColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
              blurRadius: 20,
              color:
                  (shadowColor ?? backgroundColor).withOpacity(ColorAlphas.a30),
              spreadRadius: 1)
        ],
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
