part of api.api;

class ConfirmationCode {
  
  int id = null;
  
  String code = null;
  
  Types type = null;
  //enum typeEnum {  0,  1,  };{
  
  bool isConfirmed = null;
  
  String helperValue = null;
  
  int userId = null;
  
  User user = null;
  
  DateTime dateValidUntil = null;
  ConfirmationCode();

  @override
  String toString() {
    return 'ConfirmationCode[id=$id, code=$code, type=$type, isConfirmed=$isConfirmed, helperValue=$helperValue, userId=$userId, user=$user, dateValidUntil=$dateValidUntil, ]';
  }

  ConfirmationCode.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    code = json['code'];
    type = (json['type'] == null) ?
      null :
      Types.fromJson(json['type']);
    isConfirmed = json['isConfirmed'];
    helperValue = json['helperValue'];
    userId = json['userId'];
    user = (json['user'] == null) ?
      null :
      User.fromJson(json['user']);
    dateValidUntil = (json['dateValidUntil'] == null) ?
      null :
      DateTime.parse(json['dateValidUntil']);
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['id'] = id;
      json['code'] = code;
    if (type != null)
      json['type'] = type;
    if (isConfirmed != null)
      json['isConfirmed'] = isConfirmed;
      json['helperValue'] = helperValue;
    if (userId != null)
      json['userId'] = userId;
    if (user != null)
      json['user'] = user;
    if (dateValidUntil != null)
      json['dateValidUntil'] = dateValidUntil == null ? null : dateValidUntil.toUtc().toIso8601String();
    return json;
  }

  static List<ConfirmationCode> listFromJson(List<dynamic> json) {
    return json == null ? List<ConfirmationCode>() : json.map((value) => ConfirmationCode.fromJson(value)).toList();
  }

  static Map<String, ConfirmationCode> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, ConfirmationCode>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = ConfirmationCode.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of ConfirmationCode-objects as value to a dart map
  static Map<String, List<ConfirmationCode>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<ConfirmationCode>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = ConfirmationCode.listFromJson(value);
       });
     }
     return map;
  }
}

