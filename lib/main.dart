import 'package:flutter/material.dart';
import 'package:flutter_recipe_app_api/views/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      title: 'Recipe_App',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Colors.white,
          textTheme:
              const TextTheme(bodyMedium: TextStyle(color: Colors.white))),
      home:const HomeView(),
    );
  }
}
