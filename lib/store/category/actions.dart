import 'package:api/api.dart';

class SetCategory {
  final Category category;

  SetCategory(this.category);

  @override
  String toString() {
    return 'Gender -> SetGender{gender: $category}';
  }
}