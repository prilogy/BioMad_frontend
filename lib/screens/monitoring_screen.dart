import 'package:biomad_frontend/containers/category_container.dart';
import 'package:biomad_frontend/store/main.dart';
import 'package:biomad_frontend/store/thunks.dart';
import 'package:biomad_frontend/styles/biomad_colors.dart';
import 'package:biomad_frontend/styles/indents.dart';
import 'package:biomad_frontend/widgets/nav_top_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'biomarker_list_screen.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> navPageBar = ["Моё здоровье", "Биомаркеры"];
  int selectedIndex = 0;

  @override
  void initState() {
    store.dispatch(StoreThunks.authorizeWithRefreshToken());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    store.dispatch(StoreThunks.refreshTypes());

    return Scaffold(
      appBar: AppBar(
        title: NavTopBar(index: 0),
      ),
      body: Scaffold(
          body: Container(
              child: Column(
        children: [
          SizedBox(
              height: 25,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: navPageBar.length,
                  itemBuilder: (context, index) => buildNavTopBar(index))),
          selectedIndex == 0 ? CategoryContainer() : BioMarkerListScreen()
        ],
      ))), // This trailing comma makes auto-formatting nicer for build methods.
    );
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
                  color: selectedIndex == index ? BioMadColors.base : BioMadColors.base.withOpacity(0.7)),
            ),
            Container(
                margin: EdgeInsets.only(top: Indents.sm),
                height: 2,
                width: 40,
                color: selectedIndex == index ? BioMadColors.primary : Colors.transparent),
          ],
        ),
      ),
    );
  }
}
