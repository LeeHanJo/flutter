import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

// 상태클래스
class _HomePageState extends State<HomePage> {
  // TodoList 목록
  List<String> toDoList = ['잔디심기'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: toDoList.isEmpty
            ? Center(
                child: Text("To Do List를 작성해주세요"),
              )
            : ListView.builder(
                itemBuilder: (context, index) {
                  String toDo = toDoList[index];

                  return ListTile(
                    title: Text(
                      toDo,
                      style: TextStyle(fontSize: 20),
                    ),
                    trailing: IconButton(
                        onPressed: () {}, icon: Icon(CupertinoIcons.delete)),
                    onTap: () {
                      print('$toDo : 아이템이 선택됨');
                    },
                  );
                },
              ));
  }
}
