import 'package:biomad_frontend/config/env.dart';
import 'package:biomad_frontend/store/main.dart';
import 'package:dio/dio.dart';

final Dio dio = new Dio();

void init() {
  dio.options.baseUrl = env.API_BASE_URL;
  dio.options.connectTimeout = 4000;
  dio.interceptors
      .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
    var customHeaders = {"Authorization": store.state.authorization?.accessToken == null ? null : 'Bearer ${store.state.authorization.accessToken}'};
    options.headers.addAll(customHeaders);
    return options;
  }));
}
