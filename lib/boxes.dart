import "package:hive/hive.dart";
import "package:todo/todo.dart";

class Boxes {
  static Box<Todo> getBox() => Hive.box<Todo>("MyBox");
}
