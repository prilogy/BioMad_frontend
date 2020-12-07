import 'package:biomad_frontend/models/member_biomarker_list.dart';

class SetMemberBiomarkerList {
  final MemberBiomarkerList biomarkers;

  SetMemberBiomarkerList(this.biomarkers);

  @override
  String toString() {
    return 'BiomarkerList -> SetBiomarkerList{BiomarkerList: $biomarkers}';
  }
}