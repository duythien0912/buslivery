import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'create_order_page.dart';
import 'create_success.dart';

void main() {
  runApp(
    MyApp(),
  );

  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyApp extends StatelessWidget {
  static const Map<TargetPlatform, PageTransitionsBuilder> _defaultBuilders =
      <TargetPlatform, PageTransitionsBuilder>{
    TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
    TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        pageTransitionsTheme: PageTransitionsTheme(builders: _defaultBuilders),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Widget> _children = [
    HomePage(),
    OrderPage(),
    UserPage(),
  ];

  int _currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreateNewOrder(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Container(height: 0.0),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt),
            title: Container(height: 0.0),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Container(height: 0.0),
          ),
          BottomNavigationBarItem(
            icon: Container(),
            title: Container(height: 0.0),
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(240, 240, 240, 1),
      child: SafeArea(
        child: new ListOrder(),
      ),
    );
  }
}

class ListOrder extends StatelessWidget {
  const ListOrder({
    Key key,
    this.isView = true,
  }) : super(key: key);
  final bool isView;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 6,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(
            top: 12.0,
            bottom: 12.0,
            left: 10,
            right: 10,
          ),
          child: GestureDetector(
            onTap: () {
              if (!isView) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CreateSuccessPage(),
                  ),
                );
              }
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Color(0x80DCE7FA),
                      offset: Offset(0.0, 2.0),
                      blurRadius: 8.0,
                      spreadRadius: 0.0),
                ],
              ),
              width: double.infinity,
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "21290129",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Hàng dễ vỡ xin nhẹ tay",
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: double.infinity,
                    height: 1,
                    color: Colors.black12,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "Điện thoại iphone 6",
                        style: TextStyle(
                          fontSize: 13,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "x1",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black45,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "Điện thoại iphone 7",
                        style: TextStyle(
                          fontSize: 13,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "x2",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black45,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: double.infinity,
                    height: 1,
                    color: Colors.black12,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("12.000đ"),
                      Text(
                        "23.07.2019 02:10 AM",
                        style: TextStyle(
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                  if (isView)
                    SizedBox(
                      height: 5,
                    ),
                  if (isView)
                    Container(
                      width: double.infinity,
                      height: 1,
                      color: Colors.black12,
                    ),
                  if (isView)
                    SizedBox(
                      height: 5,
                    ),
                  if (isView)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          height: 24,
                          width: 52,
                          child: FlatButton(
                            padding: const EdgeInsets.all(0),
                            color: Colors.redAccent,
                            child: Text(
                              "Hủy",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            onPressed: () {},
                          ),
                        ),
                        Container(
                          height: 24,
                          width: 52,
                          child: FlatButton(
                            padding: const EdgeInsets.all(0),
                            color: Color.fromRGBO(57, 48, 216, 1),
                            child: Text(
                              "Xem",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CreateSuccessPage(),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class OrderPage extends StatelessWidget {
  const OrderPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: new ListOrder(isView: false),
      ),
    );
  }
}

class UserPage extends StatelessWidget {
  const UserPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("UserPage"),
      ),
    );
  }
}
