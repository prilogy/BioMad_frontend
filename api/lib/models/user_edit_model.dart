part of api.api;

class UserEditModel {
  
  String? email = null;
  UserEditModel();

  @override
  String toString() {
    return 'UserEditModel[email=$email, ]';
  }

  UserEditModel.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
      json['email'] = email;
    return json;
  }

  static List<UserEditModel> listFromJson(List<dynamic> json) {
    return json == null ? <UserEditModel>[] : json.map((value) => UserEditModel.fromJson(value)).toList();
  }

  static Map<String, UserEditModel> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, UserEditModel>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = UserEditModel.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of UserEditModel-objects as value to a dart map
  static Map<String, List<UserEditModel>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<UserEditModel>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = UserEditModel.listFromJson(value);
       });
     }
     return map;
  }
}

