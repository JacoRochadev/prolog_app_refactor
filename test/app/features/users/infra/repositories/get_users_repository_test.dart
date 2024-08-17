import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:prolog_app_refactor/app/features/users/domain/entities/user_entity.dart';
import 'package:prolog_app_refactor/app/features/users/infra/datasources/i_get_users_datasource.dart';
import 'package:prolog_app_refactor/app/features/users/infra/repositories/get_users_repository.dart';

import '../../mocks/user_mocks.dart';

class _MockDatasource extends Mock implements IGetUsersDatasource {}

void main() {
  late IGetUsersDatasource datasource;
  late GetUsersRepository repository;
  setUp(() {
    datasource = _MockDatasource();
    repository = GetUsersRepository(datasource);
  });

  test('should return list a Users case sucess', () async {
    when(() => datasource.call())
        .thenAnswer((invocation) async => listUsersResponse);
    final result = await repository.call();
    expect(result.fold((l) => l, (r) => r), isA<List<UserEntity>>());
  });
  test('should return Exception case failure', () async {
    when(() => datasource.call()).thenThrow(Exception());
    final result = await repository.call();
    expect(result.fold((l) => l, (r) => r), isA<Exception>());
  });
}
