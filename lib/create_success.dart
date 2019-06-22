import 'package:flutter/material.dart';

import 'main.dart';

class CreateSuccessPage extends StatelessWidget {
  const CreateSuccessPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double dWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  child: Image.asset(
                    "assets/qr2.png",
                    height: dWidth / 2,
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
                        builder: (context) => MyHomePage(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
