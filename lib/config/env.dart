import 'package:flutter_dotenv/flutter_dotenv.dart';

late Env env;

class Env {
  String? API_BASE_URL;
  String? VK_APP_ID;

  Env({this.API_BASE_URL, this.VK_APP_ID});

  static Future<void> init(String path) async {
    String? getKey(String key) => dotenv.env[key] ?? null;

    await dotenv.load(fileName: path);
    env = Env();
    env.API_BASE_URL = dotenv.env['API_BASE_URL'] ?? null;
    env.VK_APP_ID = dotenv.env['VK_APP_ID'] ?? null;
  }
}
