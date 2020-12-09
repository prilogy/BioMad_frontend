part of api.api;

class BiomarkerStateType {
  /// The underlying value of this enum member.
  final int value;

  const BiomarkerStateType._internal(this.value);

  static const BiomarkerStateType number0_ = const BiomarkerStateType._internal(0);
  static const BiomarkerStateType number1_ = const BiomarkerStateType._internal(1);
  static const BiomarkerStateType number2_ = const BiomarkerStateType._internal(2);
  static const BiomarkerStateType number3_ = const BiomarkerStateType._internal(3);

  static BiomarkerStateType fromJson(int value) {
    return new BiomarkerStateTypeTypeTransformer().decode(value);
  }
  
  static List<BiomarkerStateType> listFromJson(List<dynamic> json) {
    return json == null ? new List<BiomarkerStateType>() : json.map((value) => BiomarkerStateType.fromJson(value)).toList();
  }
}

class BiomarkerStateTypeTypeTransformer {

  dynamic encode(BiomarkerStateType data) {
    return data.value;
  }

  BiomarkerStateType decode(dynamic data) {
    switch (data) {
      case 0: return BiomarkerStateType.number0_;
      case 1: return BiomarkerStateType.number1_;
      case 2: return BiomarkerStateType.number2_;
      case 3: return BiomarkerStateType.number3_;
      default: throw('Unknown enum value to decode: $data');
    }
  }
}

