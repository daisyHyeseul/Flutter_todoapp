// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.yellow,
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: Colors.orange)),
      home: const MyApp(),
    ));

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  List todos = [];
  String input = "";

  @override
  void initState() {
    super.initState();
    todos.add("해커톤 준비");
    todos.add("플러터공부");
    todos.add("토플 공부");
    todos.add("맛있는 밥먹기");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("TodoList")),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                      title: const Text("할 일 추가하기"),
                      content: TextField(
                        onChanged: (String value) {
                          input = value;
                        },
                      ),
                      actions: <Widget>[
                        TextButton(
                            onPressed: () {
                              setState(() {
                                todos.add(input);
                              });
                              Navigator.of(context).pop();
                            },
                            child: const Text("추가하기"))
                      ]);
                });
          },
          child: const Icon(
            Icons.add,
            color: Colors.yellow,
          ),
        ),
        body: ListView.builder(
            itemCount: todos.length,
            itemBuilder: (BuildContext context, int index) {
              return Dismissible(
                key: Key(todos[index]),
                child: Card(
                  elevation: 4,
                  margin: const EdgeInsets.all(8),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  child: ListTile(
                      title: Text(todos[index]),
                      trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.yellow),
                          onPressed: () {
                            setState(() {
                              todos.removeAt(index);
                            });
                          })),
                ),
              );
            }));
  }
}
