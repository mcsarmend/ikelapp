import 'dart:async';
import 'dart:convert';
import 'dart:ffi';

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
import 'package:http/http.dart' as http;
import 'dart:io';

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
  var order_id = "";
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
  late Timer _timer;
  final Geolocator _geolocator = Geolocator();
  Position? _currentPosition;

  Future getCurrentPositioninitial() async {
    pos = await Geolocator.getCurrentPosition();
    print(pos);

    setState(() {
      originLat = double.tryParse(pos.latitude.toString());
      originLon = double.tryParse(pos.longitude.toString());
      loading = false;
    });
  }

  Future getCurrentPosition() async {
    pos = await Geolocator.getCurrentPosition();
    print(pos);
    var position = {
      "latitude": double.tryParse(pos.latitude.toString()),
      "longitude": double.tryParse(pos.longitude.toString()),
    };
    setCurrentPosition(position["latitude"].toString(),
        position["longitude"].toString(), userId.toString(), order_id);
    return position;
  }

  void loadingorders() async {
    userId = await getUserId();
    ApiResponse res = await getDeliverys(userId.toString());

    if (res.error != null) {
      print(res.error);
    } else {
      dat = (res.data as Map)['orders'];
      print(dat);
      if (dat.length > 0) {
        var latitud = dat[0]["lat_destiny"];
        var longitud = dat[0]["lon_destiny"];
        latLng = LatLng(latitud!, longitud!);

        // Usa la API de geocoding de Google Maps para convertir la ubicación en una dirección
        final List<Placemark> placemarks =
            await placemarkFromCoordinates(latLng.latitude, latLng.longitude);

        // Recupera la dirección del primer placemark
        final Placemark place = placemarks[0];
        final String direccion =
            "${place.street}, ${place.locality}, ${place.country},${place.postalCode}";
        setState(() async {
          if (dat.length > 0) {
            // Crea un objeto LatLng con la latitud y longitud de la ubicación

            var dateOrderConv =
                dat[0]["internal_id"].toString().substring(2, 8);
            haveDeliverys = true;
            contacto = contacto + dat[0]["number"];
            dateOrder = dateOrder + dateOrderConv;
            internalId = internalId + dat[0]["internal_id"];
            order_id = dat[0]["internal_id"];
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
    }
  }

  void changeProgressStatus(st) async {
    userId = await getUserId();
    ApiResponse res;
    if (inprogress == 0) {
      res = await startProgress(userId.toString(), '1', '1');
      _startLocationTimer();
      setState(() {
        status = "Terminar";
        inprogress = 1;
      });
    } else {
      res = await endProgress(userId.toString(), '0', order_id);
      setState(() {
        _stopLocationTimer();
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

  String note = "";
  // Función para mostrar el pop-up de agregar nota
  void _showAddNoteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Agregar Nota'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  decoration: InputDecoration(labelText: 'Ingrese la nota'),
                  maxLines: null, // Permite varias líneas de texto
                  onChanged: (value) {
                    note = value;
                  },
                ),
              ],
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cerrar el pop-up
              },
              child: Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () async {
                if (note.isNotEmpty) {
                  await setNote(order_id, note);
                  Navigator.of(context).pop(); // Cerrar el diálogo principal

                  // Mostrar el segundo diálogo con el mensaje de éxito
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Éxito'),
                        content: Text("Nota agregada correctamente"),
                        actions: <Widget>[
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pop(); // Cerrar el segundo diálogo
                            },
                            child: Text('Aceptar'),
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Error'),
                        content: Text("La nota no puede estar vacía"),
                        actions: <Widget>[
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pop(); // Cerrar el diálogo de error
                            },
                            child: Text('Aceptar'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: Text('Guardar'),
            ),
          ],
        );
      },
    );
  }

// Función para mostrar el pop-up de ver notas
  Future<void> _showViewNotesDialog(BuildContext context) async {
    final Object? response = await getNotes(order_id);

    if (response is List<dynamic>) {
      final List<Map<String, dynamic>> notes =
          response.cast<Map<String, dynamic>>();

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Notas'),
            content: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (notes.isNotEmpty)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: notes.map((noteMap) {
                        final note = noteMap['note'] as String;
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Row(
                            children: [
                              Text('•'), // Viñeta
                              SizedBox(width: 8),
                              Expanded(child: Text(note)),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  if (notes.isEmpty) Text('No hay notas disponibles'),
                ],
              ),
            ),
            actions: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Cerrar el pop-up
                },
                child: Text('Cerrar'),
              ),
            ],
          );
        },
      );
    } else {
      print('Error: Respuesta inesperada de notas');
    }
  }

  Future<ApiResponse> setNote(String order_id, String note) async {
    ApiResponse apiResponse = ApiResponse();
    try {
      final Uri uri = Uri.parse(setnotefromdelivery)
          .replace(queryParameters: {'order_id': order_id, 'note': note});

      final response =
          await http.get(uri, headers: {'Accept': 'application/json'});

      switch (response.statusCode) {
        case 200:
          apiResponse.data = jsonDecode(response.body);
          break;
        case 422:
          apiResponse.error = jsonDecode(response.body)["error"];
          break;
        default:
          apiResponse.error = somethingWentWrong;
          break;
      }
    } catch (e) {
      apiResponse.error = serverError;
    }
    return apiResponse;
  }

  Future<ApiResponse> setCurrentPosition(String latitude, String longitude,
      String delivery_id, String order_id) async {
    ApiResponse apiResponse = ApiResponse();
    try {
      final Uri uri = Uri.parse(setcurentposition).replace(queryParameters: {
        'latitude': latitude,
        'longitude': longitude,
        "delivery_id": delivery_id,
        "order_id": order_id
      });

      final response =
          await http.get(uri, headers: {'Accept': 'application/json'});

      switch (response.statusCode) {
        case 200:
          apiResponse.data = jsonDecode(response.body);
          break;
        case 422:
          apiResponse.error = jsonDecode(response.body)["error"];
          break;
        default:
          apiResponse.error = somethingWentWrong;
          break;
      }
    } catch (e) {
      apiResponse.error = serverError;
    }
    return apiResponse;
  }

  Future<Object?> getNotes(String order_id) async {
    ApiResponse apiResponse = ApiResponse();
    try {
      final Uri uri = Uri.parse(getnotestodelivery)
          .replace(queryParameters: {'pedido': order_id});

      final response =
          await http.get(uri, headers: {'Accept': 'application/json'});

      switch (response.statusCode) {
        case 200:
          apiResponse.data = jsonDecode(response.body);
          break;
        case 422:
          apiResponse.error = jsonDecode(response.body)["error"];
          break;
        default:
          apiResponse.error = somethingWentWrong;
          break;
      }
    } catch (e) {
      apiResponse.error = serverError;
    }
    return apiResponse.data;
  }

  void _startLocationTimer() async {
    const Duration interval = Duration(minutes: 3);
    var position = await getCurrentPosition();
    _timer = Timer.periodic(interval, (Timer timer) async {
      var position = await getCurrentPosition();
      if (position != null) {
        var posti = 'Ubicación emitida:' +
            position["latitude"].toString() +
            ", " +
            position["longitude"].toString();
        // Emitir la ubicación (enviar a un servidor, etc.)
        print(posti);
      } else {
        print('No se pudo obtener la ubicación');
      }
    });
  }

  void _stopLocationTimer() {
    _timer.cancel();
  }

  @override
  void initState() {
    super.initState();
    loadingorders();
    getCurrentPositioninitial();
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
            height: 130,
            color: Colors.transparent,
            child: Center(
              child: Image.asset('assets/imgs/delivery.png'),
            ),
          ),
          SizedBox(height: 5),
          Text(
            'BUZÓN DE ENTREGAS',
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: SECONDARY_COLOR),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 5),
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
                      Row(
                        children: [
                          MaterialButton(
                            color: PRYMARY_COLOR,
                            textColor: Colors.white,
                            onPressed: () {
                              _showAddNoteDialog(
                                context,
                              );
                            },
                            child: Text('Agregar nota'),
                          ),
                          Spacer(),
                          MaterialButton(
                            color: PRYMARY_COLOR,
                            textColor: Colors.white,
                            onPressed: () {
                              _showViewNotesDialog(context);
                            },
                            child: Text('Ver notas'),
                          ),
                        ],
                      )
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
