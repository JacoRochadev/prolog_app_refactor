import 'package:prolog_app_refactor/app/features/users/domain/entities/user_entity.dart';

class UserMapper {
  static UserEntity fromMap(Map<String, dynamic> map) {
    return UserEntity(
      id: map['id'],
      userId: map['userId'],
      completed: map['completed'],
      title: map['title'],
    );
  }
}