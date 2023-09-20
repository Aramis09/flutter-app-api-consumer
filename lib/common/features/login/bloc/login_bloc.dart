import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../data/models/login_user_model.dart';
import '../domain/repository/repository.dart';
import '../domain/sources/api_data_rources_impl.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginInitial(password: "", user: "")) {
    on<SendDataToVerifyLogin>(_sendDataToVerify);

    on<OnChangeUser>(_onChageUser);
    on<OnChangePassword>(_onChagePassword);
    on<SignOffAccount>(_onSignOffAccount);
  }

  FutureOr<void> _onChageUser(OnChangeUser event, Emitter<LoginState> emit) {
    emit(state.copyWith(user: event.user));
  }

  FutureOr<void> _onChagePassword(
      OnChangePassword event, Emitter<LoginState> emit) {
    emit(state.copyWith(password: event.password));
  }

  FutureOr<void> _sendDataToVerify(
      SendDataToVerifyLogin event, Emitter<LoginState> emit) async {
    emit(LoginLoadingState(user: state.user, password: state.password));
    LoginUserModel responseApi =
        await LoginRespositoryImpl(dataSources: ApiDataSourcesImpl())
            .verifyDataLogin(user: state.user, password: state.password);
    if (responseApi.error != false) {
      return emit(LoginErrorState(
          error: "Incorrect credentials.",
          password: state.password,
          user: state.user));
    }
    return emit(LoginDoneState(password: state.password, user: state.user));
  }

  FutureOr<void> _onSignOffAccount(
      SignOffAccount event, Emitter<LoginState> emit) {
    emit(LoginLoadingState(password: state.password, user: state.user));
    emit(const LoginInitial(password: "", user: ""));
  }
}
