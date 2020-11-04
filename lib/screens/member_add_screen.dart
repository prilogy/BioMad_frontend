import 'package:api/api.dart';
import 'package:biomad_frontend/extensions/snack_bar_extension.dart';
import 'package:biomad_frontend/helper/accept_dialog.dart';
import 'package:biomad_frontend/services/api.dart';
import 'package:biomad_frontend/store/main.dart';
import 'package:biomad_frontend/store/thunks.dart';
import 'package:biomad_frontend/styles/biomad_colors.dart';
import 'package:biomad_frontend/widgets/block_base_widget.dart';
import 'package:biomad_frontend/widgets/custom_text_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class MemberAddScreen extends StatefulWidget {
  final Member member;

  MemberAddScreen({this.member});

  @override
  _MemberAddScreenState createState() => _MemberAddScreenState();
}

class _MemberAddScreenState extends State<MemberAddScreen> {
  final _nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
        child: Column(
          children: [
            BlockBaseWidget(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextFormField(
                      controller: _nameController,
                      labelText: tr('input_hint.name'),
                      icon: Icon(Icons.account_circle_outlined),
                      formValidator: () {
                        return _formKey?.currentState?.validate();;
                      },
                    ),
                    CustomTextFormField(
                      controller: _nameController,
                      labelText: tr('input_hint.name'),
                      icon: Icon(Icons.account_circle_outlined),
                      formValidator: () {
                        return _formKey?.currentState?.validate();
                      },
                    )
                  ],
                ),
              ),
            ),
            RaisedButton(
              child: Text('add'),
              onPressed: () async {
                if (!_formKey.currentState.validate()) return;
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
          ],
        ),
      ),
    );
  }
}
