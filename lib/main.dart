import 'package:flutter/material.dart';
import 'package:dynamic_theming/theme/app_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppTheme _currentTheme = AppTheme.SYSTEM;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.system,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final AppTheme _currentAppTheme = AppTheme.SYSTEM;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Dynamic Theming"),
          actions: [
            PopupMenuButton<AppTheme>(
              itemBuilder: (BuildContext context) {
                return <PopupMenuItem<AppTheme>>[
                  PopupMenuItem(
                    value: AppTheme.LIGHT,
                    child: RadioListTile(
                      value: AppTheme.LIGHT,
                      onChanged: (AppTheme theme) {},
                      groupValue: _currentAppTheme,
                      title: Text("Light Theme"),
                    ),
                  ),
                  PopupMenuItem(
                    value: AppTheme.DARK,
                    child: RadioListTile(
                      value: AppTheme.DARK,
                      onChanged: (AppTheme theme) {},
                      groupValue: _currentAppTheme,
                      title: Text("Dark Theme"),
                    ),
                  ),
                  PopupMenuItem(
                    value: AppTheme.SYSTEM,
                    child: RadioListTile(
                      value: AppTheme.SYSTEM,
                      onChanged: (AppTheme theme) {},
                      groupValue: _currentAppTheme,
                      title: Text("System Default"),
                    ),
                  ),
                ];
              },
              child: Icon(Icons.more_vert),
            ),
          ],
        ),
        body: Container(
          alignment: Alignment.center,
          child: Text(
            _currentAppTheme.toString(),
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
      ),
    );
  }
}
