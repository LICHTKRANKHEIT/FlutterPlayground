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
              content: Container(
                width: 250,
                height: 100,
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Text("알림"),
                        Text("이거 알림임 ㅅㄱ")
                      ],
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: IconButton(onPressed: () {Navigator.of(context).pop();}, icon: Icon(Icons.close)),
                    )
                  ],
                ),
              ),
            );
          },);
        }, icon: Icon(Icons.info)),
      )
    );
  }
}
