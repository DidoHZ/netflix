import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:netflix/screen/home_screen.dart';
import 'package:netflix/screen/splash.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.black, // navigation bar color
    statusBarColor: Colors.transparent, // status bar color
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NETFLIX',
      theme: ThemeData(),
      home: const Splash(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.black,
          backgroundColor: Colors.black,
          iconTheme: const IconThemeData(color: Colors.white, size: 25)),
      title: "Netflix",
      debugShowCheckedModeBanner: false,
      home: const ScreenHome(),
    );
  }
}
