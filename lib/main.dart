import 'package:dynamic_theming/bloc/theme_bloc.dart';
import 'package:dynamic_theming/pages/content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedCubit.storage = await HydratedStorage.build();
  runApp(Wrapper());
}

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: ThemeCubit(),
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      cubit: BlocProvider.of<ThemeCubit>(context),
      builder: (BuildContext context, ThemeMode themeMode) {
        return MaterialApp(
          theme: ThemeData(
            brightness: Brightness.light,
            primaryColor: Colors.purple,
            accentColor: Colors.pinkAccent,
            backgroundColor: Colors.grey.shade100,
            dividerColor: Colors.white54,
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            primaryColor: Colors.orange,
            accentColor: Colors.lightBlueAccent,
            backgroundColor: Colors.grey.shade800,
            dividerColor: Colors.black45,
          ),
          themeMode: themeMode,
          home: HomePage(),
        );
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeCubit themeCubit = context.bloc<ThemeCubit>();
    Color color = Theme.of(context).backgroundColor;

    return BlocBuilder<ThemeCubit, ThemeMode>(
        cubit: themeCubit,
        builder: (BuildContext context, ThemeMode themeMode) {
          return Material(
            child: Scaffold(
              floatingActionButton: SpeedDial(
                animatedIcon: AnimatedIcons.menu_close,
                overlayColor: color,
                children: [
                  SpeedDialChild(
                      child: Icon(Icons.brightness_7),
                      label: "Light Theme",
                      labelBackgroundColor: color,
                      onTap: () {
                        themeCubit.changeTheme(ThemeMode.light);
                      }),
                  SpeedDialChild(
                      child: Icon(Icons.brightness_3),
                      label: "Dark Theme",
                      labelBackgroundColor: color,
                      onTap: () {
                        themeCubit.changeTheme(ThemeMode.dark);
                      }),
                  SpeedDialChild(
                      child: Icon(Icons.settings_applications),
                      label: "System Default",
                      labelBackgroundColor: color,
                      onTap: () {
                        themeCubit.changeTheme(ThemeMode.system);
                      }),
                ],
              ),
              body: Content(),
            ),
          );
        });
  }
}
