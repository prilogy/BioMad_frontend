part of api.api;

class Unit {
  
  int? id = null;
  
  UnitTranslation? content = null;
  
  List<int>? transfersToIds = [];
  
  List<int>? transfersFromIds = [];
  Unit();

  @override
  String toString() {
    return 'Unit[id=$id, content=$content, transfersToIds=$transfersToIds, transfersFromIds=$transfersFromIds, ]';
  }

  Unit.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    id = json['id'];
    content = (json['content'] == null) ?
      null :
      UnitTranslation.fromJson(json['content']);
    transfersToIds = (json['transfersToIds'] == null) ?
      null :
      (json['transfersToIds'] as List).cast<int>();
    transfersFromIds = (json['transfersFromIds'] == null) ?
      null :
      (json['transfersFromIds'] as List).cast<int>();
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['id'] = id;
    if (content != null)
      json['content'] = content;
      json['transfersToIds'] = transfersToIds;
      json['transfersFromIds'] = transfersFromIds;
    return json;
  }

  static List<Unit> listFromJson(List<dynamic>? json) {
    return json == null ? <Unit>[] : json.map((value) => Unit.fromJson(value)).toList();
  }

  static Map<String, Unit> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, Unit>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = Unit.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of Unit-objects as value to a dart map
  static Map<String, List<Unit>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<Unit>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = Unit.listFromJson(value);
       });
     }
     return map;
  }
}

