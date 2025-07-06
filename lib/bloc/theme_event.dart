part of 'theme_bloc.dart';

@immutable
sealed class ThemeEvent {}

class SetLightTheme extends ThemeEvent {}

class SetDarkTheme extends ThemeEvent {}

class SetSystemTheme extends ThemeEvent {}

class GetCurrentTheme extends ThemeEvent {}
