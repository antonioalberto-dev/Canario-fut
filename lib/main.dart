import 'package:canario_fut/screens/main_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Canario Fut',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        useMaterial3: true,
        // fontFamily: 'Poppins',
      ),
      home: const MainScreen(),
    );
  }
}
