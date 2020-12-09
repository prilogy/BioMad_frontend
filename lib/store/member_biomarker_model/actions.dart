import 'package:biomad_frontend/models/member_biomarker_list.dart';
import 'package:biomad_frontend/models/member_biomarker_model_list.dart';

class SetMemberBiomarkerModelList {
  final MemberBiomarkerModelList biomarkers;

  SetMemberBiomarkerModelList(this.biomarkers);

  @override
  String toString() {
    return 'BiomarkerModelList -> SetBiomarkerModelList{BiomarkerModelList: $biomarkers}';
  }
}