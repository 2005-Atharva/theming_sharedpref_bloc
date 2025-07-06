import 'package:bloc_shared_theme_2/bloc/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: Text('Home')),
          body: Center(
            child: Column(
              children: [
                RadioListTile<ThemeMode>(
                  title: Text("Light"),
                  value: ThemeMode.light,
                  groupValue: state.themeMode,
                  onChanged: (val) {
                    context.read<ThemeBloc>().add(SetLightTheme());
                  },
                ),

                RadioListTile<ThemeMode>(
                  title: Text("Dark"),
                  value: ThemeMode.dark,
                  groupValue: state.themeMode,
                  onChanged: (val) {
                    context.read<ThemeBloc>().add(SetDarkTheme());
                  },
                ),

                RadioListTile<ThemeMode>(
                  title: Text("System Default"),
                  value: ThemeMode.system,
                  groupValue: state.themeMode,
                  onChanged: (val) {
                    context.read<ThemeBloc>().add(SetSystemTheme());
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
