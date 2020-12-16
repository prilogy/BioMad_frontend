part of api.api;

class MemberBiomarkerReferenceModel {
  double valueA = null;

  double valueB = null;

  int unitId = null;

  int biomarkerId = null;

  MemberBiomarkerReferenceModel(
      {this.valueA, this.valueB, this.unitId, this.biomarkerId});

  @override
  String toString() {
    return 'MemberBiomarkerReferenceModel[valueA=$valueA, valueB=$valueB, unitId=$unitId, biomarkerId=$biomarkerId, ]';
  }

  MemberBiomarkerReferenceModel.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    valueA = (json['valueA'] == null) ? null : json['valueA'].toDouble();
    valueB = (json['valueB'] == null) ? null : json['valueB'].toDouble();
    unitId = json['unitId'];
    biomarkerId = json['biomarkerId'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (valueA != null) json['valueA'] = valueA;
    if (valueB != null) json['valueB'] = valueB;
    if (unitId != null) json['unitId'] = unitId;
    if (biomarkerId != null) json['biomarkerId'] = biomarkerId;
    return json;
  }

  static List<MemberBiomarkerReferenceModel> listFromJson(List<dynamic> json) {
    return json == null
        ? List<MemberBiomarkerReferenceModel>()
        : json
            .map((value) => MemberBiomarkerReferenceModel.fromJson(value))
            .toList();
  }

  static Map<String, MemberBiomarkerReferenceModel> mapFromJson(
      Map<String, dynamic> json) {
    var map = Map<String, MemberBiomarkerReferenceModel>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
          map[key] = MemberBiomarkerReferenceModel.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of MemberBiomarkerReferenceModel-objects as value to a dart map
  static Map<String, List<MemberBiomarkerReferenceModel>> mapListFromJson(
      Map<String, dynamic> json) {
    var map = Map<String, List<MemberBiomarkerReferenceModel>>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) {
        map[key] = MemberBiomarkerReferenceModel.listFromJson(value);
      });
    }
    return map;
  }
}
