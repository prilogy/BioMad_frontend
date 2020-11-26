import 'package:biomad_frontend/styles/biomad_colors.dart';
import 'package:biomad_frontend/styles/indents.dart';
import 'package:flutter/material.dart';

class NavTopBar extends StatefulWidget {
  @override
  _NavTopBarState createState() => _NavTopBarState();
}

class _NavTopBarState extends State<NavTopBar> {
  List<String> navTopBar = ["Мониторинг", "Анализы", "Заказать"];
  int selectedIndex = 0;

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
