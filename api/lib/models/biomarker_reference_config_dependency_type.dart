part of api.api;

class BiomarkerReferenceConfigDependencyType {
  /// The underlying value of this enum member.
  final int value;

  const BiomarkerReferenceConfigDependencyType._internal(this.value);

  static const BiomarkerReferenceConfigDependencyType number0_ = const BiomarkerReferenceConfigDependencyType._internal(0);

  static BiomarkerReferenceConfigDependencyType fromJson(int? value) {
    return new BiomarkerReferenceConfigDependencyTypeTypeTransformer().decode(value);
  }
  
  static List<BiomarkerReferenceConfigDependencyType> listFromJson(List<dynamic> json) {
    return json == null ? <BiomarkerReferenceConfigDependencyType>[] : json.map((value) => BiomarkerReferenceConfigDependencyType.fromJson(value)).toList();
  }
}

class BiomarkerReferenceConfigDependencyTypeTypeTransformer {

  dynamic encode(BiomarkerReferenceConfigDependencyType data) {
    return data.value;
  }

  BiomarkerReferenceConfigDependencyType decode(dynamic data) {
    switch (data) {
      case 0: return BiomarkerReferenceConfigDependencyType.number0_;
      default: throw('Unknown enum value to decode: $data');
    }
  }
}

