import 'package:api/api.dart';
import 'package:biomad_frontend/extensions/snack_bar_extension.dart';
import 'package:biomad_frontend/helper/accept_dialog.dart';
import 'package:biomad_frontend/services/api.dart';
import 'package:biomad_frontend/store/main.dart';
import 'package:biomad_frontend/store/thunks.dart';
import 'package:biomad_frontend/styles/biomad_colors.dart';
import 'package:flutter/material.dart';

class MemberAddScreen extends StatefulWidget {
  final Member member;

  MemberAddScreen({this.member});

  @override
  _MemberAddScreenState createState() => _MemberAddScreenState();
}

class _MemberAddScreenState extends State<MemberAddScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final title = widget.member?.name ?? 'Новый профиль';

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        actions: [
          widget.member != null &&
          widget.member.id != store.state.authorization.currentMemberId
              ? IconButton(
                  icon: Icon(Icons.highlight_remove_outlined,
                      color: BioMadColors.error),
                  tooltip: 'Удалить профиль',
                  onPressed: () {
                    AcceptDialog.show(context, onYes: () async {
                      var res = await api.member.delete(widget.member.id);
                      if (res == false) {
                        SnackBarExtension.error('Не удалось удалить профиль');
                        return;
                      }
                      store.dispatch(StoreThunks.authorize(() async {
                        return await api.auth.refreshToken(
                            RefreshTokenAuthenticationModel(
                                refreshToken: store
                                    .state.authorization.refreshToken.token,
                                userId: store.state.user.id,
                                memberId:
                                    store.state.authorization.currentMemberId));
                      }, onSuccess: () {
                        SnackBarExtension.success('Профиль успешно удален');
                      }, onError: () {
                        SnackBarExtension.error('Не удалось удалить профиль');
                      }));
                      Navigator.of(context).pop();
                    });
                  })
              : Container()
        ],
        title: Text(title, style: TextStyle(color: theme.primaryColor)),
      ),
      body: Container(
        child: RaisedButton(
          child: Text('add'),
          onPressed: () async {
              var res = await api.member
                  .add(MemberModel(name: "Zack Brown", genderId: 1));
              if (res == false) {
                SnackBarExtension.error('Ошибка при добавлении профиля');
                return;
              }
              store.dispatch(StoreThunks.authorize(() async {
                return await api.auth.refreshToken(
                    RefreshTokenAuthenticationModel(
                        refreshToken:
                            store.state.authorization.refreshToken.token,
                        memberId: store.state.authorization.currentMemberId,
                        userId: store.state.user.id));
              }, onError: () {
                SnackBarExtension.error('Ошибка при добавлении пользователя');
              }, onSuccess: () {
                SnackBarExtension.success('Пользщователь успешно добавлен');
              }));
              Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}