
class LoginResponse {
  final bool status;
  final String message;
  final String token;
  final bool is_superuser;
  final UserDetails user_details;

  LoginResponse({
    required this.status,
    required this.message,
    required this.token,
    required this.is_superuser,
    required this.user_details,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      status: json['status'] ?? '',
      message: json['message'] ?? '',
      token: json['token'] ?? '',
      user_details: UserDetails.fromJson(json['user_details'] ?? {}),
      is_superuser: json['is_superuser'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'token': token,
      'user_details': user_details.toJson(),
    };
  }
}
class UserDetails {
  final num id;
  final String? last_login;
  final String name;
  final String phone;
  final String address;
  final String mail;
  final String username;
  final String password;
  final String password_text;
  final num admin;
  final bool is_admin;
  final bool is_active;
  final String created_at;
  final String updated_at;
  final String? branch;


  UserDetails({
    required this.last_login,
    required this.id,
    required this.name,
    required this.phone,
    required this.address,
    required this.mail,
    required this.username,
    required this.password,
    required this.password_text,
    required this.admin,
    required this.is_admin,
    required this.is_active,
    required this.created_at,
    required this.updated_at,
    required this.branch,});

  factory UserDetails.fromJson(Map<String, dynamic> json) {
    return UserDetails(
      id: json['id'] ?? '',
      last_login: json['last_login'] ?? '',
      name: json['name'] ?? '',
      phone: json['phone'] ?? '',
      address: json['address'] ?? '',
      mail: json['mail'] ?? '',
      username: json['username'] ?? '',
      password: json['password'] ?? '',
      password_text: json['password_text'] ?? '',
      admin: json['admin'] ?? '',
      is_admin: json['is_admin'] ?? '',
      is_active: json['is_active'] ?? '',
      created_at: json['created_at'] ?? '',
      updated_at: json['updated_at'] ?? '',
      branch: json['branch'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'last_login': last_login,
      'name': name,
      'phone': phone,
      'address': address,
      'mail': mail,
      'username': username,
      'password': password,
      'password_text': password_text,
      'admin': admin,
      'is_admin': is_admin,
      'is_active': is_active,
      'created_at': created_at,
      'updated_at': updated_at,
      'branch': branch,
    };
  }
}


