part of api.api;

class SharedModel {
  
  int? memberAnalysisId = null;
  
  List<int>? biomarkerIds = [];
  SharedModel({this.memberAnalysisId, this.biomarkerIds});

  @override
  String toString() {
    return 'SharedModel[memberAnalysisId=$memberAnalysisId, biomarkerIds=$biomarkerIds, ]';
  }

  SharedModel.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    memberAnalysisId = json['memberAnalysisId'];
    biomarkerIds = (json['biomarkerIds'] == null) ?
      null :
      (json['biomarkerIds'] as List).cast<int>();
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (memberAnalysisId != null)
      json['memberAnalysisId'] = memberAnalysisId;
      json['biomarkerIds'] = biomarkerIds;
    return json;
  }

  static List<SharedModel> listFromJson(List<dynamic> json) {
    return json == null ? <SharedModel>[] : json.map((value) => SharedModel.fromJson(value)).toList();
  }

  static Map<String, SharedModel> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, SharedModel>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = SharedModel.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of SharedModel-objects as value to a dart map
  static Map<String, List<SharedModel>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<SharedModel>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = SharedModel.listFromJson(value);
       });
     }
     return map;
  }
}

