import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:prolog_app_refactor/app/core/services/http_service/helpers/params.dart';
import 'package:prolog_app_refactor/app/core/services/http_service/helpers/responses.dart';
import 'package:prolog_app_refactor/app/core/services/http_service/i_http_service.dart';

class HttpService implements IHttpService {
  @override
  Future<GetHttpServiceResponse<T>> get<T>(GetHttpServiceParam param) async {
    try {
      final httpResponse = await http.get(
        Uri.parse(
          param.url,
        ).replace(
          queryParameters: param.data,
        ),
        headers: param.headers,
      );

      T? data;

      if (param.responseType == HttpResponseType.json) {
        data = jsonDecode(httpResponse.body) as T;
      } else {
        data = httpResponse.body as T;
      }
      final response = GetHttpServiceResponse<T>(data: data);
      return response;
    } on String catch (e) {
      throw HttpException(e);
    }
  }
}
