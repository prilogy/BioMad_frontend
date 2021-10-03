part of api.api;

class Biomarker {
  BiomarkerReference? reference = null;

  MemberBiomarker? currentValue = null;

  int? id = null;

  int? typeId = null;

  BiomarkerType? type = null;

  int? defaultUnitId = null;

  BiomarkerTranslation? content = null;

  List<int>? categoryIds = [];

  List<int>? unitIds = [];

  List<BiomarkerArticle>? biomarkerArticles = [];

  int? unitGroupId = null;

  BiomarkerStateType? state = null;

  //enum stateEnum {  0 - выше,  1 - ниже,  2 - норма,  3 - неизвестно,  };{
  Biomarker();

  @override
  String toString() {
    return 'Biomarker[defaultUnit =$defaultUnitId, reference=$reference, currentValue=$currentValue, id=$id, typeId=$typeId, type=$type, content=$content, categoryIds=$categoryIds, unitIds=$unitIds, biomarkerArticles=$biomarkerArticles, unitGroupId=$unitGroupId, state=$state, ]';
  }

  Biomarker.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;

    reference = (json['reference'] == null)
        ? null
        : BiomarkerReference.fromJson(json['reference']);
    currentValue = (json['currentValue'] == null)
        ? null
        : MemberBiomarker.fromJson(json['currentValue']);
    defaultUnitId = json['defaultUnitId'];
    id = json['id'];
    typeId = json['typeId'];
    type = (json['type'] == null) ? null : BiomarkerType.fromJson(json['type']);
    content = (json['content'] == null)
        ? null
        : BiomarkerTranslation.fromJson(json['content']);
    categoryIds = (json['categoryIds'] == null)
        ? null
        : (json['categoryIds'] as List).cast<int>();
    unitIds = (json['unitIds'] == null)
        ? null
        : (json['unitIds'] as List).cast<int>();
    biomarkerArticles = (json['biomarkerArticles'] == null)
        ? null
        : BiomarkerArticle.listFromJson(json['biomarkerArticles']);
    unitGroupId = json['unitGroupId'];
    state = (json['state'] == null)
        ? null
        : BiomarkerStateType.fromJson(json['state']);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (reference != null) json['reference'] = reference;
    if (defaultUnitId != null) json['defaultUnitId'] = defaultUnitId;
    if (currentValue != null) json['currentValue'] = currentValue;
    if (id != null) json['id'] = id;
    if (typeId != null) json['typeId'] = typeId;
    if (type != null) json['type'] = type;
    if (content != null) json['content'] = content;
    json['categoryIds'] = categoryIds;
    json['unitIds'] = unitIds;
    json['biomarkerArticles'] = biomarkerArticles;
    if (unitGroupId != null) json['unitGroupId'] = unitGroupId;
    if (state != null) json['state'] = state;
    return json;
  }

  static List<Biomarker> listFromJson(List<dynamic>? json) {
    return json == null
        ? <Biomarker>[]
        : json.map((value) => Biomarker.fromJson(value)).toList();
  }

  static Map<String, Biomarker> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, Biomarker>();
    if (json != null && json.isNotEmpty) {
      json.forEach(
          (String key, dynamic value) => map[key] = Biomarker.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of Biomarker-objects as value to a dart map
  static Map<String, List<Biomarker>> mapListFromJson(
      Map<String, dynamic> json) {
    var map = Map<String, List<Biomarker>>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) {
        map[key] = Biomarker.listFromJson(value);
      });
    }
    return map;
  }
}
