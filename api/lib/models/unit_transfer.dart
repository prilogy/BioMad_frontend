part of api.api;

class UnitTransfer {
  
  int id = null;
  
  int unitAId = null;
  
  Unit unitA = null;
  
  int unitBId = null;
  
  Unit unitB = null;
  /* UnitA is UnitB * Coefficient */
  double coefficient = null;
  UnitTransfer();

  @override
  String toString() {
    return 'UnitTransfer[id=$id, unitAId=$unitAId, unitA=$unitA, unitBId=$unitBId, unitB=$unitB, coefficient=$coefficient, ]';
  }

  UnitTransfer.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    unitAId = json['unitAId'];
    unitA = (json['unitA'] == null) ?
      null :
      Unit.fromJson(json['unitA']);
    unitBId = json['unitBId'];
    unitB = (json['unitB'] == null) ?
      null :
      Unit.fromJson(json['unitB']);
    coefficient = (json['coefficient'] == null) ?
      null :
      json['coefficient'].toDouble();
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['id'] = id;
    if (unitAId != null)
      json['unitAId'] = unitAId;
    if (unitA != null)
      json['unitA'] = unitA;
    if (unitBId != null)
      json['unitBId'] = unitBId;
    if (unitB != null)
      json['unitB'] = unitB;
    if (coefficient != null)
      json['coefficient'] = coefficient;
    return json;
  }

  static List<UnitTransfer> listFromJson(List<dynamic> json) {
    return json == null ? List<UnitTransfer>() : json.map((value) => UnitTransfer.fromJson(value)).toList();
  }

  static Map<String, UnitTransfer> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, UnitTransfer>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = UnitTransfer.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of UnitTransfer-objects as value to a dart map
  static Map<String, List<UnitTransfer>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<UnitTransfer>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = UnitTransfer.listFromJson(value);
       });
     }
     return map;
  }
}

