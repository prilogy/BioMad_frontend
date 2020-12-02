import 'package:api/api.dart';
import 'package:biomad_frontend/models/biomarkerList.dart';
import 'package:biomad_frontend/models/categoryList.dart';
import 'package:biomad_frontend/models/unitList.dart';

class SetBiomarkerList {
  final BiomarkerList biomarkers;

  SetBiomarkerList(this.biomarkers);

  @override
  String toString() {
    return 'BiomarkerList -> SetBiomarkerList{BiomarkerList: $biomarkers}';
  }
}