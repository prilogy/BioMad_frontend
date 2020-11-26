part of api.api;

class MemberBiomarker {
  
  int id = null;
  
  double value = null;
  
  DateTime dateCreatedAt = null;
  
  int unitId = null;
  
  Unit unit = null;
  
  int biomarkerId = null;
  
  Biomarker biomarker = null;
  
  int analysisId = null;
  
  MemberAnalysis analysis = null;
  MemberBiomarker();

  @override
  String toString() {
    return 'MemberBiomarker[id=$id, value=$value, dateCreatedAt=$dateCreatedAt, unitId=$unitId, unit=$unit, biomarkerId=$biomarkerId, biomarker=$biomarker, analysisId=$analysisId, analysis=$analysis, ]';
  }

  MemberBiomarker.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    value = (json['value'] == null) ?
      null :
      json['value'].toDouble();
    dateCreatedAt = (json['dateCreatedAt'] == null) ?
      null :
      DateTime.parse(json['dateCreatedAt']);
    unitId = json['unitId'];
    unit = (json['unit'] == null) ?
      null :
      Unit.fromJson(json['unit']);
    biomarkerId = json['biomarkerId'];
    biomarker = (json['biomarker'] == null) ?
      null :
      Biomarker.fromJson(json['biomarker']);
    analysisId = json['analysisId'];
    analysis = (json['analysis'] == null) ?
      null :
      MemberAnalysis.fromJson(json['analysis']);
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['id'] = id;
    if (value != null)
      json['value'] = value;
    if (dateCreatedAt != null)
      json['dateCreatedAt'] = dateCreatedAt == null ? null : dateCreatedAt.toUtc().toIso8601String();
    if (unitId != null)
      json['unitId'] = unitId;
    if (unit != null)
      json['unit'] = unit;
    if (biomarkerId != null)
      json['biomarkerId'] = biomarkerId;
    if (biomarker != null)
      json['biomarker'] = biomarker;
    if (analysisId != null)
      json['analysisId'] = analysisId;
    if (analysis != null)
      json['analysis'] = analysis;
    return json;
  }

  static List<MemberBiomarker> listFromJson(List<dynamic> json) {
    return json == null ? List<MemberBiomarker>() : json.map((value) => MemberBiomarker.fromJson(value)).toList();
  }

  static Map<String, MemberBiomarker> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, MemberBiomarker>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = MemberBiomarker.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of MemberBiomarker-objects as value to a dart map
  static Map<String, List<MemberBiomarker>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<MemberBiomarker>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = MemberBiomarker.listFromJson(value);
       });
     }
     return map;
  }
}

