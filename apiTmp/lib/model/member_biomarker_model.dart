part of api.api;

class MemberBiomarkerModel {
  
  double value = null;
  
  int analysisId = null;
  
  int biomarkerId = null;
  
  int unitId = null;
  MemberBiomarkerModel();

  @override
  String toString() {
    return 'MemberBiomarkerModel[value=$value, analysisId=$analysisId, biomarkerId=$biomarkerId, unitId=$unitId, ]';
  }

  MemberBiomarkerModel.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    value = (json['value'] == null) ?
      null :
      json['value'].toDouble();
    analysisId = json['analysisId'];
    biomarkerId = json['biomarkerId'];
    unitId = json['unitId'];
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (value != null)
      json['value'] = value;
    if (analysisId != null)
      json['analysisId'] = analysisId;
    if (biomarkerId != null)
      json['biomarkerId'] = biomarkerId;
    if (unitId != null)
      json['unitId'] = unitId;
    return json;
  }

  static List<MemberBiomarkerModel> listFromJson(List<dynamic> json) {
    return json == null ? List<MemberBiomarkerModel>() : json.map((value) => MemberBiomarkerModel.fromJson(value)).toList();
  }

  static Map<String, MemberBiomarkerModel> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, MemberBiomarkerModel>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = MemberBiomarkerModel.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of MemberBiomarkerModel-objects as value to a dart map
  static Map<String, List<MemberBiomarkerModel>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<MemberBiomarkerModel>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = MemberBiomarkerModel.listFromJson(value);
       });
     }
     return map;
  }
}

