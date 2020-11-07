import 'package:biomad_frontend/helpers/color_helpers.dart';
import 'package:biomad_frontend/store/main.dart';
import 'package:biomad_frontend/styles/indents.dart';
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {

  static double indent = Indents.md;
  static double size = 55.0;

  final VoidCallback onAvatarTap;

  NavBar({this.onAvatarTap});

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final member = store.state.authorization?.currentMember;
    final letterInButton = member?.name?.substring(0, 1) ?? '?';
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [

        Container(
          width: NavBar.size,
          child: FittedBox(
            child: FloatingActionButton(
              backgroundColor: ColorHelpers.fromHex(member.color) ?? theme.primaryColor,
              onPressed: () {
                widget.onAvatarTap();
              },
              child: Text(letterInButton, style: theme.textTheme.headline5.merge(TextStyle(color: theme.colorScheme.onPrimary)),),
            ),
          ),
        )
      ],
    );
  }
}
