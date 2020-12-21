//import 'package:api/api.dart';
//import 'package:biomad_frontend/extensions/snack_bar_extension.dart';
//import 'package:biomad_frontend/helpers/indents_mixin.dart';
//import 'package:biomad_frontend/helpers/keys.dart';
//import 'package:biomad_frontend/router/main.dart';
//import 'package:biomad_frontend/services/api.dart';
//import 'package:biomad_frontend/store/main.dart';
//import 'package:biomad_frontend/styles/biomad_colors.dart';
//import 'package:biomad_frontend/styles/indents.dart';
//import 'package:flutter/material.dart';
//
//Widget unitItems(BuildContext context, data) {
//  return Container(
//      height: customBiomarker.length * 30.0,
//      child: ListView.separated(
//        separatorBuilder: (context, index) => Divider(
//          color: Theme.of(context).colorScheme.onSurface,
//        ),
//        padding: EdgeInsets.only(
//          left: Indents.md,
//          right: Indents.md,
//        ),
//        itemCount: customBiomarker.length,
//        itemBuilder: (context, index) => Container(
//            child: Row(
//                mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                children: [
//              Text(
//                customBiomarker[index].content.name,
//                style: Theme.of(context).textTheme.bodyText2.merge(
//                    TextStyle(color: Theme.of(context).colorScheme.onSurface)),
//              ),
//              Row(children: [
//                Text(
//                  customBiomarker[index].reference.valueA.toString() +
//                      " - " +
//                      customBiomarker[index].reference.valueB.toString() +
//                      " " +
//                      store.state.unitList.units
//                          .firstWhere((element) =>
//                              element.id ==
//                              customBiomarker[index].reference.unitId)
//                          .content
//                          .shorthand,
//                  style: Theme.of(context).textTheme.bodyText2.merge(TextStyle(
//                      color: Theme.of(context).colorScheme.onSurface)),
//                ),
//                Container(
//                  width: 20,
//                  height: 20,
//                  child: FittedBox(
//                      alignment: Alignment.center,
//                      fit: BoxFit.fitWidth,
//                      child: IconButton(
//                          icon: Icon(
//                            Icons.clear,
//                            size: 40,
//                            color: BioMadColors.error,
//                          ),
//                          onPressed: () {
//                            api.memberBiomarker
//                                .deleteReference(customBiomarker[index].id);
//                            setState(() {
//                              biomarkers = getBiomarker();
//                              _loadBiomarkers(biomarkers);
//                            });
//                          })),
//                ),
//              ])
//            ])),
//      ));
//}
