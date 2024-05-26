class User {
  static String? authToken;
  String username;
  String email;
  String password;
  User(this.username, this.email, this.password);

  Map<String, dynamic> toJson() {
    return {
      'name': username,
      'email': email,
      'password': password,
    };
  }
}
