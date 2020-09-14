import 'package:dynamic_theming/pages/content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

void main() {
  runApp(Wrapper());
}

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyApp();
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeMode themeMode = ThemeMode.dark;

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
            ),
            SpeedDialChild(
              child: Icon(Icons.brightness_3),
              label: "Dark Theme",
              labelBackgroundColor: color,
            ),
            SpeedDialChild(
              child: Icon(Icons.settings_applications),
              label: "System Default",
              labelBackgroundColor: color,
            ),
          ],
        ),
        body: Content(),
      ),
    );
  }
}
