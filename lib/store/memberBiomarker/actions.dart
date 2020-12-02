import 'package:biomad_frontend/models/memberBiomarkerList.dart';

class SetMemberBiomarkerList {
  final MemberBiomarkerList biomarkers;

  SetMemberBiomarkerList(this.biomarkers);

  @override
  String toString() {
    return 'BiomarkerList -> SetBiomarkerList{BiomarkerList: $biomarkers}';
  }
}