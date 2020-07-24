import 'package:flutter/material.dart';
import 'home_page.dart';
import 'login_page.dart';
import 'root_page.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Flutter auth',
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: new RootPage(),
        routes: <String, WidgetBuilder>{
          '/home': (BuildContext context) => HomePage(),
          '/login': (BuildContext context) => LoginPage(),
        });
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_firebase_auth/home_page.dart';
// import 'package:flutter_firebase_auth/login_page.dart';
// import 'package:flutter_firebase_auth/register_page.dart';
// import 'package:flutter_firebase_auth/root_page.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         title: 'Flutter Firebase Auth Demo',
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//           visualDensity: VisualDensity.adaptivePlatformDensity,
//         ),
//         home: RootPage(),
//         routes: <String, WidgetBuilder>{
//           '/home': (BuildContext context) => HomePage(),
//           '/register': (BuildContext context) => RegisterPage(),
//           '/login': (BuildContext context) => LoginPage(),
//         });
//   }
// }
