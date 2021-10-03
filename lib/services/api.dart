import 'package:api/api.dart';
import 'package:biomad_frontend/config/env.dart';
import 'package:biomad_frontend/services/dio.dart';

late Api api;

void init() {
  api = Api(dio);
}
