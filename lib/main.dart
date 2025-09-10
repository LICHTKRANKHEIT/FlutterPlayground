import 'dart:html';

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
        backgroundColor: (isLightTheme) ? Color(0xFFF5F5F5) : Color(0xFF121212),
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
                  color: (isLightTheme) ? Color(0xFF424242) : Color(0xFFE0E0E0),
                )
              : Icon(
                  Icons.nightlight,
                  color: (isLightTheme) ? Color(0xFF424242) : Color(0xFFE0E0E0),
                ),
        ),
        title: Text(getAppBarTitle(),
            style: TextStyle(
                color: (isLightTheme) ? Color(0xFF424242) : Color(0xFFE0E0E0),
                fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.settings,
                  color:
                      (isLightTheme) ? Color(0xFF424242) : Color(0xFFE0E0E0))),
          SizedBox(
            width: 5,
          )
        ],
      ),
      body: _widgetList[_currentPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: (isLightTheme) ? Color(0xFFF5F5F5) : Color(0xFF121212),
        unselectedItemColor:
            (isLightTheme) ? Color(0xFF424242) : Color(0xFFE0E0E0),
        selectedItemColor:
            (isLightTheme) ? Color(0xFF4CAF50) : Color(0xFFFF9800),
        currentIndex: _currentPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "home",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "search"),
          BottomNavigationBarItem(
              icon: Icon(Icons.memory, size: 32), label: "memory"),
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
