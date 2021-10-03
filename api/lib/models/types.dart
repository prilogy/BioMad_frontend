part of api.api;

class Types {
  /// The underlying value of this enum member.
  final int value;

  const Types._internal(this.value);

  static const Types number0_ = const Types._internal(0);
  static const Types number1_ = const Types._internal(1);

  static Types fromJson(int? value) {
    return new TypesTypeTransformer().decode(value);
  }
  
  static List<Types> listFromJson(List<dynamic> json) {
    return json == null ? <Types>[] : json.map((value) => Types.fromJson(value)).toList();
  }
}

class TypesTypeTransformer {

  dynamic encode(Types data) {
    return data.value;
  }

  Types decode(dynamic data) {
    switch (data) {
      case 0: return Types.number0_;
      case 1: return Types.number1_;
      default: throw('Unknown enum value to decode: $data');
    }
  }
}

