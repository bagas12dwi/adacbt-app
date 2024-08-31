class Api {
  Api._();

  // static const String baseUrl = "http://192.168.18.8/adacbt-web/public/api";
  static const String baseUrl = "https://adaicbt.my.id/api";
  static const Duration receiveTimeout = Duration(seconds: 15000);
  static const Duration connectionTimeout = Duration(seconds: 15000);
}