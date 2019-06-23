import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'main.dart';
import 'model/bus_app_model.dart';

class CreateSuccessPage extends StatefulWidget {
  const CreateSuccessPage({Key key}) : super(key: key);

  @override
  _CreateSuccessPageState createState() => _CreateSuccessPageState();
}

class _CreateSuccessPageState extends State<CreateSuccessPage> {
  final GlobalKey<ScaffoldState> mScaffoldState =
      new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double dWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      key: mScaffoldState,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    final snackBar = new SnackBar(
                      content: new Text('Đã nhận hàng thành công'),
                    );
                    mScaffoldState.currentState.showSnackBar(snackBar);

                    // showDialog(
                    //   context: context,
                    //   builder: (BuildContext context) =>
                    //       new CupertinoAlertDialog(
                    //         // title: new Text("Alert"),
                    //         content: Row(
                    //           children: <Widget>[
                    //             new Image.asset(
                    //               "assets/success.png",
                    //               height: 10,
                    //             ),
                    //             Text("Đã nhận hàng"),
                    //           ],
                    //         ),
                    //         actions: [
                    //           CupertinoDialogAction(
                    //             isDefaultAction: true,
                    //             child: new Text("Ok"),
                    //             onPressed: () {

                    //             },
                    //           )
                    //         ],
                    //       ),
                    // );
                  },
                  child: Container(
                    child: Image.asset(
                      "assets/qr2.png",
                      height: dWidth / 2,
                    ),
                  ),
                ),
              ),
              Container(
                height: 50,
                width: double.infinity,
                child: FlatButton(
                  color: Color.fromRGBO(
                    246,
                    167,
                    27,
                    1,
                  ),
                  child: Text(
                    "HOÀN THÀNH",
                    style: TextStyle(
                      color: Color.fromRGBO(
                        // 246,
                        // 167,
                        // 27,
                        255,
                        255,
                        255,
                        1,
                      ),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  // Icon(
                  //   Icons.navigate_next,
                  // ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyHomePage(isshow: true),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
