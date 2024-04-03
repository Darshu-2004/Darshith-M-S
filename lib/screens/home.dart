//stful+Enter
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ToDo App",
          style: TextStyle(color: Color.fromARGB(200, 6, 161, 40)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint("Button pressed");
          //Navigate Page
          Navigator.pushNamed(context, "/add", arguments: {"no": 5});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
