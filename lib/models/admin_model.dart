class AdminModel {
  final int idAdmin;
  final String email;
  final String username;
  final String role;
  final String password;
  final String avatar;
  final String lastLogin;

  AdminModel(
      {required this.avatar,
      required this.email,
      required this.password,
      required this.idAdmin,
      required this.lastLogin,
      required this.role,
      required this.username});

  factory AdminModel.getDataFromJSON(Map<String, dynamic> json) {
    return AdminModel(
        avatar: json['avatar'] ?? '',
        email: json['email'] ?? '',
        idAdmin: json['id_admin'] ?? 0,
        lastLogin: json['last_login'] ?? '',
        password: json['password'] ?? '',
        role: json['role'] ?? '',
        username: json['username'] ?? '');
  }

  Map<String, dynamic> toJSON() {
    return {
       "email" : email,
       "username" : username,
       "password" : password
    };
  }
}
