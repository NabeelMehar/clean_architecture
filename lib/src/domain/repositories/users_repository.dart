import '../entities/user.dart';

abstract class UsersRepository {
  Future<User> getUser(String uid ,String email);
  Future<List<User>> getAllUsers();
}
