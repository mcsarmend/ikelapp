import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ikelapp/constant.dart';
import 'package:ikelapp/screens/home.dart';

class tracking extends StatefulWidget {
  @override
  _trackingState createState() => _trackingState();
}

class _trackingState extends State<tracking> {
  static final LatLng _kMapCenter = LatLng(19.6298089, -99.2927747);

  static final CameraPosition _kInitialPosition =
      CameraPosition(target: _kMapCenter, zoom: 11.0, tilt: 0, bearing: 0);

  late GoogleMapController _controller;

  Future<void> onMapCreated(GoogleMapController controller) async {
    _controller = controller;
    String value = await DefaultAssetBundle.of(context)
        .loadString('assets/map_style.json');
    _controller.setMapStyle(value);
  }

  void onCameraMove(CameraPosition cameraPosition) {
    debugPrint('${cameraPosition}');
  }

  Set<Marker> _createMarker() {
    return {
      Marker(
          markerId: MarkerId("marker_1"),
          position: _kMapCenter,
          infoWindow: InfoWindow(title: 'Marker 1'),
          rotation: 90),
      Marker(
        markerId: MarkerId("marker_2"),
        position: LatLng(19.6298089, -99.2927747),
      ),
    };
  }

  Set<Circle> _createCircle() {
    return {
      Circle(
        circleId: CircleId('1'),
        consumeTapEvents: true,
        strokeColor: Colors.teal,
        fillColor: Colors.blue.withOpacity(0.2),
        strokeWidth: 2,
        center: _kMapCenter,
        radius: 5000,
      ),
      Circle(
        circleId: CircleId('2'),
        consumeTapEvents: true,
        strokeColor: Colors.teal,
        fillColor: Colors.blue.withOpacity(0.2),
        strokeWidth: 2,
        center: LatLng(19.6298089, -99.2927747),
        radius: 6000,
      ),
    };
  }

  Set<Polygon> _createPolygon() {
    return {
      Polygon(
          polygonId: PolygonId('2'),
          consumeTapEvents: true,
          strokeColor: Colors.black,
          strokeWidth: 2,
          fillColor: Colors.teal,
          points: _createPoints())
    };
  }

  Set<Polyline> _createPolyline() {
    return {
      Polyline(
        polylineId: PolylineId('1'),
        consumeTapEvents: true,
        color: Colors.black,
        width: 5,
        points: _createPoints(),
      ),
    };
  }

  List<LatLng> _createPoints() {
    final List<LatLng> points = <LatLng>[];
    points.add(LatLng(19.6298089, -99.2927747));

    return points;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: PRYMARY_COLOR,
          title: Text('Seguimiento'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Color(0xFF545D68)),
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => Home()),
                  (route) => false);
            },
          ),
        ),
        body: Builder(builder: (BuildContext context) {
          return GoogleMap(
            initialCameraPosition: _kInitialPosition,
            onMapCreated: onMapCreated,
            mapType: MapType.normal,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            compassEnabled: true,
            markers: _createMarker(),
            mapToolbarEnabled: false,
            buildingsEnabled: true,
            onTap: (latLong) {
              /* Scaffold.of(context).showSnackBar(SnackBar(
                content: Text(
                    'Tapped location LatLong is (${latLong.latitude},${latLong.longitude})'),
              )); */
            },
            rotateGesturesEnabled: true,
            scrollGesturesEnabled: true,
            zoomControlsEnabled: true,
            zoomGesturesEnabled: true,
            tiltGesturesEnabled: true,
            liteModeEnabled: false,
            //circles: _createCircle(),
            //polygons: _createPolygon(),
            //polylines: _createPolyline(),
            trafficEnabled: false,
            onCameraMove: onCameraMove,
          );
        }));
  }
}
