import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:ikelapp/constant.dart';
import 'package:map_launcher/map_launcher.dart';
import '../../Helpers/maps_sheet.dart';
import '../../models/api_response.dart';
import '../../models/orders.dart';
import '../../services/user_service.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';

class delivery_screen extends StatefulWidget {
  @override
  State<delivery_screen> createState() => _delivery_screenState();
}

class _delivery_screenState extends State<delivery_screen> {
  int userId = 0;
  bool loading = true;
  bool haveDeliverys = false;
  late Orders orders;
  int selectedTabIndex = 0;
  var dat;
  var contacto = "Contacto: ";
  var dateOrder = "Fecha: ";
  var internalId = "No. de Orden: ";
  var address = "Dirección: ";
  var latLng;
  var pos;
  var originLat;
  var originLon;
  var order_description;
  var cost;
  var inprogress;
  var orderstatus;
  var statusProgress = 1;
  DirectionsMode directionsMode = DirectionsMode.driving;
  String destinationTitle = 'Destino';
  String originTitle = 'Origen';
  String status = 'Iniciar';

  Future getCurrentPosition() async {
    pos = await Geolocator.getCurrentPosition();
    print(pos);
    setState(() {
      originLat = double.tryParse(pos.latitude.toString());
      originLon = double.tryParse(pos.longitude.toString());
      loading = false;
    });
  }

  void loadingorders() async {
    userId = await getUserId();
    ApiResponse res = await getDeliverys(userId.toString());
    dat = (res.data as Map)['orders'];
    print(dat);

    setState(() async {
      if (dat.length > 0) {
        var latitud = dat[0]["lat_destiny"];
        var longitud = dat[0]["lon_destiny"];
        // Crea un objeto LatLng con la latitud y longitud de la ubicación
        latLng = LatLng(latitud!, longitud!);

        // Usa la API de geocoding de Google Maps para convertir la ubicación en una dirección
        final List<Placemark> placemarks =
            await placemarkFromCoordinates(latLng.latitude, latLng.longitude);

        // Recupera la dirección del primer placemark
        final Placemark place = placemarks[0];
        final String direccion =
            "${place.street}, ${place.locality}, ${place.country},${place.postalCode}";

        var dateOrderConv = dat[0]["internal_id"].toString().substring(2, 8);
        haveDeliverys = true;
        contacto = contacto + dat[0]["number"];
        dateOrder = dateOrder + dateOrderConv;
        internalId = internalId + dat[0]["internal_id"];
        address = address + direccion;
        order_description = dat[0]["order_description"];
        cost = dat[0]["cost"];
        inprogress = dat[0]["inprogress"];
        if (inprogress == 0) {
          status = "Iniciar";
        } else {
          status = "Terminar";
        }
      }
      // orders = res.data as Orders;
      loading = false;
    });
  }

  void changeProgressStatus(st) async {
    userId = await getUserId();
    ApiResponse res;
    if (inprogress == 0) {
      res = await startProgress(userId.toString(), '1', '1');
      setState(() {
        status = "Terminar";
        inprogress = 1;
      });
    } else {
      res = await endProgress(userId.toString(), '0', '0');
      setState(() {
        loadingorders();
      });
    }
  }

  launchPhone(String phoneNumber) async {
    final url = 'tel:$phoneNumber';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void initState() {
    super.initState();
    loadingorders();
    getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
/*       appBar: AppBar(
        title: Text('Mi Aplicación'),
      ), */
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          Container(
            height: 150,
            color: Colors.transparent,
            child: Center(
              child: Image.asset('assets/imgs/delivery.png'),
            ),
          ),
          SizedBox(height: 10),
          Text(
            'BUZÓN DE ENTREGAS',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: SECONDARY_COLOR),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          haveDeliverys
              ? Container(
                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    border: Border.all(color: SECONDARY_COLOR, width: 5),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        internalId,
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
/*                       Text(
                        'Estatus: Pendiente',
                        style: TextStyle(fontSize: 18),
                      ), */
                      SizedBox(height: 10),
                      Text(
                        dateOrder,
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 20),
                      Text(
                        address,
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 10),
                      Text(
                        contacto,
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 30),
                      Center(
                          child: IconButton(
                        tooltip: "Ver Detalles",
                        icon: Icon(
                          Icons.remove_red_eye,
                          color: Colors.grey,
                          size: 30,
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Detalle'),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(order_description),
                                    Spacer(),
                                    Text("TOTAL: " + cost)
                                  ],
                                ),
                                actions: <Widget>[
                                  ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              PRYMARY_COLOR),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Listo'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      )),
                      Row(
                        children: [
                          MaterialButton(
                            color: PRYMARY_COLOR,
                            textColor: Colors.white,
                            onPressed: () {
                              MapsSheet.show(
                                context: context,
                                onMapTap: (map) {
                                  map.showDirections(
                                    destination: Coords(
                                        latLng.latitude, latLng.longitude),
                                    destinationTitle: destinationTitle,
                                    origin: Coords(originLat, originLon),
                                    originTitle: originTitle,
                                    directionsMode: directionsMode,
                                  );
                                },
                              );
                            },
                            child: Text('Ir a ubicación'),
                          ),
                          Spacer(),
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  PRYMARY_COLOR),
                            ),
                            onPressed: () {
                              changeProgressStatus(statusProgress);
                            },
                            child: Text(status),
                          ),
                          Spacer(),
                          IconButton(
                            tooltip: "Llamar al clinete",
                            icon: Icon(
                              Icons.phone,
                              color: Colors.blue,
                              size: 30,
                            ),
                            onPressed: () {
                              launchPhone(dat[0]["number"]);
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                )
              : Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'EN ESTE MOMENTO NO TIENES ENTREGAS.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          color: PRYMARY_COLOR,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Icon(
                      Icons.sentiment_satisfied,
                      size: 120,
                      color: PRYMARY_COLOR,
                    )
                  ],
                ),
          Spacer(),
        ],
      ),
    );
  }
}
