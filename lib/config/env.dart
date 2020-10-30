import 'package:flutter_dotenv/flutter_dotenv.dart';

Env env;

class Env {
  String API_BASE_URL;

  Env({this.API_BASE_URL});

  static Future<void> init(String path) async {
    String getKey(String key) => DotEnv().env[key] ?? null;

    await DotEnv().load(path);
    env = Env();
    env.API_BASE_URL = DotEnv().env['API_BASE_URL'] ?? null;
  }
}
