import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:netflix/screen/home_screen.dart';
import 'package:netflix/screen/profilemainscreen.dart';
import 'package:netflix/screen/signin_screen.dart';


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
      theme: ThemeData(
      ),
      home: const MyHomePage(),
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
        iconTheme: IconThemeData(color: Colors.white,size: 25)
      ),
      title: "Netflix",
      debugShowCheckedModeBanner: false,
      initialRoute: ScreenHome.rout,
      routes: {
        ScreenHome.rout : (context) => ScreenHome(),
        SignInScreen.rout : (context) => SignInScreen(),
        ProfileMainScreen.rout : (context) => ProfileMainScreen(),

      },
    );
  }

}
