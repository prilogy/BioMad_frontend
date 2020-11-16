part of api.api;

class User {
  
  int id = null;
  
  String email = null;
  
  bool emailIsVerified = null;
  
  String password = null;
  
  DateTime dateCreatedAt = null;
  
  int cultureId = null;
  
  Culture culture = null;
  
  List<Member> members = [];
  
  int currentMemberId = null;
  
  List<SocialAccount> socialAccounts = [];
  
  List<ConfirmationCode> confirmationCodes = [];
  
  int roleId = null;
  
  Role role = null;
  
  List<RefreshToken> refreshTokens = [];
  User();

  @override
  String toString() {
    return 'User[id=$id, email=$email, emailIsVerified=$emailIsVerified, password=$password, dateCreatedAt=$dateCreatedAt, cultureId=$cultureId, culture=$culture, members=$members, currentMemberId=$currentMemberId, socialAccounts=$socialAccounts, confirmationCodes=$confirmationCodes, roleId=$roleId, role=$role, refreshTokens=$refreshTokens, ]';
  }

  User.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    email = json['email'];
    emailIsVerified = json['emailIsVerified'];
    password = json['password'];
    dateCreatedAt = (json['dateCreatedAt'] == null) ?
      null :
      DateTime.parse(json['dateCreatedAt']);
    cultureId = json['cultureId'];
    culture = (json['culture'] == null) ?
      null :
      Culture.fromJson(json['culture']);
    members = (json['members'] == null) ?
      null :
      Member.listFromJson(json['members']);
    currentMemberId = json['currentMemberId'];
    socialAccounts = (json['socialAccounts'] == null) ?
      null :
      SocialAccount.listFromJson(json['socialAccounts']);
    confirmationCodes = (json['confirmationCodes'] == null) ?
      null :
      ConfirmationCode.listFromJson(json['confirmationCodes']);
    roleId = json['roleId'];
    role = (json['role'] == null) ?
      null :
      Role.fromJson(json['role']);
    refreshTokens = (json['refreshTokens'] == null) ?
      null :
      RefreshToken.listFromJson(json['refreshTokens']);
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['id'] = id;
      json['email'] = email;
    if (emailIsVerified != null)
      json['emailIsVerified'] = emailIsVerified;
      json['password'] = password;
    if (dateCreatedAt != null)
      json['dateCreatedAt'] = dateCreatedAt == null ? null : dateCreatedAt.toUtc().toIso8601String();
      json['cultureId'] = cultureId;
    if (culture != null)
      json['culture'] = culture;
      json['members'] = members;
    if (currentMemberId != null)
      json['currentMemberId'] = currentMemberId;
      json['socialAccounts'] = socialAccounts;
      json['confirmationCodes'] = confirmationCodes;
    if (roleId != null)
      json['roleId'] = roleId;
    if (role != null)
      json['role'] = role;
      json['refreshTokens'] = refreshTokens;
    return json;
  }

  static List<User> listFromJson(List<dynamic> json) {
    return json == null ? List<User>() : json.map((value) => User.fromJson(value)).toList();
  }

  static Map<String, User> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, User>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = User.fromJson(value));
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

