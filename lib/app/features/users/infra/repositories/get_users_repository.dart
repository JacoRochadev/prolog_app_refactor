import 'package:dartz/dartz.dart';
import 'package:prolog_app_refactor/app/features/users/domain/entities/user_entity.dart';
import 'package:prolog_app_refactor/app/features/users/domain/repositories/i_get_users_repository.dart';
import 'package:prolog_app_refactor/app/features/users/infra/datasources/i_get_users_datasource.dart';

class GetUsersRepository implements IGetUsersRepository {
  final IGetUsersDatasource _datasource;

  GetUsersRepository(this._datasource);

  @override
  Future<Either<Exception, List<UserEntity>>> call() async {
    try {
      final result = await _datasource.call();
      return Right(result);
    } catch (e) {
      return Left(
        Exception(e),
      );
    }
  }
}
