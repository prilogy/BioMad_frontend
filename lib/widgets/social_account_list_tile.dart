import 'package:api/api.dart';
import 'package:biomad_frontend/extensions/snack_bar_extension.dart';
import 'package:biomad_frontend/helpers/i18n_helper.dart';
import 'package:biomad_frontend/screens/auth_screen/login_screen.dart';
import 'package:biomad_frontend/services/api.dart';
import 'package:biomad_frontend/services/social_auth.dart';
import 'package:biomad_frontend/store/main.dart';
import 'package:biomad_frontend/store/thunks.dart';
import 'package:biomad_frontend/styles/indents.dart';
import 'package:collection/collection.dart' show IterableExtension;
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'custom/custom_button.dart';
import 'custom/custom_list_tile.dart';

class SocialAccountListTile extends StatelessWidget {
  final SocialAccountProvider model;

  SocialAccountListTile(this.model);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    String? svgPath;
    Color? color;
    double? size;
    late Future<String?> Function() tokenGetter;

    if (model.name == SocialAccountProvider.google.name) {
      svgPath = GoogleAuthService.svgPath;
      color = GoogleAuthService.color;
      size = GoogleAuthService.size;
      tokenGetter = () async {
        var googleAuth = GoogleAuthService();
        return await googleAuth.getToken();
      };
    } else if (model.name == SocialAccountProvider.vk.name) {
      svgPath = VkAuthService.svgPath;
      color = VkAuthService.color;
      size = VkAuthService.size;
      tokenGetter = () async {
        var vkAuth = VkAuthService();
        return await vkAuth.getToken();
      };
    }

    final bool isConnected = store.state.user!.socialAccounts!.firstWhereOrNull((x) => x.provider!.name == model.name) != null;

    final String Function(String, {List<String> args, BuildContext context, String gender, Map<String, String> namedArgs}) _tr = trWithKey('account_container');

    return CustomListTile(
      prepend: Row(
        children: [
          Padding(
              padding: EdgeInsets.only(right: Indents.md),
              child: SocialAuthIcon(
                backgroundColor: color,
                svgPath: svgPath,
                shadowColor: model.name == SocialAccountProvider.google.name ? Colors.grey : color,
                svgSize: size,
                onPressed: () {},
)              ),
          Text(model.name!, style: theme.textTheme.subtitle1),
        ],
      ),
      append: CustomButton.flat(
        text: isConnected ? tr('misc.disconnect') : tr('misc.connect'),
        textColor: isConnected ? theme.errorColor : theme.primaryColor,
        onPressed: () async {
          if(isConnected) {
            var r = await api.socialAccount.remove(model.name!);
            if(r)
              SnackBarExtension.success(_tr('social_disconnect_success'));
            else SnackBarExtension.error(_tr('social_disconnect_error'));
          }
          else {
            final token = await tokenGetter();
            if(token == null) {
              SnackBarExtension.error(_tr('social_connect_error'));
              return;
            }

            var r = await api.socialAccount.add(token, model.name!);
            if(r)
              SnackBarExtension.success(_tr('social_connect_success'));
            else SnackBarExtension.error(_tr('social_connect_error'));
          }
          store.dispatch(StoreThunks.authorizeWithRefreshToken());
        },
      ),
    );
  }

}
