import 'package:biomad_frontend/helpers/color_helpers.dart';
import 'package:biomad_frontend/helpers/keys.dart';
import 'package:biomad_frontend/router/main.dart';
import 'package:biomad_frontend/screens/search_screen.dart';
import 'package:biomad_frontend/screens/search_screen1.dart';
import 'package:biomad_frontend/store/main.dart';
import 'package:biomad_frontend/styles/biomad_colors.dart';
import 'package:biomad_frontend/styles/indents.dart';
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  static double indent = Indents.md;
  static double size = 55.0;

  final bool isSearch;
  final VoidCallback onAvatarTap;

  NavBar({this.onAvatarTap, this.isSearch = true});

  @override
  _NavBarState createState() => _NavBarState(isSearch);
}

class _NavBarState extends State<NavBar> {
  final bool isSearch;

  _NavBarState(this.isSearch);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final member = store.state.authorization?.currentMember;
    final letterInButton = member?.name?.substring(0, 1) ?? '?';
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        isSearch ? Container(
          width: NavBar.size / 1.4,
          decoration: BoxDecoration(
            color: BioMadColors.base[100],
            borderRadius: BorderRadius.all(Radius.circular(40)),
            boxShadow: [
              BoxShadow(
                color: theme.primaryColor.withOpacity(0.15),
                blurRadius: 10,
                offset: Offset(0, 5), // changes position of shadow
              ),
            ],
          ),
          child: FittedBox(
            child: IconButton(
              icon: Icon(
                Icons.search,
                color: theme.primaryColor,
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return SearchScreen(hintText: "Начните набирать", searchType: "all");
                  },
                );
              },
            ),
          ),
        ) : Container(),
        Container(
          width: NavBar.size / 1.4,
          margin: EdgeInsets.symmetric(horizontal: Indents.md),
          decoration: BoxDecoration(
            color: BioMadColors.base[100],
            borderRadius: BorderRadius.all(Radius.circular(40)),
            boxShadow: [
              BoxShadow(
                color: theme.primaryColor.withOpacity(0.15),
                blurRadius: 10,
                offset: Offset(0, 5), // changes position of shadow
              ),
            ],
          ),
          child: FittedBox(
            child: IconButton(
              icon: Icon(
                Icons.add,
                color: theme.primaryColor,
              ),
              onPressed: () {
                store.dispatch(store.state.memberBiomarkerModelList.biomarkers = []);
                Keys.rootNavigator.currentState.pushReplacementNamed(Routes.add_analysis);
              },
            ),
          ),
        ),
        Container(
          width: NavBar.size,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(NavBar.size)),
            boxShadow: [
              BoxShadow(
                color: theme.primaryColor.withOpacity(0.24),
                blurRadius: 10,
                offset: Offset(0, 6), // changes position of shadow
              ),
            ],
          ),
          child: FittedBox(
            child: FloatingActionButton(
              elevation: 0.0,
              backgroundColor: ColorHelpers.fromHex(member.color) ?? theme.primaryColor,
              onPressed: () {
                widget.onAvatarTap();
              },
              child: Text(
                letterInButton,
                style: theme.textTheme.headline5.merge(TextStyle(color: theme.colorScheme.onPrimary)),
              ),
            ),
          ),
        )
      ],
    );
  }
}
