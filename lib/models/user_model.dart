class User {
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      password: json['password'] as String,
      id: json['id'] as int,
      username: json['username'] as String,
    );
  }

  User({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.password,
    required this.id,
    required this.username,
  });
  String email;
  String firstName;
  String lastName;
  String password;
  int id;
  String username;

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'first_name': firstName,
      'last_name': lastName,
      'password': password,
      'id': id,
      'username': username,
    };
  }
}
