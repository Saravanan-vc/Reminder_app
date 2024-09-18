import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

late Box box;

class Provide extends GetxController {
  TextEditingController textEditingController = TextEditingController();
  List<List> todolist = [
    ['saravanan', false]
  ];
  call() {
    box.put('key', "value");
    box.put('sun', "yes we can do");
    update();
  }

  again(int index) {
    return box.getAt(index);
  }

  void change(bool valu, int index) {
    todolist[index][1] = !valu;
    debugPrint("$valu");
    update();
  }

  int a = box.length;
}
