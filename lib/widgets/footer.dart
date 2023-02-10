import 'package:flutter/material.dart';

class Footer extends StatefulWidget {
  const Footer({super.key});


  @override
  _Footer createState() => _Footer();
}

int _selectedIndex = 0;

class _Footer extends State {
  @override
  void initState() {
    super.initState();
    _bottomNavigationBarItems.add(_updateActiveState(0));
    for (var i = 1; i < _footerItemNames.length; i++) {
      _bottomNavigationBarItems.add(_updateDeactiveState(i));
    }
  }

  final List<BottomNavigationBarItem> _bottomNavigationBarItems =
      <BottomNavigationBarItem>[];
  static const _footerIcons = [
    AssetImage('assets/images/Home.png'),
    AssetImage('assets/images/Emailsend.png'),
    AssetImage('assets/images/Typing.png'),
    AssetImage('assets/images/User.png'),
  ];
  static const _footerActiveIcons = [
    AssetImage('assets/images/home_selected1.png'),
    AssetImage('assets/images/Emailsend_selected.png'),
    AssetImage('assets/images/Typing_selected.png'),
    AssetImage('assets/images/User_selected.png'),
  ];
  static const _footerItemNames = [
    'Home',
    'Applied',
    'Inbox',
    'Profile',
  ];

  // Activating index items
  BottomNavigationBarItem _updateActiveState(int index) {
    return BottomNavigationBarItem(
      icon: Image(
        width: 20,
        image: _footerIcons[index],
      ),
      label: _footerItemNames[index],
      //  Text(
      //   _footerItemNames[index],

      //   style: TextStyle(
      //     color: Colors.black87,
      //   ),
      // )
    );
  }

  BottomNavigationBarItem _updateDeactiveState(int index) {
    return BottomNavigationBarItem(
        icon: Image(
          width: 20,
          image: _footerIcons[index],
          // color: Color.fromRGBO(58, 54, 115, 1),
        ),
        label: _footerItemNames[index]
        // title: Text(
        //   _footerItemNames[index],
        //   style: TextStyle(
        //     color: Colors.black26,
        //   ),
        // )
        );
  }

  void _onItemTapped(int index) {
    setState(() {
      _bottomNavigationBarItems[_selectedIndex] =
          _updateDeactiveState(_selectedIndex);
      _bottomNavigationBarItems[index] = _updateActiveState(index);
      _selectedIndex = index;
      if (index == 0) {
        Navigator.pushNamed(context, "/employee_home");
      }
      if (index == 1) {
        Navigator.pushNamed(context, "/inbox");
      }
      if (index == 2) {
        Navigator.pushNamed(context, "/inbox");
      }
      // if (index == 3) {
      //   Navigator.pushNamed(context, "/view_profile");
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: _bottomNavigationBarItems,
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
    );
  }
}
