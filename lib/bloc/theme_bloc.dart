import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(ThemeMode.system)) {
    on<SetLightTheme>((event, emit) async {
      final pref = await SharedPreferences.getInstance();
      pref.setString('theme', 'light');
      emit(ThemeState(ThemeMode.light));
    });
    on<SetDarkTheme>((event, emit) async {
      final pref = await SharedPreferences.getInstance();
      pref.setString('theme', 'dark');
      emit(ThemeState(ThemeMode.dark));
    });
    on<SetSystemTheme>((event, emit) async {
      final pref = await SharedPreferences.getInstance();
      pref.setString('theme', 'system');
      emit(ThemeState(ThemeMode.system));
    });
    on<GetCurrentTheme>((event, emit) async {
      final pref = await SharedPreferences.getInstance();
      final theme = pref.getString('theme') ?? 'system';

      switch (theme) {
        case 'light':
          emit(ThemeState(ThemeMode.light));
          break;
        case 'dark':
          emit(ThemeState(ThemeMode.dark));
          break;
        default:
          emit(ThemeState(ThemeMode.system));
      }
    });
  }
}
