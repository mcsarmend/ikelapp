import 'package:flutter/material.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:blogapp/Helpers/maps_sheet.dart';
import '../models/api_response.dart';
import '../models/orders.dart';
import '../services/user_service.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:location/location.dart' as Loc;

class ShowDirections extends StatefulWidget {
  const ShowDirections({Key? key}) : super(key: key);

  @override
  _ShowDirectionsState createState() => _ShowDirectionsState();
}

class _ShowDirectionsState extends State<ShowDirections> {
  TextEditingController destinationLatitude = TextEditingController();
  TextEditingController destinationLongitude = TextEditingController();
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

  void loadingorders() async {
    ApiResponse response = await getUserDetail();
    userId = await getUserId();
    ApiResponse res = await getorders(userId.toString());
    var data = res.data as Orders;
    getLocationPer();
    setState(() {
      destinationLatitude.text = data.lat_destiny.toString();
      destinationLongitude.text = data.lat_destiny.toString();
      destinationTitle = data.internal_id.toString();
      originLatitude.text = "19.7604256";
      originLongitude.text = "-99.1981014";
      originTitle = "Origen  viaje";
    });
  }

  void getLocationPer() async {
    var status = await Permission.location.status;
    if (status.isGranted) {
      print("Status granted");
    } else if (status.isDenied) {
      print("Status denied");
    }

    if (await Permission.locationWhenInUse.serviceStatus.isEnabled) {
      print("Permissions granted");
      getlocationData();
    } else {
      print("Permissions Denied");
      Map<Permission, PermissionStatus> status2 =
          await [Permission.location].request();
      if (await Permission.location.isPermanentlyDenied) {
        openAppSettings();
      }
    }
  }

  void getlocationData() async {
    Loc.Location locat = new Loc.Location();
    _locationData = await locat.getLocation();
    print("GetLocation");
  }

  @override
  void initState() {
    super.initState();
    loadingorders();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: <Widget>[
            FormTitle(originTitle),
            TextFormField(
              decoration: InputDecoration(labelText: 'Latitud Destino'),
              controller: originLatitude,
              readOnly: true,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Longitud Destino'),
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
            FormTitle('Directions Mode'),
            Container(
              alignment: Alignment.centerLeft,
              child: DropdownButton(
                value: directionsMode,
                onChanged: (newValue) {
                  setState(() {
                    directionsMode = newValue as DirectionsMode;
                  });
                },
                items: DirectionsMode.values.map((directionsMode) {
                  return DropdownMenuItem(
                    value: directionsMode,
                    child: Text(directionsMode.toString()),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 20),
            MaterialButton(
              onPressed: () {
                MapsSheet.show(
                  context: context,
                  onMapTap: (map) {
                    map.showDirections(
                      destination: Coords(
                        double.parse(destinationLatitude.text.toString()),
                        double.parse(destinationLongitude.text.toString()),
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
              child: Text('Show Maps'),
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
