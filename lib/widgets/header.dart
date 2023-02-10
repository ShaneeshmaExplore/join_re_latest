import 'package:flutter/material.dart';

class Header extends StatelessWidget with PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
  bool _searchBoolean = false;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title:  _searchTextField(),

      leading: Builder(
          builder: (context) => IconButton(
            icon: Image(
              width: 20,
              image: AssetImage('assets/images/Image_1.png'),
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
          )),
      actions: !_searchBoolean
          ? [
        IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              _searchBoolean = true;
            })
      ]
          : [
        IconButton(
            icon: Icon(Icons.clear),
            onPressed: () {
              _searchBoolean = false;
            }
        )
      ],
      backgroundColor: Color.fromRGBO(255, 255, 255, 255),
      foregroundColor: Color.fromRGBO(58, 54, 115, 1),
      centerTitle: true,
      elevation: 0.0,
    );

  }
}

Widget _searchTextField() {
  return TextField(
    autofocus: true, //Display the keyboard when TextField is displayed
    cursorColor: Color.fromRGBO(58, 54, 115, 1),
    style: TextStyle(
      color: Color.fromRGBO(58, 54, 115, 1),
      fontSize: 16,
      fontFamily: 'Open Sans',
    ),
    textInputAction: TextInputAction.search, //Specify the action button on the keyboard
    decoration: InputDecoration( //Style of TextField
      enabledBorder: UnderlineInputBorder( //Default TextField border
          borderSide: BorderSide(color: Colors.white)
      ),
      focusedBorder: UnderlineInputBorder( //Borders when a TextField is in focus
          borderSide: BorderSide(color: Colors.white)
      ),
      hintText: 'Search', //Text that is displayed when nothing is entered.
      hintStyle: TextStyle( //Style of hintText
        color: Color.fromRGBO(58, 54, 115, 1),
        fontSize: 16,
        fontFamily: 'Open Sans',
      ),
    ),
  );
}