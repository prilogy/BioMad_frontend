import 'package:api/api.dart';
import 'package:biomad_frontend/models/analysis_list.dart';
import 'package:biomad_frontend/models/category_list.dart';
import 'package:biomad_frontend/models/unit_list.dart';

class SetMemberAnalysisList {
  final MemberAnalysisList memberAnalysis;

  SetMemberAnalysisList(this.memberAnalysis);

  @override
  String toString() {
    return 'MemberAnalysisList -> SetMemberAnalysisList{MemberAnalysisList: $memberAnalysis}';
  }
}