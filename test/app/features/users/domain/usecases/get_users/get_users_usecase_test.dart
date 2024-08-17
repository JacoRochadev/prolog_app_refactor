import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:prolog_app_refactor/app/features/users/domain/entities/user_entity.dart';
import 'package:prolog_app_refactor/app/features/users/domain/repositories/i_get_users_repository.dart';
import 'package:prolog_app_refactor/app/features/users/domain/usecases/get_users/get_users_usecase.dart';

import '../../../mocks/user_mocks.dart';

class _MockRepository extends Mock implements IGetUsersRepository {}

void main() {
  final repository = _MockRepository();
  final usecase = GetUsersUsecase(repository);

  test('should return a list users case sucess...', () async {
    when(() => repository.call()).thenAnswer(
      (invocation) async => Right(listUsersResponse),
    );
    final result = await usecase.call();
    expect(result.fold((l) => l, (r) => r), isA<List<UserEntity>>());
  });
  test('should return a exception case fail...', () async {
    when(() => repository.call())
        .thenAnswer((invocation) async => Left(Exception()));
    final result = await usecase.call();
    expect(result.fold((l) => l, (r) => r), isA<Exception>());
  });
}
