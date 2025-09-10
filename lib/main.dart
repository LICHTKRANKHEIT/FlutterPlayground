// import 'dart:ffi';
// import 'dart:ui';

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
  bool isLightTheme = true;

  int _currentPageIndex = 0;

  void showCurrentPapge(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetList = [
      Container(
        color: (isLightTheme) ? Colors.white : Colors.black,
      ),
      Container(
        color: (isLightTheme) ? Colors.white : Colors.black,
      ),
      Container(
        color: (isLightTheme) ? Colors.white : Colors.black,
      ),
      Container(
        color: (isLightTheme) ? Colors.white : Colors.black,
      ),
      Container(
        color: (isLightTheme) ? Colors.white : Colors.black,
      ),
    ];

    String getAppBarTitle() {
      switch (_currentPageIndex) {
        case 0:
          return "Home";
        case 1:
          return "Search";
        case 2:
          return "Memory";
        case 3:
          return "Chat";
        case 4:
          return "Profile";
        default:
          return "unknown";
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: (isLightTheme) ? Colors.white : Colors.black,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            setState(() {
              (isLightTheme) ? isLightTheme = false : isLightTheme = true;
            });
          },
          icon: (isLightTheme)
              ? Icon(
                  Icons.wb_sunny,
                  color: (isLightTheme) ? Colors.black : Colors.white,
                )
              : Icon(
                  Icons.nightlight,
                  color: (isLightTheme) ? Colors.black : Colors.white,
                ),
        ),
        title: Text(getAppBarTitle(),
            style: TextStyle(
                color: (isLightTheme) ? Colors.black : Colors.white,
                fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.settings,
                  color: (isLightTheme) ? Colors.black : Colors.white))
        ],
      ),
      body: _widgetList[_currentPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: (isLightTheme) ? Colors.black : Colors.orange,
        unselectedItemColor: (isLightTheme) ? Colors.grey : Colors.white,
        backgroundColor: (isLightTheme) ? Colors.white : Colors.black,
        currentIndex: _currentPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "home",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "search"),
          BottomNavigationBarItem(
              icon: Icon(Icons.memory, size: 35), label: "memory"),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble_outline), label: "chat"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: "profile"),
        ],
        onTap: showCurrentPapge,
      ),
    );
  }
}
