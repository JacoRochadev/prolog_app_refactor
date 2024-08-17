import 'package:prolog_app_refactor/app/features/users/domain/entities/user_entity.dart';

abstract class IGetUsersDatasource {
  Future<List<UserEntity>> call();
}