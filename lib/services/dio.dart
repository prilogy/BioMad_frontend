import 'package:biomad_frontend/config/env.dart';
import 'package:dio/dio.dart';

final Dio dio = new Dio();

void init() {
  dio.options.baseUrl = env.API_BASE_URL;
  dio.interceptors
      .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
    //var customHeaders = {"Authorization": store.state.user?.token == null ? null : 'Bearer ${store.state.user.token}'};
    //options.headers.addAll(customHeaders);
    return options;
  }));
}
