import 'package:biomad_frontend/models/biomarker_type_list.dart';

class SetBiomarkerTypeList {
  final BiomarkerTypeList biomarkerTypes;

  SetBiomarkerTypeList(this.biomarkerTypes);

  @override
  String toString() {
    return 'BiomarkerTypeList -> SetBiomarkerTypeList{BiomarkerTypeList: $biomarkerTypes}';
  }
}