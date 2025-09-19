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
          showModalBottomSheet(context: context, builder: (BuildContext context) {
            return Container(
              child: Column(
                children: [
                  ListTile(leading: Icon(Icons.share), title: Text('공유하기')),
                  ListTile(leading: Icon(Icons.link), title: Text('링크 복사')),
                  ListTile(leading: Icon(Icons.edit), title: Text('수정하기'))
                ],
              ),
            );
          },);
        }, icon: Icon(Icons.info)),
      )
    );
  }
}
