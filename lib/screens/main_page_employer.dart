import 'dart:convert';

import 'package:join_re/screens/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:join_re/screens/company/employer_home.dart';
import 'package:intl/intl.dart';
import 'package:join_re/screens/options/options.dart';
import 'package:join_re/utils/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainPageEmployer extends StatefulWidget {
  final pg;
  final login;
  final arrPostedJob;
  const MainPageEmployer({Key? key, this.pg,this.login:'',this.arrPostedJob:''}) : super(key: key);

  @override
  State<MainPageEmployer> createState() => _MainPageEmployerState();
}
var currentIndex;
bool _searchBoolean = false;
int job_id = 0;
var arrData;
class _MainPageEmployerState extends State<MainPageEmployer> {
  final GlobalKey<ScaffoldState> _scaffoldKey =
      new GlobalKey<ScaffoldState>(); // ADD THIS LINE
  @override
  void initState() {
    super.initState();
    setState(() {
      currentIndex =widget.pg;
    });
      onLoad();
  }
  Future onLoad() async{
    var item = await posted_jobs();
    if (item != null) {
      setState(() {
        arrData = item;
      });
    }
  }
  void _logoutEmployer() async{
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

  Future posted_jobs() async {
    var data = {
      "id": widget.login[1],
    };
    var res = await Network().authData(data, '/posted_jobs');
    var convertedData;
    if(res.statusCode == 200){
      convertedData =json.decode(res.body);
      // convertedData =convertedData['posted_jobs'];
    }
    else{
      convertedData = 0;
    }

    return convertedData;

  }
  void onTabTapped(int index) async{
    setState(() {
      currentIndex = index;
    });

  }

  Widget _body() => SizedBox.expand(
        child: IndexedStack(
          index: currentIndex,
          children: <Widget>[


            EmployerHome(emp_pg:0,login_id:widget.login,arrData:arrData,arrPostedJob:widget.arrPostedJob,),
            EmployerHome(emp_pg:1,login_id:widget.login,arrData:arrData,),

            // ConversationPage(),
            // ConversationPage(),
            // ViewProfile(),
            // Packages()

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
                          style: TextStyle(
                              color: Color.fromRGBO(58, 54, 115, 1)))
                    ],
                  ),
                  onTap: () {
                    _logoutEmployer();

                  },
                ),
              ),
              Divider(
                thickness: 2,
                color: Color.fromRGBO(58, 54, 115, 1),
              ), Align(
                      alignment: FractionalOffset.bottomCenter,
                      child: ListTile(
                        title: Text(
                            formattedDate,
                            style: TextStyle(fontSize: 10,

                            color: Color.fromRGBO(58, 54, 115, 1))),
                      ))
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
          actions:!_searchBoolean
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
                }
            )
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