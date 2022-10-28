import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.tealAccent,
      appBar: AppBar(
        title: const Text('Canario'),
      ),
      body: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.fromLTRB(10, 2.5, 10, 2.5),
            elevation: 2,
            child: ListTile(
              title: Text('Time $index'),
            ),
          );
        },
      ),
    );
  }
}
