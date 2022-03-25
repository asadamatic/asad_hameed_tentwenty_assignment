import 'package:http/http.dart';

class AppHttp {
  getReq(
    String url, {
    Map<String, String>? headers,
    String contentType = '',
    Map<String, dynamic>? query,
  }) {
    return get(
      Uri.parse(url).replace(queryParameters: query),
      headers: headers,
    );
  }
}
