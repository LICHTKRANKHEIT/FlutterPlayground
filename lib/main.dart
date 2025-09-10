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
      home: MyStatefulPage(),
    );
  }
}

class MyStatefulPage extends StatefulWidget {
  const MyStatefulPage({super.key});

  @override
  State<MyStatefulPage> createState() => _MyStatefulPageState();
}


class _MyStatefulPageState extends State<MyStatefulPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IconButton(onPressed: () {
          showDialog(context: context, builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Title"),
              content: Text("내용들"),
              actions: [
                TextButton(onPressed: () {
                  Navigator.of(context).pop();
                }, child: Text("닫기"))
              ],
            );
          },);
        }, icon: Icon(Icons.info)),
      )
    );
  }
}
