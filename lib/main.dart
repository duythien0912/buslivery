import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './presentation/custom_icons_icons.dart';
import 'widget/app_bar.dart';

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
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomePage(),
    OrderPage(),
    UserPage(),
  ];

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
      child: Center(
        child: Text("HomePage"),
      ),
    );
  }
}

class OrderPage extends StatelessWidget {
  const OrderPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("OrderPage"),
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

class CreateNewOrder extends StatelessWidget {
  const CreateNewOrder({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SafeArea(child: Text("Tạo vận đơn")),
        backgroundColor: Colors.white,
        leading: SafeArea(child: BackButton()),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: SingleChildScrollView(child: Text('CreateNewOrder')),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0),
              child: FlatButton(
                textColor: Colors.indigo[900],
                color: Colors.yellow,
                onPressed: () {
                  Navigator.maybePop(
                    context,
                  );
                },
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 48,
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: Text(
                        "Tạo đơn",
                        style: TextStyle(fontSize: Dimens.font_sp18),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
