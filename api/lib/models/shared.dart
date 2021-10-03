part of api.api;

class Shared {
  
  int? id = null;
  
  String? token = null;
  
  DateTime? dateCreatedAt = null;
  
  String? url = null;
  
  int? memberId = null;
  
  List<int>? biomarkerIds = [];
  Shared();

  @override
  String toString() {
    return 'Shared[id=$id, token=$token, dateCreatedAt=$dateCreatedAt, url=$url, memberId=$memberId, biomarkerIds=$biomarkerIds, ]';
  }

  Shared.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    id = json['id'];
    token = json['token'];
    dateCreatedAt = (json['dateCreatedAt'] == null) ?
      null :
      DateTime.parse(json['dateCreatedAt']);
    url = json['url'];
    memberId = json['memberId'];
    biomarkerIds = (json['biomarkerIds'] == null) ?
      null :
      (json['biomarkerIds'] as List).cast<int>();
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['id'] = id;
      json['token'] = token;
    if (dateCreatedAt != null)
      json['dateCreatedAt'] = dateCreatedAt == null ? null : dateCreatedAt!.toUtc().toIso8601String();
      json['url'] = url;
    if (memberId != null)
      json['memberId'] = memberId;
      json['biomarkerIds'] = biomarkerIds;
    return json;
  }

  static List<Shared> listFromJson(List<dynamic>? json) {
    return json == null ? <Shared>[] : json.map((value) => Shared.fromJson(value)).toList();
  }

  static Map<String, Shared> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, Shared>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = Shared.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of Shared-objects as value to a dart map
  static Map<String, List<Shared>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<Shared>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = Shared.listFromJson(value);
       });
     }
     return map;
  }
}

