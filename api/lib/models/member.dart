part of api.api;

class Member {
  
  int? id = null;
  
  String? name = null;
  
  String? color = null;
  
  DateTime? dateCreatedAt = null;
  
  DateTime? dateBirthday = null;
  
  int? age = null;
  
  int? genderId = null;
  
  List<int>? analysisIds = [];
  Member();

  @override
  String toString() {
    return 'Member[id=$id, name=$name, color=$color, dateCreatedAt=$dateCreatedAt, dateBirthday=$dateBirthday, age=$age, genderId=$genderId, analysisIds=$analysisIds, ]';
  }

  Member.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    name = json['name'];
    color = json['color'];
    dateCreatedAt = (json['dateCreatedAt'] == null) ?
      null :
      DateTime.parse(json['dateCreatedAt']);
    dateBirthday = (json['dateBirthday'] == null) ?
      null :
      DateTime.parse(json['dateBirthday']);
    age = json['age'];
    genderId = json['genderId'];
    analysisIds = (json['analysisIds'] == null) ?
      null :
      (json['analysisIds'] as List).cast<int>();
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['id'] = id;
      json['name'] = name;
      json['color'] = color;
    if (dateCreatedAt != null)
      json['dateCreatedAt'] = dateCreatedAt == null ? null : dateCreatedAt!.toUtc().toIso8601String();
    if (dateBirthday != null)
      json['dateBirthday'] = dateBirthday == null ? null : dateBirthday!.toUtc().toIso8601String();
    if (age != null)
      json['age'] = age;
    if (genderId != null)
      json['genderId'] = genderId;
      json['analysisIds'] = analysisIds;
    return json;
  }

  static List<Member> listFromJson(List<dynamic>? json) {
    return json == null ? <Member>[] : json.map((value) => Member.fromJson(value)).toList();
  }

  static Map<String, Member> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, Member>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = Member.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of Member-objects as value to a dart map
  static Map<String, List<Member>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<Member>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = Member.listFromJson(value);
       });
     }
     return map;
  }
}

