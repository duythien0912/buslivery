import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'create_success.dart';

class MapPage extends StatelessWidget {
  const MapPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
  static const LatLng _center = const LatLng(10.7270466, 106.7182326);

  final Set<Circle> _circles = {};
  Completer<GoogleMapController> _controller = Completer();
  LatLng _lastMapPosition = _center;
  Map<PolylineId, Polyline> _mapPolylines = {};
  BitmapDescriptor _markerIcon;
  int _polylineIdCounter = 1;

  void _onCameraMove(CameraPosition position) {
    print(position.target);
    _lastMapPosition = position.target;
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);

    final List<LatLng> points = <LatLng>[];
    points.add(LatLng(10.727342, 106.719718));
    points.add(LatLng(10.728236, 106.721949));
    points.add(LatLng(10.731146, 106.720490));
    points.add(LatLng(10.738830, 106.721820));
    // points.add(LatLng(10.7270466, 106.718232));
    // points.add(LatLng(10.7270466, 106.718232));
    final String polylineIdVal = 'polyline_id_$_polylineIdCounter';
    _polylineIdCounter++;
    final PolylineId polylineId = PolylineId(polylineIdVal);

    final Polyline polyline = Polyline(
      polylineId: polylineId,
      consumeTapEvents: true,
      color: Color.fromRGBO(30, 55, 109, 1),
      width: 3,
      points: points,
    );

    setState(() {
      _mapPolylines[polylineId] = polyline;
    });
  }

  Future<void> _createMarkerImageFromAsset(BuildContext context) async {
    if (_markerIcon == null) {
      final ImageConfiguration imageConfiguration =
          createLocalImageConfiguration(context, size: Size.square(50));
      BitmapDescriptor.fromAssetImage(imageConfiguration, 'assets/busstop2.jpg')
          .then(_updateBitmap);
      print("update marker");
    }
  }

  void _updateBitmap(BitmapDescriptor bitmap) {
    setState(() {
      _markerIcon = bitmap;
    });
  }

  Set<Marker> _createMarker() {
    return <Marker>[
      Marker(
        markerId: MarkerId("marker_1"),
        position: LatLng(10.727342, 106.719718),
        // icon: _markerIcon,
      ),
      Marker(
        markerId: MarkerId("marker_2"),
        position: LatLng(10.728236, 106.721949),
        icon: _markerIcon,
      ),
      Marker(
        markerId: MarkerId("marker_3"),
        position: LatLng(10.738830, 106.721820),
        icon: _markerIcon,
      ),
    ].toSet();
  }

  @override
  Widget build(BuildContext context) {
    _createMarkerImageFromAsset(context);

    return Stack(
      children: <Widget>[
        GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: LatLng(10.72967, 106.72041),
            zoom: 15.0,
          ),
          onCameraMove: _onCameraMove,
          markers: _createMarker(),
          circles: _circles,
          myLocationEnabled: false,
          myLocationButtonEnabled: false,
          polylines: Set<Polyline>.of(_mapPolylines.values),
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
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.black,
                                          width: 1,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                      ),
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 5,
                                        vertical: 2,
                                      ),
                                      // height: 20,
                                      // width: 40,
                                      child: Center(
                                        child: Text(
                                          "COD",
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    // Container(
                                    //   height: 20,
                                    //   width: 40,
                                    //   color: Colors.blue,
                                    // ),
                                    Row(
                                      children: <Widget>[
                                        Image.asset(
                                          "assets/images/logo.jpeg",
                                          height: 25,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Image.asset(
                                          "assets/images/zalo.png",
                                          height: 25,
                                        ),
                                      ],
                                    ),
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
                          246,
                          167,
                          27,
                          1,
                          // 30,
                          // 55,
                          // 109,
                          // 1,
                        ),
                      ),
                      height: 40,
                      width: double.infinity,
                      child: FlatButton(
                        child: Text(
                          "ĐỒNG Ý",
                          style: TextStyle(
                            color: Color.fromRGBO(
                              // 30,
                              // 55,
                              // 109,

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
                              builder: (context) => CreateSuccessPage(),
                            ),
                          );
                        },
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
