import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'create_order_page.dart';

class MapPage extends StatelessWidget {
  const MapPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: SafeArea(
      //   child: Padding(
      //     padding: const EdgeInsets.only(top: 120.0),
      //     child: FloatingActionButton(
      //       mini: true,
      //       backgroundColor: Colors.black,
      //       onPressed: () {
      //         Navigator.push(
      //           context,
      //           MaterialPageRoute(
      //             builder: (context) {
      //               Navigator.push(
      //                 context,
      //                 MaterialPageRoute(
      //                   builder: (context) => CreateNewOrder(),
      //                 ),
      //               );
      //             },
      //           ),
      //         );
      //       },
      //       child: Icon(
      //         Icons.arrow_back,
      //         color: Colors.white,
      //       ),
      //     ),
      //   ),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      body: SafeArea(
        child: MapWidget(),
      ),
    );
  }
}

class MapWidget extends StatefulWidget {
  const MapWidget({
    Key key,
  }) : super(key: key);

  @override
  _MapWidgetState createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  static const LatLng _center = const LatLng(10.7270466, 106.718232);

  final Set<Circle> _circles = {};
  Completer<GoogleMapController> _controller = Completer();
  LatLng _lastMapPosition = _center;
  final Set<Marker> _markers = {};

  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);

    setState(() {
      _markers.add(Marker(
        markerId: MarkerId(_lastMapPosition.toString()),
        position: _lastMapPosition,
        infoWindow: InfoWindow(
          title: 'Địa điểm của tôi',
          snippet: '105 Tôn Dật Tiên, Quận 7, Hồ Chí Minh',
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));
      // _markers.add(
      //   Marker(
      //     markerId: MarkerId(LatLng(10.7270465, 106.711639).toString()),
      //     position: LatLng(10.7270465, 106.711639),
      //     infoWindow: InfoWindow(
      //       title: 'Trạm xe Bus Bệnh viện Việt Pháp',
      //       snippet: '105 Tôn Dật Tiên, Quận 7, Hồ Chí Minh',
      //     ),
      //     icon: BitmapDescriptor.defaultMarker,
      //   ),
      // );

      _circles.add(
        Circle(
          strokeWidth: 1,
          strokeColor: Color.fromRGBO(170, 218, 255, 1),
          fillColor: Color.fromRGBO(170, 218, 255, 0.3),
          circleId: CircleId(
            _lastMapPosition.toString(),
          ),
          center: _lastMapPosition,
          radius: 600,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 15.0,
          ),
          onCameraMove: _onCameraMove,
          markers: _markers,
          circles: _circles,
          myLocationEnabled: false,
          myLocationButtonEnabled: false,
        ),
        Padding(
          padding: const EdgeInsets.all(0.0),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              decoration: BoxDecoration(
                // borderRadius: BorderRadius.circular(16.0),
                color: Color.fromRGBO(
                  // 30,
                  // 55,
                  // 109,
                  // 1,
                  // 246,
                  //       167,
                  //       27,
                  255,
                  255,
                  255,
                  1,
                ),
              ),
              width: double.infinity,
              height: 180,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 16,
                ),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "Giá phí",
                                      style: TextStyle(
                                        color: Color.fromRGBO(
                                          37,
                                          40,
                                          40,
                                          1,
                                        ),
                                        fontSize: 24,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "10.000đ",
                                      style: TextStyle(
                                        color: Color.fromRGBO(
                                          37,
                                          40,
                                          40,
                                          1,
                                        ),
                                        fontSize: 25,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    // Container(
                                    //   height: 20,
                                    //   width: 40,
                                    //   color: Colors.red,
                                    // ),
                                    // SizedBox(
                                    //   height: 3,
                                    // ),
                                    // Container(
                                    //   height: 20,
                                    //   width: 40,
                                    //   color: Colors.blue,
                                    // ),
                                    Image.asset(
                                      "images/zalo.png",
                                      height: 40,
                                    )
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32.0),
                        color: Color.fromRGBO(
                          // 246,
                          // 167,
                          // 27,
                          // 1,
                          30,
                          55,
                          109,
                          1,
                        ),
                      ),
                      height: 40,
                      width: double.infinity,
                      child: FlatButton(
                        child: Text(
                          "ĐỒNG Ý",
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
                        onPressed: () {},
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
