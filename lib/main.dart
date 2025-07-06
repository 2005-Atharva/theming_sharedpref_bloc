import 'package:bloc_shared_theme_2/bloc/theme_bloc.dart';
import 'package:bloc_shared_theme_2/screens/home_page.dart';
import 'package:bloc_shared_theme_2/theme/dark_theme.dart';
import 'package:bloc_shared_theme_2/theme/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => ThemeBloc()..add(GetCurrentTheme()),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: state.themeMode,
          home: HomePage(),
        );
      },
    );
  }
}
