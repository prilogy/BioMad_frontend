part of api.api;

class MemberAnalysisModel {
  
  String name = null;
  
  String description = null;
  
  int labId = null;
  
  DateTime date = null;
  
  List<MemberBiomarkerModel> biomarkers = [];
  MemberAnalysisModel({this.name, this.description, this.labId, this.date, this.biomarkers});

  @override
  String toString() {
    return 'MemberAnalysisModel[name=$name, description=$description, labId=$labId, date=$date, biomarkers=$biomarkers, ]';
  }

  MemberAnalysisModel.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    name = json['name'];
    description = json['description'];
    labId = json['labId'];
    date = (json['date'] == null) ?
      null :
      DateTime.parse(json['date']);
    biomarkers = (json['biomarkers'] == null) ?
      null :
      MemberBiomarkerModel.listFromJson(json['biomarkers']);
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
      json['name'] = name;
      json['description'] = description;
    if (labId != null)
      json['labId'] = labId;
    if (date != null)
      json['date'] = date == null ? null : date.toUtc().toIso8601String();
      json['biomarkers'] = biomarkers;
    return json;
  }

  static List<MemberAnalysisModel> listFromJson(List<dynamic> json) {
    return json == null ? List<MemberAnalysisModel>() : json.map((value) => MemberAnalysisModel.fromJson(value)).toList();
  }

  static Map<String, MemberAnalysisModel> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, MemberAnalysisModel>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = MemberAnalysisModel.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of MemberAnalysisModel-objects as value to a dart map
  static Map<String, List<MemberAnalysisModel>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<MemberAnalysisModel>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = MemberAnalysisModel.listFromJson(value);
       });
     }
     return map;
  }
}

