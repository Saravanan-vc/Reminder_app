import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Provide extends ChangeNotifier {
  final box = Hive.box('mybox');
  vlaa() {
    box.put('sara', 'name');
  }

  defalut() {
    var naem = box.get('sara');
    debugPrint(naem);
  }
}
