class User {
  final String password;
  final String name;
  final int age;
  final String email;

  User(this.password, this.name, this.age, this.email);

  @override
  String toString() => '$name, $age';
}
