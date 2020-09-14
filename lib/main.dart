import 'package:dynamic_theming/pages/content.dart';
import 'package:dynamic_theming/provider/ThemeProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(Wrapper());
}

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeProvider>.value(
      value: ThemeProvider(),
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    final ThemeMode themeMode = themeProvider.themeMode;

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
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    Color color = Theme.of(context).backgroundColor;

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
                themeProvider.changeTheme(ThemeMode.light);
              },
            ),
            SpeedDialChild(
              child: Icon(Icons.brightness_3),
              label: "Dark Theme",
              labelBackgroundColor: color,
              onTap: () {
                themeProvider.changeTheme(ThemeMode.dark);
              },
            ),
            SpeedDialChild(
              child: Icon(Icons.settings_applications),
              label: "System Default",
              labelBackgroundColor: color,
              onTap: () {
                themeProvider.changeTheme(ThemeMode.system);
              },
            ),
          ],
        ),
        body: Content(),
      ),
    );
  }
}
