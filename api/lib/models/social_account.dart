part of api.api;

class SocialAccount {
  
  int id = null;
  
  String key = null;
  
  DateTime dateCreatedAt = null;
  
  int providerId = null;
  
  SocialAccountProvider provider = null;
  
  int userId = null;
  
  User user = null;
  SocialAccount();

  @override
  String toString() {
    return 'SocialAccount[id=$id, key=$key, dateCreatedAt=$dateCreatedAt, providerId=$providerId, provider=$provider, userId=$userId, user=$user, ]';
  }

  SocialAccount.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    key = json['key'];
    dateCreatedAt = (json['dateCreatedAt'] == null) ?
      null :
      DateTime.parse(json['dateCreatedAt']);
    providerId = json['providerId'];
    provider = (json['provider'] == null) ?
      null :
      SocialAccountProvider.fromJson(json['provider']);
    userId = json['userId'];
    user = (json['user'] == null) ?
      null :
      User.fromJson(json['user']);
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['id'] = id;
      json['key'] = key;
    if (dateCreatedAt != null)
      json['dateCreatedAt'] = dateCreatedAt == null ? null : dateCreatedAt.toUtc().toIso8601String();
    if (providerId != null)
      json['providerId'] = providerId;
    if (provider != null)
      json['provider'] = provider;
      json['userId'] = userId;
    if (user != null)
      json['user'] = user;
    return json;
  }

  static List<SocialAccount> listFromJson(List<dynamic> json) {
    return json == null ? List<SocialAccount>() : json.map((value) => SocialAccount.fromJson(value)).toList();
  }

  static Map<String, SocialAccount> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, SocialAccount>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = SocialAccount.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of SocialAccount-objects as value to a dart map
  static Map<String, List<SocialAccount>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<SocialAccount>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = SocialAccount.listFromJson(value);
       });
     }
     return map;
  }
}

