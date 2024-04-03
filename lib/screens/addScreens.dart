import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo/boxes.dart';
import 'package:todo/todo.dart';

class addScreen extends StatefulWidget {
  const addScreen({super.key});

  @override
  State<addScreen> createState() => _addScreenState();
}

class _addScreenState extends State<addScreen> {
  void datat(BuildContext context) {
    debugPrint("${_controller.text}");
  }

  TextEditingController _controller = TextEditingController();
  FocusNode _focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context)?.settings.arguments as Map;
    final box = Boxes.getBox();
    _focusNode.requestFocus();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Todo"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              focusNode: _focusNode,
              controller: _controller,
              onChanged: (String s) {
                setState(() {});
              },
              decoration: InputDecoration(
                  hintText: "Enter your plan",
                  errorText: _controller.text.contains("/")
                      ? "Remove the special charactters"
                      : ""),
            ),
            Visibility(
              visible: !_controller.text.contains("/"),
              child: IconButton(
                  onPressed: () {
                    if (_controller.text.contains("/")) {
                      debugPrint("Hey...");
                    } else {
                      Todo t = Todo()..text = _controller.text;
                      box.add(t);
                    }
                    final todos = box.values.toList();
                    int x = 0;
                    for (var todo in todos) {
                      debugPrint("From hive${todo.text} is $x ihe task");
                      x++;
                    }
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.save)),
            ),
            Text("You already have ${data["no"]} tasks"),
          ],
        ),
      ),
    );
  }
}
