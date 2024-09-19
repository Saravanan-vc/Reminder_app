import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

late Box box;

class Provide extends GetxController {
  @override
  void onInit() {
    cehcking();
    super.onInit();
  }

  TextEditingController textEditingController = TextEditingController();
  List todolist = [];

  defaulop() {
    todolist = [
      ['TASK CREATE', false]
    ];
  }

  makealist(String tase, bool did) {
    todolist = [
      [tase, did]
    ];

    update();
  }

  dontit(index) {
    todolist[index][1] = !todolist[index][1];
    updateit();
    update();
  }

  addtolist(String task, bool did) {
    todolist.add([task, did]);
    box.put('todolist', todolist);
    update();
    textEditingController.clear();
  }

  cehcking() {
    if (box.get('todolist') != null) {
      todolist = box.get('todolist');
    } else {
      defaulop();
    }
  }

  updateit() {
    box.put('todolist', todolist);
  }
}
