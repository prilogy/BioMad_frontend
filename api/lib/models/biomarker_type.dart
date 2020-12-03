part of api.api;

class BiomarkerType {
  
  int id = null;
  
  List<BiomarkerTypeTranslation> translations = [];
  
  BiomarkerTypeTranslation content = null;
  
  List<Biomarker> biomarkers = [];
  
  List<int> biomarkerIds = [];
  BiomarkerType();

  @override
  String toString() {
    return 'BiomarkerType[id=$id, translations=$translations, content=$content, biomarkers=$biomarkers, biomarkerIds=$biomarkerIds, ]';
  }

  BiomarkerType.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    translations = (json['translations'] == null) ?
      null :
      BiomarkerTypeTranslation.listFromJson(json['translations']);
    content = (json['content'] == null) ?
      null :
      BiomarkerTypeTranslation.fromJson(json['content']);
    biomarkers = (json['biomarkers'] == null) ?
      null :
      Biomarker.listFromJson(json['biomarkers']);
    biomarkerIds = (json['biomarkerIds'] == null) ?
      null :
      (json['biomarkerIds'] as List).cast<int>();
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['id'] = id;
      json['translations'] = translations;
    if (content != null)
      json['content'] = content;
      json['biomarkers'] = biomarkers;
      json['biomarkerIds'] = biomarkerIds;
    return json;
  }

  static List<BiomarkerType> listFromJson(List<dynamic> json) {
    return json == null ? List<BiomarkerType>() : json.map((value) => BiomarkerType.fromJson(value)).toList();
  }

  static Map<String, BiomarkerType> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, BiomarkerType>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = BiomarkerType.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of BiomarkerType-objects as value to a dart map
  static Map<String, List<BiomarkerType>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<BiomarkerType>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = BiomarkerType.listFromJson(value);
       });
     }
     return map;
  }
}

