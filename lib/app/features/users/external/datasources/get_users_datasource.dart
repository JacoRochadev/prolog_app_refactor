import 'package:prolog_app_refactor/app/core/services/http_service/helpers/params.dart';
import 'package:prolog_app_refactor/app/core/services/http_service/i_http_service.dart';
import 'package:prolog_app_refactor/app/features/users/domain/entities/user_entity.dart';
import 'package:prolog_app_refactor/app/features/users/external/mappers/user_mapper.dart';
import 'package:prolog_app_refactor/app/features/users/infra/datasources/i_get_users_datasource.dart';

class GetUsersDatasource implements IGetUsersDatasource {
  final IHttpService _service;

  GetUsersDatasource(this._service);
  @override
  Future<List<UserEntity>> call() async {
    const param = GetHttpServiceParam(
      url: 'https://jsonplaceholder.typicode.com/todos/',
    );
    final result = await _service.get(param);
    final response = result.data as List;
    return response.map((e) => UserMapper.fromMap(e)).toList();
  }
}
