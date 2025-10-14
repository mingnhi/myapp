class LoginResponse {
  final User? user;
  final String? accessToken;
  final String? refreshToken;

  LoginResponse({
    this.user,
    this.accessToken,
    this.refreshToken,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      user: json['user'] != null ? User.fromJson(json['user']) : null,
      accessToken: json['accessToken'] ?? json['token'] ?? '',
      refreshToken: json['refresh_token'] ?? json['refreshToken'] ?? '',
    );
  }
}

class User {
  final String id;
  final String fullName;
  final String email;
  final String? phoneNumber;
  final String role;

  User({
    required this.id,
    required this.fullName,
    required this.email,
    this.phoneNumber,
    required this.role,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? json['_id'] ?? '',
      fullName: json['full_name'] ?? '',
      email: json['email'] ?? '',
      phoneNumber: json['phone_number'] ?? '',
      role: json['role'] ?? 'user',
    );
  }
}


class RegisterRequest {
  final String fullName;
  final String email;
  final String password;
  final String? phoneNumber;
  final String role;

  RegisterRequest({required this.fullName, required this.email, required this.password, this.phoneNumber, this.role = 'user'});

  Map<String, dynamic> toJson() => {
    'full_name': fullName,
    'email': email,
    'password': password,
    'phone_number': phoneNumber,
    'role': role,
  };
}