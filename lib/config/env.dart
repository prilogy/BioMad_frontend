import 'package:flutter_dotenv/flutter_dotenv.dart';

Env env;

class Env {
  String API_BASE_URL;
  String VK_APP_ID;

  Env({this.API_BASE_URL, this.VK_APP_ID});

  static Future<void> init(String path) async {
    String getKey(String key) => DotEnv().env[key] ?? null;

    await DotEnv().load(path);
    env = Env();
    env.API_BASE_URL = DotEnv().env['API_BASE_URL'] ?? null;
    env.VK_APP_ID = DotEnv().env['VK_APP_ID'] ?? null;
  }
}
