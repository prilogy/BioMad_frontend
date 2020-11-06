import 'package:biomad_frontend/helpers/i18n_helper.dart';
import 'package:biomad_frontend/helpers/no_ripple_scroll_behaviour.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final _tr = trWithKey('auth_screen');

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Text(_tr('sign_up'), style: TextStyle(color: theme.primaryColor),),
      ),
      body: ScrollConfiguration(
        behavior: NoRippleScrollBehaviour(),
        child: ListView(
          children: [

          ],
        ),
      ),
    );
  }
}
