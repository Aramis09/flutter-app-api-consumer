import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_aplication_bloc/settings/themes/app_theme.dart';
import 'package:meta/meta.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ThemeInitial(0, colorThemes));
  void changeColor(int color) {
    emit(state.copyWith(color, null));
  }
}
