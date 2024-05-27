class User {
  static int? id;
  static String? authToken;
  String username;
  static String email = "";
  String password;
  User(this.username, this.password);

  Map<String, dynamic> toJson() {
    return {
      'name': username,
      'email': email,
      'password': password,
    };
  }
}
