part of api.api;

class BiomarkerReferenceConfigDependencyRange {
  
  int id = null;
  
  double lower = null;
  
  double upper = null;
  BiomarkerReferenceConfigDependencyRange();

  @override
  String toString() {
    return 'BiomarkerReferenceConfigDependencyRange[id=$id, lower=$lower, upper=$upper, ]';
  }

  BiomarkerReferenceConfigDependencyRange.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    lower = (json['lower'] == null) ?
      null :
      json['lower'].toDouble();
    upper = (json['upper'] == null) ?
      null :
      json['upper'].toDouble();
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['id'] = id;
    if (lower != null)
      json['lower'] = lower;
    if (upper != null)
      json['upper'] = upper;
    return json;
  }

  static List<BiomarkerReferenceConfigDependencyRange> listFromJson(List<dynamic> json) {
    return json == null ? List<BiomarkerReferenceConfigDependencyRange>() : json.map((value) => BiomarkerReferenceConfigDependencyRange.fromJson(value)).toList();
  }

  static Map<String, BiomarkerReferenceConfigDependencyRange> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, BiomarkerReferenceConfigDependencyRange>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = BiomarkerReferenceConfigDependencyRange.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of BiomarkerReferenceConfigDependencyRange-objects as value to a dart map
  static Map<String, List<BiomarkerReferenceConfigDependencyRange>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<BiomarkerReferenceConfigDependencyRange>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = BiomarkerReferenceConfigDependencyRange.listFromJson(value);
       });
     }
     return map;
  }
}

