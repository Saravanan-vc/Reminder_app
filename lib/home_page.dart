import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/provide.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
          return Column(
            children: [
              Expanded(
                flex: 2,
                child: ListView.builder(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  itemCount: value.todolist.length,
                  itemBuilder: (context, index) {
                    String task = value.todolist[index][0];
                    bool donot = value.todolist[index][1];
                    return Card(
                      color: donot ? Colors.black : Colors.grey.shade900,
                      child: ListTile(
                        leading: Checkbox(
                          checkColor: Colors.white,
                          activeColor: Colors.black,
                          value: donot,
                          onChanged: (valu) {
                            value.dontit(index);
                          },
                        ),
                        title: Text(
                          task,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 19.5,
                            decoration:
                                donot ? TextDecoration.lineThrough : null,
                            decorationColor: Colors.white,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Container(
          width: double.infinity,
          color: Colors.black,
          height: 60,
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: GetBuilder<Provide>(builder: (txt) {
              return TextFormField(
                controller: txt.textEditingController,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: () {
                        txt.addtolist(txt.textEditingController.text, false);
                      },
                      icon: const Icon(
                        Icons.add,
                        color: Colors.white,
                      )),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.white)),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.white)),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.white),
                  ),
                ),
                style: const TextStyle(color: Colors.white),
                onTapOutside: (_) {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                cursorColor: Colors.white,
              );
            }),
          ),
        ),
      ),
    );
  }
}
