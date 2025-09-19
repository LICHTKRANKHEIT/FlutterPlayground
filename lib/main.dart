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
  int _currentPageIndex = 0;

  double _rotationTurns = 0.0; // 1이 360도. 따라서 "~바퀴를 회전"이 됨
  double _rotationSettingIconTurns = 0.0;

  bool isLightTheme = false;

  void showCurrentPapge(int index) {
    setState(() {
      _currentPageIndex = index;
      if (_currentPageIndex == 2) {
        _rotationSettingIconTurns += 0.25;
      }
    });
  }

  void _rotateIcon() {
    setState(() {
      _rotationTurns += 0.25;
    });
  }

  @override
  Widget build(BuildContext context) {
    final userInterfaceSize = MediaQuery.of(context).size;

    final double userInterfaceWidth = userInterfaceSize.width;

    final double userInterfaceHeight = userInterfaceSize.height;

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
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                      backgroundColor: (isLightTheme)
                          ? Color(0xFFE0E0E0)
                          : Color(0xFF121212),
                      title: Text("SET THEME",
                          style: TextStyle(
                              color: (isLightTheme)
                                  ? Color(0xFF424242)
                                  : Color(0xFFE0E0E0))),
                      content: FractionallySizedBox(
                        heightFactor: 0.12,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "테마를 변경하시겠어요? " +
                                  ((isLightTheme)
                                      ? "(to dark theme)"
                                      : "(to light theme)"),
                              style: TextStyle(
                                  color: (isLightTheme)
                                      ? Color(0xFF424242)
                                      : Color(0xFFE0E0E0)),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: OutlinedButton(
                                      onPressed: () {
                                        setState(() {
                                          isLightTheme = !isLightTheme;
                                        });
                                        Navigator.of(context).pop();
                                      },
                                      child: Text(
                                        "yes",
                                        style: TextStyle(
                                            color: (isLightTheme)
                                                ? Color(0xFF424242)
                                                : Color(0xFFE0E0E0)),
                                      )),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                    child: OutlinedButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text(
                                          "no",
                                          style: TextStyle(
                                              color: (isLightTheme)
                                                  ? Color(0xFF424242)
                                                  : Color(0xFFE0E0E0)),
                                        )))
                              ],
                            )
                          ],
                        ),
                      ));
                });
          },
          icon: (isLightTheme)
              ? Icon(
                  Icons.wb_sunny,
                  color: Color(0xFF424242),
                )
              : Icon(
                  Icons.nightlight,
                  color: Color(0xFFE0E0E0),
                ),
        ),
        title: Text(getAppBarTitle(),
            style: TextStyle(
                color: (isLightTheme) ? Color(0xFF424242) : Color(0xFFE0E0E0),
                fontWeight: FontWeight.bold,
                fontSize: 20)),
        actions: [
          IconButton(
              onPressed: () {
                _rotateIcon();
              },
              icon: AnimatedRotation(
                turns: _rotationTurns,
                duration: Duration(milliseconds: 170),
                child: Icon(Icons.settings,
                    color:
                        (isLightTheme) ? Color(0xFF424242) : Color(0xFFE0E0E0)),
              )),
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
              icon: AnimatedRotation(
                  turns: _rotationSettingIconTurns,
                  duration: Duration(milliseconds: 200),
                  child: Icon(Icons.memory, size: 32)),
              label: "memory"),
          BottomNavigationBarItem(
              icon: (_currentPageIndex == 3)
                  ? Icon(Icons.chat)
                  : Icon(Icons.chat_bubble_outline),
              label: "chat"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: "profile"),
        ],
        onTap: showCurrentPapge,
      ),
    );
  }
}
