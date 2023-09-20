part of 'theme_cubit.dart';

//! no iniciar estados aqui
@immutable
sealed class ThemeState {
  final int colorSelected;
  final List<Color> colorList;
  const ThemeState(this.colorSelected, this.colorList);
  ThemeState copyWith(int? colorSelected, List<Color>? colorList);
}

final class ThemeInitial extends ThemeState {
  const ThemeInitial(super.colorSelected, super.colorList);
  @override
  ThemeInitial copyWith(int? colorSelected, List<Color>? colorList) =>
      ThemeInitial(
          colorSelected ?? this.colorSelected, colorList ?? this.colorList);
}
