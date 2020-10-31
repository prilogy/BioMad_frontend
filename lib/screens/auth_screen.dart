import 'package:api/api.dart';
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
                  print('success');
                }, onError: () {
                  print('didnt login');
                }));
              })
        ],
      ),
    );
  }
}
