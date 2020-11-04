import 'package:api/api.dart';
import 'package:biomad_frontend/extensions/snack_bar_extension.dart';
import 'package:biomad_frontend/helpers/keys.dart';
import 'package:biomad_frontend/services/api.dart';
import 'package:biomad_frontend/store/main.dart';
import 'package:biomad_frontend/store/thunks.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text("asdsad"),
          RaisedButton(
              child: Text("auth"),
              onPressed: () {
                store.dispatch(StoreThunks.authorize(() async {
                  return await api.auth.logIn(LogInWithCredentialsModel(
                      email: "user@example.com", password: "string"));
                }, onSuccess: () {
                  SnackBarExtension.info("Logged in successfully");
                  Keys.rootNavigator.currentState.pushReplacementNamed('/main');
                }, onError: () {
                  print('didnt login');
                }));
              })
        ],
      ),
    );
  }
}
