import 'package:flutter/material.dart';
import 'package:flutter_demo/src/ui/menu.dart';

class BottomNavigator extends StatefulWidget {
  BottomNavigator({Key key}) : super(key: key);

  @override
  _BottomNavigatorState createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  int _selectedIndex = 0;

  static List<Widget> _screens = <Widget>[Menu(), Menu(), Menu(), Menu()];

  static const List<BottomNavigationBarItem> _bottomBarItems =
      <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Меню',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: 'Профиль',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.shopping_basket),
      label: 'Корзина',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.info),
      label: 'Информация',
    ),
  ];
  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: _screens.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        items: _bottomBarItems,
        unselectedItemColor: Colors.grey[700],
        selectedItemColor: Colors.deepOrange,
        currentIndex: _selectedIndex,
        onTap: _onTap,
      ),
    );
  }
}
