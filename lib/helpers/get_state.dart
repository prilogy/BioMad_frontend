//import 'package:api/api.dart';
//import 'package:biomad_frontend/models/member_biomarker_list.dart';
//import 'package:biomad_frontend/services/api.dart';
//import 'package:biomad_frontend/store/main.dart';
//
//
//
//Future<double> getStateAsync(
//    Category category, List<MemberBiomarker> memberBiomarkers) async {
//  int allBiomarkers = 0;
//  int successfulBiomarkers = 0;
//  MemberBiomarker memberBiomarkerItem;
//  Future<List<Biomarker>> biomarkers = getBiomarker();
//  try {
//    for (var id in category.biomarkerIds) {
//      memberBiomarkerItem =
//          memberBiomarkers.firstWhere((element) => element.biomarkerId == id);
//      if (memberBiomarkerItem != null) {
//        allBiomarkers++;
//        Biomarker biomarkerItem = biomarkers
//            ?.firstWhere((element) => element.id == id);
//        if (biomarkerItem?.state?.value == 2) successfulBiomarkers += 1;
//      }
//    }
//    return successfulBiomarkers != 0 && allBiomarkers != 0
//        ? successfulBiomarkers / allBiomarkers * 100
//        : 0;
//  } catch (e) {
//    return memberBiomarkerList.isLoaded ? 0.1 : null;
//  }
//}
//
////Future<double> getDateOfChanged(int epochTime, ) async {
////  int allBiomarkers = 0;
////  int successfulBiomarkers = 0;
////  try {
////    for (var id in category.biomarkerIds) {
////      MemberBiomarker memberBiomarkerItem = memberBiomarkerList
////          .firstWhere((element) => element.biomarkerId == id);
////
////      if (memberBiomarkerItem != null) {
////        allBiomarkers++;
////        Biomarker biomarkerItem = store.state.biomarkerList.biomarkers
////            .firstWhere((element) => element.id == id);
////        if (biomarkerItem.state.value == 2) successfulBiomarkers += 1;
////      }
////    }
////    return successfulBiomarkers != 0 && allBiomarkers != 0
////        ? successfulBiomarkers / allBiomarkers * 100
////        : 0;
////  } catch (e) {
////    print("Биомаркеры не были добавлены: " + e.toString());
////    return allBiomarkers == 0 ? 0.1 : null;
////  }
