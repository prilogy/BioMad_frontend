import 'package:biomad_frontend/styles/biomad_colors.dart';
import 'package:biomad_frontend/styles/indents.dart';
import 'package:flutter/material.dart';

class NavPageBar extends StatefulWidget {
  @override
  _NavPageBarState createState() => _NavPageBarState();
}

class _NavPageBarState extends State<NavPageBar> {
  List<String> navPageBar = ["Моё здоровье", "Тенденция", "Биомаркеры"];
  int selectedIndex = 0;

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