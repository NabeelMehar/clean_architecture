import '../../domain/entities/user.dart';
import '../../domain/repositories/users_repository.dart';

class DataUsersRepository extends UsersRepository {
  List<User> users;
  // sigleton

  static final DataUsersRepository _instance = DataUsersRepository._internal();
  DataUsersRepository._internal() {
    users = <User>[];
    users.addAll([
      User('12345', 'Nabeel Mehar', 21 ,"nabeel@gmail.com"),
      User('667788', 'Gaurav Jain', 22 ,"gaurav@gmail.com")
    ]);
  }

  factory DataUsersRepository() => _instance;

  @override
  Future<List<User>> getAllUsers() async {
    return users;
  }

  @override
  Future<User> getUser(String password ,String email) async {
    return users.firstWhere((user) => user.password == password && user.email==email);
  }
}
