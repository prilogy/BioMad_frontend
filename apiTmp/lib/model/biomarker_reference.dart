part of api.api;

class BiomarkerReference {
  
  int id = null;
  
  double valueA = null;
  
  double valueB = null;
  
  int unitId = null;
  
  Unit unit = null;
  
  int biomarkerId = null;
  
  Biomarker biomarker = null;
  
  BiomarkerReferenceConfig config = null;
  BiomarkerReference();

  @override
  String toString() {
    return 'BiomarkerReference[id=$id, valueA=$valueA, valueB=$valueB, unitId=$unitId, unit=$unit, biomarkerId=$biomarkerId, biomarker=$biomarker, config=$config, ]';
  }

  BiomarkerReference.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    valueA = (json['valueA'] == null) ?
      null :
      json['valueA'].toDouble();
    valueB = (json['valueB'] == null) ?
      null :
      json['valueB'].toDouble();
    unitId = json['unitId'];
    unit = (json['unit'] == null) ?
      null :
      Unit.fromJson(json['unit']);
    biomarkerId = json['biomarkerId'];
    biomarker = (json['biomarker'] == null) ?
      null :
      Biomarker.fromJson(json['biomarker']);
    config = (json['config'] == null) ?
      null :
      BiomarkerReferenceConfig.fromJson(json['config']);
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['id'] = id;
    if (valueA != null)
      json['valueA'] = valueA;
    if (valueB != null)
      json['valueB'] = valueB;
    if (unitId != null)
      json['unitId'] = unitId;
    if (unit != null)
      json['unit'] = unit;
    if (biomarkerId != null)
      json['biomarkerId'] = biomarkerId;
    if (biomarker != null)
      json['biomarker'] = biomarker;
    if (config != null)
      json['config'] = config;
    return json;
  }

  static List<BiomarkerReference> listFromJson(List<dynamic> json) {
    return json == null ? List<BiomarkerReference>() : json.map((value) => BiomarkerReference.fromJson(value)).toList();
  }

  static Map<String, BiomarkerReference> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, BiomarkerReference>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = BiomarkerReference.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of BiomarkerReference-objects as value to a dart map
  static Map<String, List<BiomarkerReference>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<BiomarkerReference>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = BiomarkerReference.listFromJson(value);
       });
     }
     return map;
  }
}

