import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'create_order_page.dart';
import 'create_success.dart';
import 'model/bus_app_model.dart';

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
      home: MultiProvider(providers: [
        ChangeNotifierProvider(builder: (_) => BusAppAppModel()),
      ], child: MyHomePage()),
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
    final BusAppAppModel busModel = Provider.of<BusAppAppModel>(context);

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
          busModel.setShowBusItem(true);
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BottomNavigationBar(
        // backgroundColor: Color.fromRGBO(200, 200, 200, 1),
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        unselectedItemColor: Color.fromRGBO(30, 55, 109, 1),
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
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                child: new ListOrder(),
                height: double.infinity,
              ),
            ),
          ],
        ),
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
    final BusAppAppModel busModel = Provider.of<BusAppAppModel>(context);

    return ListView(
      children: <Widget>[
        if (isView)
          Container(
            padding: EdgeInsets.only(top: 15),
            // color: Colors.white,
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 10,
                ),
                Image.asset(
                  "assets/vnpostlogo2.png",
                  height: 42,
                ),
              ],
            ),
          ),
        if (isView)
          Padding(
            padding: const EdgeInsets.only(
              top: 12.0,
              // bottom: 12.0,
              left: 10,
              right: 10,
            ),
            child: Image.asset("assets/qc.jpg"),
          ),
        if (busModel.isShow == true)
          ItemOrderList(isView: isView),
        // ItemOrderList(isView: isView),
        // ItemOrderList(isView: isView),
        // ItemOrderList(isView: isView),
        // ItemOrderList(isView: isView),
      ],
    );
  }
}

class ItemOrderList extends StatelessWidget {
  const ItemOrderList({
    Key key,
    @required this.isView,
  }) : super(key: key);

  final bool isView;

  @override
  Widget build(BuildContext context) {
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
                    "Bến xe 1",
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  // Text(
                  //   "x1",
                  //   style: TextStyle(
                  //     fontSize: 12,
                  //     color: Colors.black12,
                  //   ),
                  // ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: <Widget>[
                  Text(
                    "Bến xe 2",
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  // Text(
                  //   "x2",
                  //   style: TextStyle(
                  //     fontSize: 12,
                  //     color: Colors.black45,
                  //   ),
                  // ),
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
  }
}

class OrderPage extends StatelessWidget {
  const OrderPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: <Widget>[
              TabBar(
                tabs: [
                  Tab(icon: Text("Đang đến")),
                  Tab(icon: Text("Lịch sử")),
                  Tab(icon: Text("Đợn nháp")),
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height - 124,
                child: TabBarView(
                  children: [
                    ListOrder(
                      isView: false,
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                        top: 12.0,
                        bottom: 12.0,
                        left: 10,
                        right: 10,
                      ),
                      child: ListView.builder(
                        itemCount: 5,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            width: double.infinity,
                            padding: const EdgeInsets.only(
                              top: 12.0,
                              bottom: 12.0,
                              left: 10,
                              right: 10,
                            ),
                            margin: const EdgeInsets.only(
                              top: 12.0,
                              bottom: 12.0,
                            ),
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
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Text(
                                          "Điện tử",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w800),
                                        ),
                                        Text(" - "),
                                        Text(
                                          "Đã xong",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w800,
                                            color: Colors.green,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text("#123123123")
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  height: 1,
                                  width: double.infinity,
                                  color: Colors.black12,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: <Widget>[
                                    Image.asset(
                                      "assets/boxw.jpg",
                                      height: 36,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Expanded(
                                      child: Text(
                                        "Bến xe số 16 Đường 3 quận 4 Thành Phố Hồ Chí Minh",
                                        overflow: TextOverflow.clip,
                                        style: TextStyle(
                                          fontSize: 11,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      height: 30,
                                      // width: 80,
                                      padding: const EdgeInsets.all(0.0),
                                      width: 80,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                        color: Colors.indigo,
                                      ),

                                      child: FlatButton(
                                        padding: const EdgeInsets.all(0.0),
                                        onPressed: () {},
                                        child: Text(
                                          "Đánh giá",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  height: 1,
                                  width: double.infinity,
                                  color: Colors.black12,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "12,000đ - Ví VietNamPay",
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    Icon(Icons.directions_bike),
                  ],
                ),
              ),
            ],
          ),
        ),
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
