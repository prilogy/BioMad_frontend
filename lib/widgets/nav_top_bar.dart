import 'package:biomad_frontend/helpers/keys.dart';
import 'package:biomad_frontend/router/main.dart';
import 'package:biomad_frontend/styles/biomad_colors.dart';
import 'package:biomad_frontend/styles/indents.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class NavTopBar extends StatefulWidget {
  final index;
  NavTopBar({Key key, this.index}) : super(key: key);

  @override
  _NavTopBarState createState() => _NavTopBarState(index);
}

class _NavTopBarState extends State<NavTopBar> {
  List<String> navTopBar = [tr('navigation.monitoring'), tr('navigation.analyzes')];
  var navTopBarLink = [Routes.main, Routes.analysis_list];
  int selectedIndex;
  _NavTopBarState(this.selectedIndex);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 25,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: navTopBar.length,
            itemBuilder: (context, index) => buildNavTopBar(index)));
  }

  Widget buildNavTopBar(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
        Keys.rootNavigator.currentState
            .pushReplacementNamed(navTopBarLink[index]);
      },
      child: Padding(
        padding: const EdgeInsets.only(right: Indents.lg),
        child: Text(
          navTopBar[index],
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: selectedIndex == index
                  ? BioMadColors.primary
                  : BioMadColors.primary.withOpacity(0.7)),
        ),
      ),
    );
  }
}
