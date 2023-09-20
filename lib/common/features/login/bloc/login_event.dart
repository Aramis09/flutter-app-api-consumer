part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {
  bool? loading;
  String? user;
  String? password;
  LoginEvent({this.loading, this.password, this.user});
}

class ChangeAccountDataLogin extends LoginEvent {
  ChangeAccountDataLogin({super.loading, super.user, super.password});
}

class OnChangeUser extends LoginEvent {
  OnChangeUser({super.user});
}

class SendDataToVerifyLogin extends LoginEvent {
  SendDataToVerifyLogin();
}

class OnChangePassword extends LoginEvent {
  OnChangePassword({super.password});
}

class SignOffAccount extends LoginEvent {
  SignOffAccount({super.password});
}
