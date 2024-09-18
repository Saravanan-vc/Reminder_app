import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/provide.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool c = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          'T O D O A P P H O M E',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
      body: GetBuilder<Provide>(
        builder: (value) {
          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            itemCount: value.todolist.length,
            itemBuilder: (context, index) {
              String task = value.todolist[index][0];
              bool torf = value.todolist[index][1];
              return Card(
                color: Colors.black,
                child: ListTile(
                  leading: Checkbox(
                    checkColor: Colors.white,
                    activeColor: Colors.black,
                    value: torf,
                    onChanged: (valu) {
                      value.change(torf, index);
                    },
                  ),
                  title: Text(
                    task,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 19.5,
                      decoration: torf ? TextDecoration.lineThrough : null,
                      decorationColor: Colors.white,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                backgroundColor: Colors.black,
                content: GetBuilder<Provide>(builder: (txt) {
                  return TextFormField(
                    controller: txt.textEditingController,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () {
                            txt.todolist
                                .add([txt.textEditingController.text, false]);
                            debugPrint("${txt.todolist[1]}");
                            txt.update();
                            txt.textEditingController.clear();
                          },
                          icon: const Icon(Icons.add)),
                      border: const OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Colors.white)),
                      enabledBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Colors.white)),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.grey),
                      ),
                    ),
                    style: const TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                  );
                }),
              );
            },
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
