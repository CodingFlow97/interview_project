import 'package:flutter/material.dart';
import 'package:interview/pages/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final MaterialColor mycolor = MaterialColor(
    const Color.fromRGBO(255, 255, 255, 1).value,
    const <int, Color>{
      50: Color.fromRGBO(255, 255, 255, 0.1),
      100: Color.fromRGBO(255, 255, 255, 0.2),
      200: Color.fromRGBO(255, 255, 255, 0.3),
      300: Color.fromRGBO(255, 255, 255, 0.4),
      400: Color.fromRGBO(255, 255, 255, 0.5),
      500: Color.fromRGBO(255, 255, 255, 0.6),
      600: Color.fromRGBO(255, 255, 255, 0.7),
      700: Color.fromRGBO(255, 255, 255, 0.8),
      800: Color.fromRGBO(255, 255, 255, 0.9),
      900: Color.fromRGBO(255, 255, 255, 1),
    },
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: mycolor,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.system,
      home: HomeScreen(
        key: UniqueKey(),
      ),
    );
  }
}
