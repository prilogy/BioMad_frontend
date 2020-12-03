part of api.api;

class BiomarkerReferenceConfig {
  
  int id = null;
  
  int referenceId = null;
  
  BiomarkerReference reference = null;
  
  int ageRangeId = null;
  
  BiomarkerReferenceConfigRange ageRange = null;
  
  int genderId = null;
  
  Gender gender = null;
  BiomarkerReferenceConfig();

  @override
  String toString() {
    return 'BiomarkerReferenceConfig[id=$id, referenceId=$referenceId, reference=$reference, ageRangeId=$ageRangeId, ageRange=$ageRange, genderId=$genderId, gender=$gender, ]';
  }

  BiomarkerReferenceConfig.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    referenceId = json['referenceId'];
    reference = (json['reference'] == null) ?
      null :
      BiomarkerReference.fromJson(json['reference']);
    ageRangeId = json['ageRangeId'];
    ageRange = (json['ageRange'] == null) ?
      null :
      BiomarkerReferenceConfigRange.fromJson(json['ageRange']);
    genderId = json['genderId'];
    gender = (json['gender'] == null) ?
      null :
      Gender.fromJson(json['gender']);
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['id'] = id;
    if (referenceId != null)
      json['referenceId'] = referenceId;
    if (reference != null)
      json['reference'] = reference;
      json['ageRangeId'] = ageRangeId;
    if (ageRange != null)
      json['ageRange'] = ageRange;
    if (genderId != null)
      json['genderId'] = genderId;
    if (gender != null)
      json['gender'] = gender;
    return json;
  }

  static List<BiomarkerReferenceConfig> listFromJson(List<dynamic> json) {
    return json == null ? List<BiomarkerReferenceConfig>() : json.map((value) => BiomarkerReferenceConfig.fromJson(value)).toList();
  }

  static Map<String, BiomarkerReferenceConfig> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, BiomarkerReferenceConfig>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = BiomarkerReferenceConfig.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of BiomarkerReferenceConfig-objects as value to a dart map
  static Map<String, List<BiomarkerReferenceConfig>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<BiomarkerReferenceConfig>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = BiomarkerReferenceConfig.listFromJson(value);
       });
     }
     return map;
  }
}

