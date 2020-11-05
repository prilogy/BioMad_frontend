import 'package:api/api.dart';
import 'package:biomad_frontend/config/env.dart';
import 'package:biomad_frontend/extensions/snack_bar_extension.dart';
import 'package:biomad_frontend/helpers/keys.dart';
import 'package:biomad_frontend/services/api.dart';
import 'package:biomad_frontend/store/main.dart';
import 'package:biomad_frontend/store/thunks.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';

final Dio dio = new Dio();

void init() {
  dio.options.baseUrl = env.API_BASE_URL;
  dio.options.connectTimeout = 4000;
  dio.interceptors
      .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
    var customHeaders = {
      "Authorization": store.state.authorization?.accessToken == null
          ? null
          : 'Bearer ${store.state.authorization.accessToken}'
    };
    options.headers.addAll(customHeaders);
    return options;
  }, onResponse: (r) async {
    print('[ API REQUEST ] - CODE ${r.statusCode}');
    if (r.statusCode == 401 && store.state.authorization.isAuthorized)
      store.dispatch(StoreThunks.authorizeWithRefreshToken(onError: () {
        store.dispatch(
            StoreThunks.logOut(tr('snack_bar.log_out_due_refresh_token')));
      }));
  }));
}
