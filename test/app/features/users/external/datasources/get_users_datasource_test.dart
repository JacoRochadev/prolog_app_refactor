import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:prolog_app_refactor/app/core/services/http_service/helpers/responses.dart';
import 'package:prolog_app_refactor/app/core/services/http_service/i_http_service.dart';
import 'package:prolog_app_refactor/app/features/users/domain/entities/user_entity.dart';
import 'package:prolog_app_refactor/app/features/users/external/datasources/get_users_datasource.dart';

import '../../mocks/user_mocks.dart';

class _MockHttp extends Mock implements IHttpService {}

void main() {
  late IHttpService httpService;
  late GetUsersDatasource datasource;

  setUp(() {
    httpService = _MockHttp();
    datasource = GetUsersDatasource(httpService);
  });

  test('should return a GetUsersEntity case success ...', () async {
    when(() => httpService.get(paramGet)).thenAnswer((invocation) async =>
        GetHttpServiceResponse(data: mockResponse));
    final result = await datasource.call();
    expect(result, isA<List<UserEntity>>());
  });
}
