part of 'login_bloc.dart';

@immutable
sealed class LoginState {
  final String user;
  final String password;

  const LoginState({required this.user, required this.password});
  LoginState copyWith({
    String? user,
    String? password,
  });
}

final class LoginInitial extends LoginState {
  const LoginInitial({required super.user, required super.password});
  @override
  LoginInitial copyWith(
      {bool? loading,
      String? user,
      String? password,
      bool? error,
      bool? succes}) {
    return LoginInitial(
        user: user ?? this.user, password: password ?? this.password);
  }
}

final class LoginLoadingState extends LoginState {
  const LoginLoadingState({required super.password, required super.user});
  @override
  LoginLoadingState copyWith({
    String? user,
    String? password,
  }) {
    return LoginLoadingState(
        user: user ?? this.user, password: password ?? this.password);
  }
}

final class LoginDoneState extends LoginState {
  const LoginDoneState({required super.password, required super.user});
  @override
  LoginDoneState copyWith({
    String? user,
    String? password,
  }) {
    return LoginDoneState(
        user: user ?? this.user, password: password ?? this.password);
  }
}

final class LoginErrorState extends LoginState {
  final String error;
  const LoginErrorState(
      {required super.password, required super.user, required this.error});
  @override
  LoginErrorState copyWith({
    String? user,
    String? password,
  }) {
    return LoginErrorState(
        user: user ?? this.user,
        password: password ?? this.password,
        error: error);
  }
}
