import 'package:prolog_app_refactor/app/core/services/http_service/helpers/params.dart';
import 'package:prolog_app_refactor/app/features/users/domain/entities/user_entity.dart';

final listUsersResponse = [
  UserEntity(id: 1, userId: 1, completed: false, title: 'teste'),
  UserEntity(id: 1, userId: 1, completed: false, title: 'teste'),
];

const paramGet =
    GetHttpServiceParam(url: 'https://jsonplaceholder.typicode.com/todos/');

final mockResponse = [
  {
    "userId": 1,
    "id": 1,
    "title": "delectus aut autem",
    "completed": false,
  },
  {
    "userId": 1,
    "id": 2,
    "title": "quis ut nam facilis et officia qui",
    "completed": false
  },
];
