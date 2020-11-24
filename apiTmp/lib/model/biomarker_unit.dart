part of api.api;

class BiomarkerUnit {
  
  int biomarkerId = null;
  
  Biomarker biomarker = null;
  
  int unitId = null;
  
  Unit unit = null;
  BiomarkerUnit();

  @override
  String toString() {
    return 'BiomarkerUnit[biomarkerId=$biomarkerId, biomarker=$biomarker, unitId=$unitId, unit=$unit, ]';
  }

  BiomarkerUnit.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    biomarkerId = json['biomarkerId'];
    biomarker = (json['biomarker'] == null) ?
      null :
      Biomarker.fromJson(json['biomarker']);
    unitId = json['unitId'];
    unit = (json['unit'] == null) ?
      null :
      Unit.fromJson(json['unit']);
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (biomarkerId != null)
      json['biomarkerId'] = biomarkerId;
    if (biomarker != null)
      json['biomarker'] = biomarker;
    if (unitId != null)
      json['unitId'] = unitId;
    if (unit != null)
      json['unit'] = unit;
    return json;
  }

  static List<BiomarkerUnit> listFromJson(List<dynamic> json) {
    return json == null ? List<BiomarkerUnit>() : json.map((value) => BiomarkerUnit.fromJson(value)).toList();
  }

  static Map<String, BiomarkerUnit> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, BiomarkerUnit>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = BiomarkerUnit.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of BiomarkerUnit-objects as value to a dart map
  static Map<String, List<BiomarkerUnit>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<BiomarkerUnit>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = BiomarkerUnit.listFromJson(value);
       });
     }
     return map;
  }
}

