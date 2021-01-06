import 'package:get/get.dart';

class Provider extends GetConnect {
  Provider._private() {
    httpClient.baseUrl = 'http://api.yourdomain.com/api/v1';
    httpClient.defaultContentType = 'application/json';
    httpClient.timeout = Duration(seconds: 1);
    httpClient.maxAuthRetries = 5;
  }
  static final single = Provider._private();
}
