import 'package:dartz/dartz.dart';
import 'package:prolog_app_refactor/app/features/users/domain/entities/user_entity.dart';

abstract class IGetUsersRepository {
  Future<Either<Exception, List<UserEntity>>> call();
}