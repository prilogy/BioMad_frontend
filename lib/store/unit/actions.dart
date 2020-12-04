import 'package:api/api.dart';
import 'package:biomad_frontend/models/category_list.dart';
import 'package:biomad_frontend/models/unit_list.dart';

class SetUnitList {
  final UnitList units;

  SetUnitList(this.units);

  @override
  String toString() {
    return 'UnitList -> SetUnitList{UnitList: $units}';
  }
}