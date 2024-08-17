import 'package:prolog_app_refactor/app/core/services/http_service/helpers/params.dart';
import 'package:prolog_app_refactor/app/core/services/http_service/helpers/responses.dart';

abstract class IHttpService {
  Future<GetHttpServiceResponse<T>> get<T>(GetHttpServiceParam param);
}