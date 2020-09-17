import 'package:chat_app_flutter/screens/home/chat_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(
            _selectedIndex,
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            _itemBottomBar(
              "Chat",
              Icons.chat,
            ),
            _itemBottomBar(
              "Video",
              Icons.video_label,
            ),
            _itemBottomBar(
              "Image",
              Icons.image,
            ),
            _itemBottomBar(
              "Job",
              Icons.business,
            ),
            _itemBottomBar(
              "Shoping",
              Icons.shop,
            ),
            _itemBottomBar(
              "Setting",
              Icons.settings,
            ),
          ],
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: TextStyle(
            color: Colors.red,
          ),
          showUnselectedLabels: true,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }

  BottomNavigationBarItem _itemBottomBar(String _text, IconData _iconData) {
    return BottomNavigationBarItem(
      icon: Icon(
        _iconData,
        color: Colors.grey,
        size: 25.0,
      ),
      title: Text(
        _text,
        style: TextStyle(
          fontSize: 14,
        ),
      ),
      activeIcon: Icon(
        _iconData,
        color: Colors.blue,
        size: 25.0,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    ChatScreen(),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Text(
      'Index 3: School',
      style: optionStyle,
    ),
    Text(
      'Index 4: School',
      style: optionStyle,
    ),
    Text(
      'Index 5: Shoping',
      style: optionStyle,
    ),
  ];
}
