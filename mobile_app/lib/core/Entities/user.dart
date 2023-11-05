class User {
  final String username;
  final String password;
  final String email;

  User({required this.username, required this.password, required this.email});

  String getUsername() => username;
  String getPassword() => password;
  String getEmail() => email;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        username: json['username'],
        password: json['password'],
        email: json['email']);
  }

  Map<String, dynamic> toJson() =>
      {'username': username, 'password': password, 'email': email};
}
