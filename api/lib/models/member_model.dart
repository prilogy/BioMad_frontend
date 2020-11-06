part of api.api;

class MemberModel {
  String name = null;
  int genderId = null;
  DateTime dateBirthday = null;
  MemberModel({this.name, this.genderId, this.dateBirthday});

  @override
  String toString() {
    return 'MemberModel[name=$name, genderId=$genderId, dateBirthday=$dateBirthday, ]';
  }

  MemberModel.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    name = json['name'];
    genderId = json['genderId'];
    dateBirthday = (json['dateBirthday'] == null) ?
      null :
      DateTime.parse(json['dateBirthday']);
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (name != null)
      json['name'] = name;
    if (genderId != null)
      json['genderId'] = genderId;
    if (dateBirthday != null)
      json['dateBirthday'] = dateBirthday == null ? null : dateBirthday.toUtc().toIso8601String();
    return json;
  }

  static List<MemberModel> listFromJson(List<dynamic> json) {
    return json == null ? List<MemberModel>() : json.map((value) => MemberModel.fromJson(value)).toList();
  }

  static Map<String, MemberModel> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, MemberModel>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = MemberModel.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of MemberModel-objects as value to a dart map
  static Map<String, List<MemberModel>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<MemberModel>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = MemberModel.listFromJson(value);
       });
     }
     return map;
  }
}

