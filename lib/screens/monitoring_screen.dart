import 'package:api/api.dart';
import 'package:biomad_frontend/containers/category_container.dart';
import 'package:biomad_frontend/helpers/no_ripple_scroll_behaviour.dart';
import 'package:biomad_frontend/services/api.dart';
import 'package:biomad_frontend/store/main.dart';
import 'package:biomad_frontend/store/thunks.dart';
import 'package:biomad_frontend/styles/biomad_colors.dart';
import 'package:biomad_frontend/styles/indents.dart';
import 'package:biomad_frontend/widgets/nav_top_bar.dart';
import 'package:biomad_frontend/widgets/on_load_container.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'biomarker_list_screen.dart';

class MyHomePage extends StatefulWidget {
  final int duration;

  MyHomePage({Key key, this.duration = 10}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState(this.duration);
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> navPageBar = [tr('navigation.my_health'), tr('navigation.biomarkers')];
  int selectedIndex = 0;
  int duration;
  bool changed = false;

  _MyHomePageState(this.duration);

  Future<List<Category>> getCategories() async {
    return await api.category.info();
  }

  Future<List<Biomarker>> getBiomarker() async {
    return await api.biomarker.info();
  }

  Future<List<MemberBiomarker>> getMemberBiomarker() async {
    return await api.memberBiomarker.info();
  }

  Future<List<BiomarkerType>> getType() async {
    return await api.biomarker.type();
  }

  List<Category> categories;
  List<MemberBiomarker> memberBiomarkers;
  List<Biomarker> biomarkers;
  List<BiomarkerType> types;

  @override
  void initState() {
    store.dispatch(StoreThunks.authorizeWithRefreshToken());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
          FutureBuilder(
              future: Future.delayed(Duration(milliseconds: selectedIndex == 0 ? changed ? 0 : duration ?? 0 : 0)),
              builder: (c, s) => s.connectionState == ConnectionState.done
                  ? FutureBuilder(
                      future: Future.wait([
                        getCategories(),
                        getBiomarker(),
                        getMemberBiomarker(),
                        getType(),
                      ]),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          categories = snapshot.data[0];
                          biomarkers = snapshot.data[1];
                          memberBiomarkers = snapshot.data[2];
                          types = snapshot.data[3];

                          if(selectedIndex == 0){
                            return CategoryContainer(
                              categories: categories,
                              memberBiomarkers: memberBiomarkers,
                              biomarkers: biomarkers,
                            );
                          }else{
                            changed = true;
                            return BioMarkerListScreen(
                              types: types,
                              memberBiomarkers: memberBiomarkers,
                              biomarkers: biomarkers,
                            );
                          }
                        } else {
                          return ScrollConfiguration(
                              behavior: NoRippleScrollBehaviour(),
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: 4,
                                  itemBuilder: (context, index) => OnLoadContainer(
                                        index: index,
                                        color: BioMadColors.base[200],
                                      )));
                        }
                      })
                  : ScrollConfiguration(
                      behavior: NoRippleScrollBehaviour(),
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: 4,
                          itemBuilder: (context, index) => OnLoadContainer(
                                index: index,
                                color: BioMadColors.base[200],
                              )))),
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
        padding: index == 0 ? EdgeInsets.only(left: Indents.slg, right: Indents.md) : EdgeInsets.symmetric(horizontal: Indents.md),
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
