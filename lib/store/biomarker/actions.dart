import 'package:api/api.dart';
import 'package:biomad_frontend/models/biomarker_list.dart';
import 'package:biomad_frontend/models/category_list.dart';
import 'package:biomad_frontend/models/unit_list.dart';

class SetBiomarkerList {
  final BiomarkerList biomarkers;

  SetBiomarkerList(this.biomarkers);

  @override
  String toString() {
    return 'BiomarkerList -> SetBiomarkerList{BiomarkerList: $biomarkers}';
  }
}