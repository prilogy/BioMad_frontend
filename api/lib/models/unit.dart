part of api.api;

class Unit {
  
  int id = null;
  
  List<UnitTranslation> translations = [];
  
  UnitTranslation content = null;
  
  List<Biomarker> biomarkers = [];
  
  List<int> transfersToIds = [];
  
  List<int> transfersFromIds = [];
  
  List<UnitTransfer> transfersTo = [];
  
  List<UnitTransfer> transfersFrom = [];
  
  List<BiomarkerUnit> biomarkerUnits = [];
  Unit();

  static String localStorageKey = "unit_state";

  @override
  String toString() {
    return 'Unit[id=$id, translations=$translations, content=$content, biomarkers=$biomarkers, transfersToIds=$transfersToIds, transfersFromIds=$transfersFromIds, transfersTo=$transfersTo, transfersFrom=$transfersFrom, biomarkerUnits=$biomarkerUnits, ]';
  }

  Unit.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    translations = (json['translations'] == null) ?
      null :
      UnitTranslation.listFromJson(json['translations']);
    content = (json['content'] == null) ?
      null :
      UnitTranslation.fromJson(json['content']);
    biomarkers = (json['biomarkers'] == null) ?
      null :
      Biomarker.listFromJson(json['biomarkers']);
    transfersToIds = (json['transfersToIds'] == null) ?
      null :
      (json['transfersToIds'] as List).cast<int>();
    transfersFromIds = (json['transfersFromIds'] == null) ?
      null :
      (json['transfersFromIds'] as List).cast<int>();
    transfersTo = (json['transfersTo'] == null) ?
      null :
      UnitTransfer.listFromJson(json['transfersTo']);
    transfersFrom = (json['transfersFrom'] == null) ?
      null :
      UnitTransfer.listFromJson(json['transfersFrom']);
    biomarkerUnits = (json['biomarkerUnits'] == null) ?
      null :
      BiomarkerUnit.listFromJson(json['biomarkerUnits']);
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['id'] = id;
      json['translations'] = translations;
    if (content != null)
      json['content'] = content;
      json['biomarkers'] = biomarkers;
      json['transfersToIds'] = transfersToIds;
      json['transfersFromIds'] = transfersFromIds;
      json['transfersTo'] = transfersTo;
      json['transfersFrom'] = transfersFrom;
      json['biomarkerUnits'] = biomarkerUnits;
    return json;
  }

  static List<Unit> listFromJson(List<dynamic> json) {
    return json == null ? List<Unit>() : json.map((value) => Unit.fromJson(value)).toList();
  }

  static Map<String, Unit> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, Unit>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = Unit.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of Unit-objects as value to a dart map
  static Map<String, List<Unit>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<Unit>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = Unit.listFromJson(value);
       });
     }
     return map;
  }

  static Unit fromLocalStorage() {
    var json = localStorage.getItem(localStorageKey);
    return Unit.fromJson(json ?? Map<String, dynamic>());
  }

  static void saveToLocalStorage(Unit model) {
    localStorage.setItem(localStorageKey, model.toJson());
  }
}

