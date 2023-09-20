class LoginUserModel {
  String? user;
  bool? validPassword;
  String? token;
  bool? error;

  LoginUserModel({
    this.user,
    this.validPassword,
    this.token,
    this.error,
  });

  factory LoginUserModel.fromJson(Map<String, dynamic> json) {
    return LoginUserModel(
        user: json["user"],
        validPassword: json["validPassword"],
        token: json["json"],
        error: json["error"]);
  }
}
