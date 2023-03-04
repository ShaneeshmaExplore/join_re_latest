import 'dart:convert';

import 'package:join_re/screens/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:join_re/screens/chat/Conversation_page.dart';
import 'package:join_re/screens/employee/employee_home.dart';
import 'package:join_re/screens/employee/package_confirmation.dart';
import 'package:join_re/screens/employee/packages.dart';
import 'package:join_re/screens/employee/view_profile.dart';
import 'package:intl/intl.dart';
import 'package:join_re/screens/options/options.dart';
import 'package:join_re/utils/api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer';

class MainPage extends StatefulWidget {
  final pg;
  final login;
  final package_id;
  // final Emp_Prof data;
  const MainPage({Key? key, this.pg,this.login:'', this.package_id:''}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

var currentIndex;
bool _searchBoolean = false;
var arrData;
var arrPackages;
class _MainPageState extends State<MainPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey =
      new GlobalKey<ScaffoldState>(); //

// ADD THIS LINE
  @override
  void initState() {
    super.initState();
    setState(() {
      currentIndex = widget.pg;
    });
      onTabTapped(currentIndex);
  }

  void _logout() async{
    var res = await Network().getData('/logout');
    var body = json.decode(res.body);
    if(body['success']){
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.remove('user');
      localStorage.remove('token');
      Navigator.popUntil(
        context,
        ModalRoute.withName('/'),
      );
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context)=>Options()));
    }
  }

  Future list_packages(id) async {
    var data = {
      "api":"true",
      "id": id,
      "user_id" : widget.login[1],
    };
    var res = await Network().authData(data, '/list_packages');
    var convertedData;
    if(res.statusCode == 200){
      convertedData =json.decode(res.body);
    }
    else{

      convertedData = 0;
    }

    return convertedData;

  }
  Future view_profile() async {
    var data = {
      "id": widget.login[1],
    };
    var res = await Network().authData(data, '/view_profile');
    var convertedData;
    if(res.statusCode == 200){
      convertedData =json.decode(res.body);
      // convertedData =convertedData['job_seeker'];
    }
    else{
      convertedData = 0;
    }

    return convertedData;

  }
  onTabTapped(int index) async {
    setState(() {
      // if (index == 0) {
      //   _scaffoldKey.currentState?.openDrawer(); // CHANGE THIS LINE
      // } else {
      currentIndex = index;
      // }

    });
    if(currentIndex == 3){

      var item = await view_profile();
      if(item != null){
        setState((){
          arrData = item;
        });
      }

    }

    if(currentIndex == 4 || currentIndex == 5) {
      var id = 0;
      if(currentIndex == 5 ){
        id = widget.package_id;
      }
      var item = await list_packages(id);
      if(item != null){
        setState((){
          arrPackages = item;
        });
      }

    }

  }

  Widget _body() => SizedBox.expand(
        child: IndexedStack(
          index: currentIndex,
          children: <Widget>[
            EmployeeHome(name: widget.login[0],id: widget.login[1],),
            ConversationPage(),
            ConversationPage(),
            ViewProfile(id:widget.login[1],data:arrData),
            Packages(login:widget.login,packages:arrPackages),
            PackageConfirmation(login:widget.login,packages:arrPackages)
          ],
        ),
      );
  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formatter = DateFormat('yyyy-MM-dd H:mm:ss');
    var formattedDate = formatter.format(now);
    return Scaffold(
        body: _body(),
        key: _scaffoldKey,
        drawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              Container(
                height: 30,
                padding: const EdgeInsets.all(5.0),
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  child: Image(
                    width: 20,
                    image: AssetImage('assets/images/Close.png'),
                  ),
                  onTap: () => Navigator.pop(context),
                ),
              ),
              const DrawerHeader(
                  decoration: BoxDecoration(
                      // color: Color.fromARGB(255, 14, 8, 107),
                      ),
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Image(
                      width: 20,
                      image: AssetImage('assets/images/Joinre011.png'),
                    ),
                  )),
              Container(
                  color: currentIndex == 0
                      ? Color.fromRGBO(58, 54, 115, 1)
                      : Colors.white,
                  child: ListTile(
                    title: Row(
                      children: [
                        Image(
                          width: 25,
                          image: currentIndex == 0
                              ? AssetImage('assets/images/Home_selected.png')
                              : AssetImage('assets/images/Home.png'),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text("Home",
                            style: TextStyle(
                                color: currentIndex == 0
                                    ? Color.fromRGBO(255, 255, 255, 1)
                                    : Color.fromRGBO(58, 54, 115, 1)))
                      ],
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      onTabTapped(0);
                    },
                  )),
              Container(
                  color: currentIndex == 1
                      ? Color.fromRGBO(58, 54, 115, 1)
                      : Colors.white,
                  child: ListTile(
                    title: Row(
                      children: [
                        Image(
                          width: 25,
                          image: currentIndex == 1
                              ? AssetImage(
                                  'assets/images/Emailsend_selected.png')
                              : AssetImage('assets/images/Emailsend.png'),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text("Applied",
                            style: TextStyle(
                                color: currentIndex == 1
                                    ? Color.fromRGBO(255, 255, 255, 1)
                                    : Color.fromRGBO(58, 54, 115, 1)))
                      ],
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      onTabTapped(1);
                    },
                  )),
              Container(
                  color: currentIndex == 2
                      ? Color.fromRGBO(58, 54, 115, 1)
                      : Colors.white,
                  child: ListTile(
                    title: Row(
                      children: [
                        Image(
                          width: 25,
                          image: currentIndex == 2
                              ? AssetImage('assets/images/Typing_selected.png')
                              : AssetImage('assets/images/Typing.png'),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text("Inbox",
                            style: TextStyle(
                                color: currentIndex == 2
                                    ? Color.fromRGBO(255, 255, 255, 1)
                                    : Color.fromRGBO(58, 54, 115, 1)))
                      ],
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      onTabTapped(2);
                    },
                  )),
              Container(
                  color: currentIndex == 3
                      ? Color.fromRGBO(58, 54, 115, 1)
                      : Colors.white,
                  child: ListTile(
                    title: Row(
                      children: [
                        Image(
                          width: 25,
                          image: currentIndex == 3
                              ? AssetImage('assets/images/User_selected.png')
                              : AssetImage('assets/images/User.png'),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text("Profile",
                            style: TextStyle(
                                color: currentIndex == 3
                                    ? Color.fromRGBO(255, 255, 255, 1)
                                    : Color.fromRGBO(58, 54, 115, 1)))
                      ],
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      onTabTapped(3);
                    },
                  )),
              Divider(
                height: 170,
                thickness: 0,
                color: Colors.white,
              ),
              Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: ListTile(
                    title: Text(
                        formattedDate,
                        style: TextStyle(
                            fontSize: 10,
                            color: Color.fromRGBO(58, 54, 115, 1))),
                  )),
              Divider(
                thickness: 2,
                color: Color.fromRGBO(58, 54, 115, 1),
              ),
              Align(
                alignment: FractionalOffset.bottomCenter,
                child: ListTile(
                  title: Row(
                    children: [
                      Image(
                        width: 25,
                        image: AssetImage('assets/images/Shutdown.png'),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text("Logout",
                          style:
                              TextStyle(color: Color.fromRGBO(58, 54, 115, 1)))
                    ],
                  ),
                  onTap: () {
                    _logout();
                  
                  },
                ),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: !_searchBoolean ? Text('') : _searchTextField(),
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
                        setState(() {
                          _searchBoolean = true;
                        });
                      })
                ]
              : [
                  IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () {
                        setState(() {
                          _searchBoolean = false;
                        });
                      })
                ],
          backgroundColor: Color.fromRGBO(255, 255, 255, 255),
          foregroundColor: Color.fromRGBO(58, 54, 115, 1),
          centerTitle: true,
          elevation: 0.0,
        ),
        bottomNavigationBar: BottomNavBar(
          showElevation: true,
          selectedIndex: currentIndex,
          onItemSelected: (index) {
            setState(() => currentIndex = index);
          },
          items: <BottomNavBarItem>[
            BottomNavBarItem(
              title: 'Home',
              activeIcon: const Image(
                image: AssetImage('assets/images/Home_selected.png'),
                width: 20,
                height: 20,
              ),
              icon: const Image(
                image: AssetImage('assets/images/Home.png'),
                width: 20,
                height: 20,
              ),
              activeColor: Colors.white,
              inactiveColor: Color.fromRGBO(58, 54, 115, 1),
              activeBackgroundColor: Color.fromRGBO(58, 54, 115, 1),
            ),
            BottomNavBarItem(
              title: 'Applied',
              activeIcon: const Image(
                image: AssetImage('assets/images/Emailsend_selected.png'),
                width: 20,
                height: 20,
              ),
              icon: const Image(
                image: AssetImage('assets/images/Emailsend.png'),
                width: 20,
                height: 20,
              ),
              activeColor: Colors.white,
              inactiveColor: Color.fromRGBO(58, 54, 115, 1),
              activeBackgroundColor: Color.fromRGBO(58, 54, 115, 1),
            ),
            BottomNavBarItem(
              title: 'Inbox',
              activeIcon: const Image(
                image: AssetImage('assets/images/Typing_selected.png'),
                width: 20,
                height: 20,
              ),
              icon: const Image(
                image: AssetImage('assets/images/Typing.png'),
                width: 20,
                height: 20,
              ),
              inactiveColor: Color.fromRGBO(58, 54, 115, 1),
              activeColor: Colors.white,
              activeBackgroundColor: Color.fromRGBO(58, 54, 115, 1),
            ),
            BottomNavBarItem(
              title: 'Profile',
              activeIcon: const Image(
                image: AssetImage('assets/images/User_selected.png'),
                width: 20,
                height: 20,
              ),
              icon: const Image(
                image: AssetImage('assets/images/User.png'),
                width: 20,
                height: 20,
              ),
              inactiveColor: Color.fromRGBO(58, 54, 115, 1),
              activeColor: Colors.white,
              activeBackgroundColor: Color.fromRGBO(58, 54, 115, 1),
            ),
          ],
        ));
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
    textInputAction:
        TextInputAction.search, //Specify the action button on the keyboard
    decoration: InputDecoration(
      //Style of TextField
      enabledBorder: UnderlineInputBorder(
          //Default TextField border
          borderSide: BorderSide(color: Colors.white)),
      focusedBorder: UnderlineInputBorder(
          //Borders when a TextField is in focus
          borderSide: BorderSide(color: Colors.white)),
      hintText: 'Search', //Text that is displayed when nothing is entered.
      hintStyle: TextStyle(
        //Style of hintText
        color: Color.fromRGBO(58, 54, 115, 1),
        fontSize: 16,
        fontFamily: 'Open Sans',
      ),
    ),
  );
}