part of api.api;

class User {
  int id = null;

  String email = null;

  String password = null;

  DateTime dateCreatedAt = null;

  List<Member> members = [];

  int currentMemberId = null;

  List<SocialAccount> socialAccounts = [];

  int roleId = null;

  Role role = null;

  List<RefreshToken> refreshTokens = [];

  User();

  @override
  String toString() {
    return 'User[id=$id, email=$email, password=$password, dateCreatedAt=$dateCreatedAt, members=$members, currentMemberId=$currentMemberId, socialAccounts=$socialAccounts, roleId=$roleId, role=$role, refreshTokens=$refreshTokens, ]';
  }

  User.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    email = json['email'];
    password = json['password'];
    dateCreatedAt = (json['dateCreatedAt'] == null)
        ? null
        : DateTime.parse(json['dateCreatedAt']);
    members =
        (json['members'] == null) ? null : Member.listFromJson(json['members']);
    currentMemberId = json['currentMemberId'];
    socialAccounts = (json['socialAccounts'] == null)
        ? null
        : SocialAccount.listFromJson(json['socialAccounts']);
    roleId = json['roleId'];
    role = (json['role'] == null) ? null : Role.fromJson(json['role']);
    refreshTokens = (json['refreshTokens'] == null)
        ? null
        : RefreshToken.listFromJson(json['refreshTokens']);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (id != null) json['id'] = id;
    json['email'] = email;
    json['password'] = password;
    if (dateCreatedAt != null)
      json['dateCreatedAt'] = dateCreatedAt == null
          ? null
          : dateCreatedAt.toUtc().toIso8601String();
    json['members'] = members;
    if (currentMemberId != null) json['currentMemberId'] = currentMemberId;
    json['socialAccounts'] = socialAccounts;
    if (roleId != null) json['roleId'] = roleId;
    if (role != null) json['role'] = role;
    json['refreshTokens'] = refreshTokens;
    return json;
  }

  static List<User> listFromJson(List<dynamic> json) {
    return json == null
        ? List<User>()
        : json.map((value) => User.fromJson(value)).toList();
  }

  static Map<String, User> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, User>();
    if (json != null && json.isNotEmpty) {
      json.forEach(
          (String key, dynamic value) => map[key] = User.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of User-objects as value to a dart map
  static Map<String, List<User>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<User>>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) {
        map[key] = User.listFromJson(value);
      });
    }
    return map;
  }
}
