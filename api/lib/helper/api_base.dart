part of api.api;

abstract class ApiBase<T> {
  Dio dio;

  /// Base version of api to call
  String v;

  ApiBase(this.dio, this.v);

  T withVersion(String version) {
    var tmp = this;
    tmp.v = version;
    return tmp as T;
  }

}