part of api.api;

class BiomarkerReferenceConfigDependency {
  
  int? id = null;
  
  BiomarkerReferenceConfigDependencyType? type = null;
  //enum typeEnum {  0,  };{
  
  int? rangeId = null;
  
  BiomarkerReferenceConfigDependencyRange? range = null;
  
  int? configId = null;
  
  BiomarkerReferenceConfig? config = null;
  BiomarkerReferenceConfigDependency();

  @override
  String toString() {
    return 'BiomarkerReferenceConfigDependency[id=$id, type=$type, rangeId=$rangeId, range=$range, configId=$configId, config=$config, ]';
  }

  BiomarkerReferenceConfigDependency.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    type = (json['type'] == null) ?
      null :
      BiomarkerReferenceConfigDependencyType.fromJson(json['type']);
    rangeId = json['rangeId'];
    range = (json['range'] == null) ?
      null :
      BiomarkerReferenceConfigDependencyRange.fromJson(json['range']);
    configId = json['configId'];
    config = (json['config'] == null) ?
      null :
      BiomarkerReferenceConfig.fromJson(json['config']);
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['id'] = id;
    if (type != null)
      json['type'] = type;
    if (rangeId != null)
      json['rangeId'] = rangeId;
    if (range != null)
      json['range'] = range;
    if (configId != null)
      json['configId'] = configId;
    if (config != null)
      json['config'] = config;
    return json;
  }

  static List<BiomarkerReferenceConfigDependency> listFromJson(List<dynamic> json) {
    return json == null ? <BiomarkerReferenceConfigDependency>[] : json.map((value) => BiomarkerReferenceConfigDependency.fromJson(value)).toList();
  }

  static Map<String, BiomarkerReferenceConfigDependency> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, BiomarkerReferenceConfigDependency>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = BiomarkerReferenceConfigDependency.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of BiomarkerReferenceConfigDependency-objects as value to a dart map
  static Map<String, List<BiomarkerReferenceConfigDependency>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<BiomarkerReferenceConfigDependency>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = BiomarkerReferenceConfigDependency.listFromJson(value);
       });
     }
     return map;
  }
}

