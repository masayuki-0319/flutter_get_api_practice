import 'package:flutter/material.dart';
import 'package:rta_seacher_for_speedrun_com/ui/pages/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: _setThemeData(),
      initialRoute: '/',
      routes: _setRoutes(),
      debugShowCheckedModeBanner: false,
    );
  }

  ThemeData _setThemeData() {
    return ThemeData(
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      fontFamily: 'Raleway',
    );
  }

  Map<String, Widget Function(BuildContext)> _setRoutes() {
    return {
      '/': (ctx) => HomeScreen(),
    };
  }
}
