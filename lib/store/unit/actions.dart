import 'package:api/api.dart';
import 'package:biomad_frontend/models/categoryList.dart';
import 'package:biomad_frontend/models/unitList.dart';

class SetUnitList {
  final UnitList units;

  SetUnitList(this.units);

  @override
  String toString() {
    return 'UnitList -> SetUnitList{UnitList: $units}';
  }
}