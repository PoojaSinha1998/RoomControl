import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:room_control/views/BedRoom.dart';
import 'package:room_control/views/HomePage.dart';
import 'package:room_control/views/Loading.dart';
import 'package:room_control/views/LoginPage.dart';
import 'package:room_control/views/SignUpPage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(MyApp()));

}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // initialRoute: '/test',
      routes: {
        '/signUpPage': (context) => SignUpPage(),
        '/loading':(context)=>LoadingPage(),
        '/homePage':(context)=>HomePage(),
        '/bedRoom':(context)=>BedRoom(),
      },
      title: 'School App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginPage(),

    );
  }
}
