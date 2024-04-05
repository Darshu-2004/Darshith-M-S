import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/screens/addScreens.dart';
import 'package:todo/screens/home.dart';
import 'package:todo/screens/splash.dart';
import 'package:todo/services/sharedPreferences.dart';
import 'package:todo/todo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TodoAdapter());

  await Hive.openBox<Todo>("MyBox");
  await SharedPreferencesMan().init();
  SharedPreferencesMan.i.setappFirstOpen(true);
  debugPrint("${SharedPreferencesMan.i.getappFirstOpen()}");
  runApp(MaterialApp(
    initialRoute: "/",
    routes: {
      "/": (context) => Home(),
      "/add": (context) => addScreen(),
      "/splash": (context) => SplashScreen(),
    },
  ));
}
