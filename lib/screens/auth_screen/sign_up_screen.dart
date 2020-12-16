import 'package:api/api.dart';
import 'package:biomad_frontend/containers/member_container.dart';
import 'package:biomad_frontend/extensions/snack_bar_extension.dart';
import 'package:biomad_frontend/helpers/i18n_helper.dart';
import 'package:biomad_frontend/helpers/keys.dart';
import 'package:biomad_frontend/helpers/no_ripple_scroll_behaviour.dart';
import 'package:biomad_frontend/helpers/text_field_validators.dart';
import 'package:biomad_frontend/router/main.dart';
import 'package:biomad_frontend/services/api.dart';
import 'package:biomad_frontend/styles/indents.dart';
import 'package:biomad_frontend/widgets/block_base_widget.dart';
import 'package:biomad_frontend/widgets/custom/custom_button.dart';
import 'package:biomad_frontend/widgets/custom/custom_text_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  final SocialAuthenticationIdentity socialIdentity;
  final String socialType;

  SignUpScreen({this.socialIdentity, this.socialType});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  MemberModel _memberModel;
  int _stage = 0;
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _rePasswordController = TextEditingController();

  @override
  void initState() {
    if(widget.socialIdentity != null)
      _emailController.text = widget.socialIdentity.email;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final _tr = trWithKey('auth_screen');

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Text(
          _tr('sign_up'),
          style: TextStyle(color: theme.primaryColor),
        ),
      ),
      body: ScrollConfiguration(
        behavior: NoRippleScrollBehaviour(),
        child: ListView(
          children: [
            BlockBaseWidget(
                child: _stage == 0
                    ? Column(
                        children: [
                          MemberContainer(
                            null,
                            prefilledName: widget.socialIdentity?.name,
                            onChange: (x) {
                              setState(() {
                                _memberModel = x;
                              });
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CustomButton.raised(
                                disabled: _memberModel == null ||
                                    ((_memberModel?.name == null ||
                                            _memberModel?.name == '') ||
                                        _memberModel?.dateBirthday == null ||
                                        _memberModel?.genderId == null),
                                onPressed: () {
                                  setState(() {
                                    _stage = 1;
                                  });
                                },
                                text: tr('misc.continue'),
                              )
                            ],
                          )
                        ],
                      )
                    : _stage == 1
                        ? Column(
                            children: [
                              Form(
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
                                      margin:
                                          EdgeInsets.only(bottom: Indents.md),
                                      icon: Icon(Icons.lock),
                                      controller: _passwordController,
                                      validator: TextFieldValidators.isNotEmpty,
                                      labelText: tr('input_hint.password'),
                                      obscureText: true,
                                    ),
                                    CustomTextFormField(
                                      margin:
                                      EdgeInsets.only(bottom: Indents.sm),
                                      icon: Icon(Icons.lock),
                                      controller: _rePasswordController,
                                      validator: (x) {
                                        final v = TextFieldValidators.isNotEmpty(x);
                                        if(v != null)
                                          return v;

                                        if(x == _passwordController.text)
                                          return null;
                                        else return tr('input_hint.re_password_invalid');
                                        },
                                      labelText: tr('input_hint.re_password'),
                                      obscureText: true,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        CustomButton.raised(onPressed: () async {
                                          if(_formKey.currentState.validate()) {
                                            var model = SignUpModel(
                                              password: _passwordController.text,
                                              name: _memberModel.name,
                                              color: _memberModel.color,
                                              genderId: _memberModel.genderId,
                                              email: _emailController.text,
                                              dateBirthday: _memberModel.dateBirthday
                                            );

                                            bool r;
                                            if(widget.socialIdentity != null)
                                              r = await api.auth.signUpWithSocial(SignUpWithSocialAccountModel(
                                                  password: _passwordController.text,
                                                  name: _memberModel.name,
                                                  color: _memberModel.color,
                                                  genderId: _memberModel.genderId,
                                                  email: _emailController.text,
                                                  dateBirthday: _memberModel.dateBirthday,
                                                identity: widget.socialIdentity
                                              ), widget.socialType);
                                              else r = await api.auth.signUp(model);

                                              if(r != false)
                                              Keys.rootNavigator.currentState.pushReplacementNamed(Routes.auth);

                                            if(r == true)
                                              SnackBarExtension.success(tr('auth_screen.sign_up_success'));
                                            else if(r == null)
                                              SnackBarExtension.error(tr('auth_screen.sign_up_error'));
                                            else if(r == false)
                                              SnackBarExtension.info(tr('auth_screen.email_in_use'));

                                          }
                                        }, text: tr('auth_screen.create_account'),)
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          )
                        : Container()),
          ],
        ),
      ),
    );
  }
}
