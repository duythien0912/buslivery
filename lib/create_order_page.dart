import 'package:flutter/material.dart';

import 'map.dart';
import 'widget/app_bar.dart';

class CreateNewOrder extends StatelessWidget {
  const CreateNewOrder({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: SafeArea(child: Text("Vị trí đi")),
        backgroundColor: Colors.white,
        leading: SafeArea(child: BackButton()),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlatButton(
              padding: const EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 0,
              ),
              color: Colors.yellow,
              child: Text(
                'Next',
                style: TextStyle(
                  color: Colors.indigo[900],
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MapPage(),
                  ),
                );
              },
            ),
          )
        ],
      ),
      body: SafeArea(
        child: ContentCreateOrder(),
      ),
    );
  }
}

class ContentCreateOrder extends StatefulWidget {
  const ContentCreateOrder({
    Key key,
  }) : super(key: key);

  @override
  _ContentCreateOrderState createState() => _ContentCreateOrderState();
}

class _ContentCreateOrderState extends State<ContentCreateOrder> {
  TextEditingController _endcontroller = TextEditingController();
  TextEditingController _startcontroller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _startcontroller.text = "105 Tôn Dật Tiên, Quận 7, Hồ Chí Minh";
    _endcontroller.text =
        "157 Đường số 1, Tân Phú, Quận 7, Hồ Chí Minh, Việt Nam";
  }

  // 10.7360178,106.7179731,17z

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      child: Column(
        children: <Widget>[
          // Container(
          //   width: double.infinity,
          //   child: Text(
          //     'Điểm gửi',
          //   ),
          // ),

          Padding(
            padding: EdgeInsets.only(top: 32),
          ),
          TextField(
            maxLines: 1,
            controller: _startcontroller,
            decoration: InputDecoration(
              // contentPadding:
              //     const EdgeInsets.only(top: 8.0, left: 16.0, right: 16.0),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 1.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 1.0),
              ),
              hintText: "Điểm gửi",
              // helperText: "Điểm gửi",
              labelText: "Điểm gửi",
              hintStyle: TextStyles.textGrayC14,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 32),
          ),
          TextField(
            maxLines: 1,
            controller: _endcontroller,
            decoration: InputDecoration(
              // contentPadding:
              //     const EdgeInsets.only(top: 8.0, left: 16.0, right: 16.0),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 1.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 1.0),
              ),
              hintText: "Điểm nhận",
              // helperText: "Điểm nhận",
              labelText: "Điểm nhận",
              hintStyle: TextStyles.textGrayC14,
            ),
          ),
        ],
      ),
    );
  }
}
