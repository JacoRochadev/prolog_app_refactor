import 'package:dartz/dartz.dart';
import 'package:prolog_app_refactor/app/features/users/domain/entities/user_entity.dart';
import 'package:prolog_app_refactor/app/features/users/domain/repositories/i_get_users_repository.dart';
import 'package:prolog_app_refactor/app/features/users/domain/usecases/get_users/i_get_users_usecase.dart';

class GetUsersUsecase implements IGetUsersUsecase {
  final IGetUsersRepository _repository;
  
  GetUsersUsecase(this._repository);

  @override
  Future<Either<Exception, List<UserEntity>>> call() async {
    return _repository.call();
  }
}
