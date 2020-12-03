part of api.api;

class Member {
  
  int id = null;
  
  String name = null;
  
  String color = null;
  
  DateTime dateCreatedAt = null;
  
  DateTime dateBirthday = null;
  
  int age = null;
  
  int genderId = null;
  
  Gender gender = null;
  
  List<MemberAnalysis> analyzes = [];
  
  List<int> analysisIds = [];
  
  List<MemberCategoryState> categoryStates = [];
  
  int userId = null;
  
  User user = null;
  Member();

  @override
  String toString() {
    return 'Member[id=$id, name=$name, color=$color, dateCreatedAt=$dateCreatedAt, dateBirthday=$dateBirthday, age=$age, genderId=$genderId, gender=$gender, analyzes=$analyzes, analysisIds=$analysisIds, categoryStates=$categoryStates, userId=$userId, user=$user, ]';
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
    gender = (json['gender'] == null) ?
      null :
      Gender.fromJson(json['gender']);
    analyzes = (json['analyzes'] == null) ?
      null :
      MemberAnalysis.listFromJson(json['analyzes']);
    analysisIds = (json['analysisIds'] == null) ?
      null :
      (json['analysisIds'] as List).cast<int>();
    categoryStates = (json['categoryStates'] == null) ?
      null :
      MemberCategoryState.listFromJson(json['categoryStates']);
    userId = json['userId'];
    user = (json['user'] == null) ?
      null :
      User.fromJson(json['user']);
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['id'] = id;
      json['name'] = name;
      json['color'] = color;
    if (dateCreatedAt != null)
      json['dateCreatedAt'] = dateCreatedAt == null ? null : dateCreatedAt.toUtc().toIso8601String();
    if (dateBirthday != null)
      json['dateBirthday'] = dateBirthday == null ? null : dateBirthday.toUtc().toIso8601String();
    if (age != null)
      json['age'] = age;
    if (genderId != null)
      json['genderId'] = genderId;
    if (gender != null)
      json['gender'] = gender;
      json['analyzes'] = analyzes;
      json['analysisIds'] = analysisIds;
      json['categoryStates'] = categoryStates;
    if (userId != null)
      json['userId'] = userId;
    if (user != null)
      json['user'] = user;
    return json;
  }

  static List<Member> listFromJson(List<dynamic> json) {
    return json == null ? List<Member>() : json.map((value) => Member.fromJson(value)).toList();
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

