import 'package:flutter/material.dart';
import 'package:ikelapp/constant.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:ikelapp/Helpers/maps_sheet.dart';
import '../models/api_response.dart';
import '../models/orders.dart';
import '../services/user_service.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:location/location.dart' as Loc;
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class ShowDirections extends StatefulWidget {
  const ShowDirections({Key? key}) : super(key: key);

  @override
  _ShowDirectionsState createState() => _ShowDirectionsState();
}

class _ShowDirectionsState extends State<ShowDirections> {
  TextEditingController destinationLatitude = TextEditingController();
  TextEditingController destinationLongitude = TextEditingController();
  TextEditingController orderdescription = TextEditingController();
  TextEditingController ordercost = TextEditingController();
  String destinationTitle = 'Destino';
  TextEditingController originLatitude = TextEditingController();
  TextEditingController originLongitude = TextEditingController();
  String originTitle = 'Pier 33';
  int userId = 0;
  bool loading = true;
  late Orders orders;
  int selectedTabIndex = 0;
  DirectionsMode directionsMode = DirectionsMode.driving;
  late Loc.LocationData _locationData;
  var pos;
  void loadingorders() async {
    ApiResponse response = await getUserDetail();
    userId = await getUserId();
    ApiResponse res = await getorders(userId.toString());
    var data = res.data as Orders;
    getloc();
    // 19.7611183, -99.199255
    // 19.6272441,-99.2917622
    setState(() {
      destinationLatitude.text = data.lat_destiny.toString();
      destinationLongitude.text = data.lon_destiny.toString();
      destinationTitle = "No. de Orden: " + data.internal_id.toString();
      orderdescription.text = data.order_description.toString();
      ordercost.text = "\$" + data.cost.toString();
      if (pos != null) {
        originLatitude.text = pos.latitude;
        originLongitude.text = pos.longitude;
      } else {
        originLatitude.text = "pos.latitude";
        originLongitude.text = "pos.longitude";
      }

      originTitle = "Origen  viaje";
    });
  }

  Future getCurrentPosition() async {
    pos = await Geolocator.getCurrentPosition();
    print(pos);
    setState(() {
      originLatitude.text = pos.latitude.toString();
      originLongitude.text = pos.longitude.toString();
      loading = false;
    });
  }

  Future<bool> _checkGpsStatus() async {
    final isEnable = await Geolocator.isLocationServiceEnabled();

    var gpsServiceSubscription =
        Geolocator.getServiceStatusStream().listen((event) {
      final isEnabled = (event.index == 1) ? true : false;
    });

    return isEnable;
  }

  Future<bool> _isPermissionGranted() async {
    final isGranted = await Permission.location.isGranted;
    return isGranted;
  }

  void getloc() async {
    final status = await Permission.location.request();
    var fc = await _checkGpsStatus();
    var sc = await _isPermissionGranted();
    await getCurrentPosition();
  }

  @override
  void initState() {
    super.initState();
    loadingorders();
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: <Widget>[
                  FormTitle(originTitle),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Latitud Origen'),
                    controller: originLatitude,
                    readOnly: true,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Longitud Origen'),
                    controller: originLongitude,
                    readOnly: true,
                  ),
                  FormTitle(destinationTitle),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Latitud Destino'),
                    controller: destinationLatitude,
                    readOnly: true,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Longitud Destino'),
                    controller: destinationLongitude,
                    readOnly: true,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Descripción'),
                    controller: orderdescription,
                    readOnly: true,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Costo'),
                    controller: ordercost,
                    readOnly: true,
                  ),
                  MaterialButton(
                    color: PRYMARY_COLOR,
                    textColor: Colors.white,
                    onPressed: () {
                      MapsSheet.show(
                        context: context,
                        onMapTap: (map) {
                          map.showDirections(
                            destination: Coords(
                              double.parse(destinationLatitude.text.toString()),
                              double.parse(
                                  destinationLongitude.text.toString()),
                            ),
                            destinationTitle: destinationTitle,
                            origin: Coords(double.parse(originLatitude.text),
                                double.parse(originLongitude.text)),
                            originTitle: originTitle,
                            directionsMode: directionsMode,
                          );
                        },
                      );
                    },
                    child: Text('Ir a ubicación'),
                  )
                ],
              ),
            ),
          );
  }
}

class FormTitle extends StatelessWidget {
  final String title;
  final Widget? trailing;

  FormTitle(this.title, {this.trailing});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Row(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.blue,
              ),
            ),
            Spacer(),
            if (trailing != null) trailing!,
          ],
        ),
      ],
    );
  }
}
