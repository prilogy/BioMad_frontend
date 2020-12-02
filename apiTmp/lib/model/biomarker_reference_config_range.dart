part of api.api;

class BiomarkerReferenceConfigRange {
  
  int id = null;
  
  double lower = null;
  
  double upper = null;
  BiomarkerReferenceConfigRange();

  @override
  String toString() {
    return 'BiomarkerReferenceConfigRange[id=$id, lower=$lower, upper=$upper, ]';
  }

  BiomarkerReferenceConfigRange.fromJson(Map<String, dynamic> json) {
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

  static List<BiomarkerReferenceConfigRange> listFromJson(List<dynamic> json) {
    return json == null ? List<BiomarkerReferenceConfigRange>() : json.map((value) => BiomarkerReferenceConfigRange.fromJson(value)).toList();
  }

  static Map<String, BiomarkerReferenceConfigRange> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, BiomarkerReferenceConfigRange>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = BiomarkerReferenceConfigRange.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of BiomarkerReferenceConfigRange-objects as value to a dart map
  static Map<String, List<BiomarkerReferenceConfigRange>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<BiomarkerReferenceConfigRange>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = BiomarkerReferenceConfigRange.listFromJson(value);
       });
     }
     return map;
  }
}

