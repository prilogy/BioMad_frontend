part of api.api;

class BiomarkerReference {
  
  int id = null;
  
  double valueA = null;
  
  double valueB = null;
  
  int unitId = null;
  
  int biomarkerId = null;
  
  bool isOwnReference = null;
  
  BiomarkerReferenceConfig config = null;
  BiomarkerReference();

  @override
  String toString() {
    return 'BiomarkerReference[id=$id, valueA=$valueA, valueB=$valueB, unitId=$unitId, biomarkerId=$biomarkerId, isOwnReference=$isOwnReference, config=$config, ]';
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
    biomarkerId = json['biomarkerId'];
    isOwnReference = json['isOwnReference'];
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
    if (biomarkerId != null)
      json['biomarkerId'] = biomarkerId;
    if (isOwnReference != null)
      json['isOwnReference'] = isOwnReference;
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

