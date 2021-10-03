part of api.api;

class MemberCategoryState {
  
  int? id = null;
  
  double? state = null;
  
  double? difference = null;
  
  int? categoryId = null;
  
  Category? category = null;
  
  int? memberId = null;
  
  DateTime? dateCreatedAt = null;
  MemberCategoryState();

  @override
  String toString() {
    return 'MemberCategoryState[id=$id, state=$state, difference=$difference, categoryId=$categoryId, category=$category, memberId=$memberId, dateCreatedAt=$dateCreatedAt, ]';
  }

  MemberCategoryState.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    id = json['id'];
    state = (json['state'] == null) ?
      null :
      json['state'].toDouble();
    difference = (json['difference'] == null) ?
      null :
      json['difference'].toDouble();
    categoryId = json['categoryId'];
    category = (json['category'] == null) ?
      null :
      Category.fromJson(json['category']);
    memberId = json['memberId'];
    dateCreatedAt = (json['dateCreatedAt'] == null) ?
      null :
      DateTime.parse(json['dateCreatedAt']);
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['id'] = id;
    if (state != null)
      json['state'] = state;
    if (difference != null)
      json['difference'] = difference;
    if (categoryId != null)
      json['categoryId'] = categoryId;
    if (category != null)
      json['category'] = category;
    if (memberId != null)
      json['memberId'] = memberId;
    if (dateCreatedAt != null)
      json['dateCreatedAt'] = dateCreatedAt == null ? null : dateCreatedAt!.toUtc().toIso8601String();
    return json;
  }

  static List<MemberCategoryState> listFromJson(List<dynamic>? json) {
    return json == null ? <MemberCategoryState>[] : json.map((value) => MemberCategoryState.fromJson(value)).toList();
  }

  static Map<String, MemberCategoryState> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, MemberCategoryState>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = MemberCategoryState.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of MemberCategoryState-objects as value to a dart map
  static Map<String, List<MemberCategoryState>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<MemberCategoryState>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = MemberCategoryState.listFromJson(value);
       });
     }
     return map;
  }
}

