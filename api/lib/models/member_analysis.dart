part of api.api;

class MemberAnalysis {
  
  int id = null;
  
  String name = null;
  
  String description = null;
  
  DateTime date = null;
  
  int memberId = null;
  
  int labId = null;
  
  Lab lab = null;
  
  List<MemberBiomarker> biomarkers = [];
  
  DateTime dateCreatedAt = null;
  MemberAnalysis();

  @override
  String toString() {
    return 'MemberAnalysis[id=$id, name=$name, description=$description, date=$date, memberId=$memberId, labId=$labId, lab=$lab, biomarkers=$biomarkers, dateCreatedAt=$dateCreatedAt, ]';
  }

  MemberAnalysis.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    name = json['name'];
    description = json['description'];
    date = (json['date'] == null) ?
      null :
      DateTime.parse(json['date']);
    memberId = json['memberId'];
    labId = json['labId'];
    lab = (json['lab'] == null) ?
      null :
      Lab.fromJson(json['lab']);
    biomarkers = (json['biomarkers'] == null) ?
      null :
      MemberBiomarker.listFromJson(json['biomarkers']);
    dateCreatedAt = (json['dateCreatedAt'] == null) ?
      null :
      DateTime.parse(json['dateCreatedAt']);
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['id'] = id;
      json['name'] = name;
      json['description'] = description;
    if (date != null)
      json['date'] = date == null ? null : date.toUtc().toIso8601String();
    if (memberId != null)
      json['memberId'] = memberId;
      json['labId'] = labId;
    if (lab != null)
      json['lab'] = lab;
      json['biomarkers'] = biomarkers;
    if (dateCreatedAt != null)
      json['dateCreatedAt'] = dateCreatedAt == null ? null : dateCreatedAt.toUtc().toIso8601String();
    return json;
  }

  static List<MemberAnalysis> listFromJson(List<dynamic> json) {
    return json == null ? List<MemberAnalysis>() : json.map((value) => MemberAnalysis.fromJson(value)).toList();
  }

  static Map<String, MemberAnalysis> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, MemberAnalysis>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = MemberAnalysis.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of MemberAnalysis-objects as value to a dart map
  static Map<String, List<MemberAnalysis>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<MemberAnalysis>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = MemberAnalysis.listFromJson(value);
       });
     }
     return map;
  }
}

