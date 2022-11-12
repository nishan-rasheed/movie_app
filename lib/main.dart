import 'package:flutter/material.dart';
import 'package:movie_app/screens/homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        appBarTheme:const AppBarTheme(
          foregroundColor: Colors.green,
          backgroundColor:Colors.black
        ),
        textTheme:const TextTheme(
          bodyText2: TextStyle(
            color: Colors.grey,
          )
        ),
        primarySwatch: Colors.blue,
      ),
      home: Homescreen(),
    );
  }
}

