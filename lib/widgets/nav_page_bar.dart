import 'package:biomad_frontend/helpers/keys.dart';
import 'package:biomad_frontend/router/main.dart';
import 'package:biomad_frontend/styles/biomad_colors.dart';
import 'package:biomad_frontend/styles/indents.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class NavPageBar extends StatefulWidget {
  final index;

  NavPageBar({Key? key, this.index}) : super(key: key);

  @override
  _NavPageBarState createState() => _NavPageBarState(index);
}

class _NavPageBarState extends State<NavPageBar> {
  List<String> navPageBar = [tr('navigation.my_health'), tr('navigation.biomarkers')];
  int? selectedIndex;

  _NavPageBarState(this.selectedIndex);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 25,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: navPageBar.length,
            itemBuilder: (context, index) => buildNavTopBar(index)));
  }

  Widget buildNavTopBar(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
          if (navPageBar[index] == tr('navigation.biomarkers')) {
            Keys.rootNavigator.currentState!
                .pushReplacementNamed(Routes.biomarker_list);
          } else {
            Keys.rootNavigator.currentState!.pushReplacementNamed(Routes.main);
          }
        });
      },
      child: Padding(
        padding: index == 0
            ? EdgeInsets.only(left: Indents.slg, right: Indents.md)
            : EdgeInsets.symmetric(horizontal: Indents.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              navPageBar[index],
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: selectedIndex == index
                      ? BioMadColors.base
                      : BioMadColors.base.withOpacity(0.7)),
            ),
            Container(
                margin: EdgeInsets.only(top: Indents.sm),
                height: 2,
                width: 40,
                color: selectedIndex == index
                    ? BioMadColors.primary
                    : Colors.transparent),
          ],
        ),
      ),
    );
  }
}
