import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constant.dart';
import '../home.dart';

class WholeSaleScreen extends StatefulWidget {
  @override
  State<WholeSaleScreen> createState() => _WholeSaleScreenState();
}

class _WholeSaleScreenState extends State<WholeSaleScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: PRYMARY_COLOR,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => Home()),
                  (route) => false);
            },
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: <Widget>[
                SizedBox(height: 20.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'MAYOREO',
                      style: TextStyle(fontSize: 50.0, color: SECONDARY_COLOR),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                RichText(
                  text: TextSpan(
                    text:
                        'CONOCE TODOS LOS BENEFICIOS DE UNA FIESTA CON LA COMPRA DE TU ALCOHOL POR MAYOREO.',
                    style: TextStyle(fontSize: 20.0, color: SECONDARY_COLOR),
                    children: <InlineSpan>[],
                  ),
                ),
                SizedBox(height: 30.0),
                Row(
                  children: <Widget>[
                    Image(
                      image: AssetImage('assets/imgs/category_1.png'),
                      width: 100.0,
                      height: 100.0,
                    ),
                    SizedBox(
                        width: 16.0), // Espacio entre la imagen y el p??rrafo
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'T??tulo del p??rrafo',
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                              height:
                                  8.0), // Espacio entre el t??tulo y el texto del p??rrafo
                          Text(
                            'Texto del p??rrafo. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Padding(
                    padding: const EdgeInsets.all(8.0), // Ancho m??ximo
                    child: Text(
                      "CONTRATA MEDIANTE",
                      style: TextStyle(fontSize: 30, color: PRYMARY_COLOR),
                    )),
                Padding(
                    padding: const EdgeInsets.all(8.0), // Ancho m??ximo
                    child: ElevatedButton(
                      onPressed: () async {
                        final String phoneNumber = '+525533668907';
                        final String message = '??Hola!';
                        final String whatsappUrl =
                            'https://wa.me/$phoneNumber?text=${Uri.encodeFull(message)}';
                        if (await canLaunch(whatsappUrl)) {
                          await launch(whatsappUrl);
                        } else {
                          throw 'No se pudo abrir $whatsappUrl';
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green, // color de fondo del bot??n
                        shape: RoundedRectangleBorder(
                          // forma del bot??n
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 8.0), // espacio dentro del bot??n
                      ),
                      child: Text(
                        'WhatsApp',
                        style: TextStyle(fontSize: 18.0, color: Colors.white),
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.all(8.0), // Ancho m??ximo
                  child: FittedBox(
                    fit: BoxFit
                        .scaleDown, // Escalar el texto hacia abajo si es necesario
                    child: Text(
                      'CONSULTA NUESTROS T??RMINOS Y CONDICIONES.',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0), // Ancho m??ximo
                  child: FittedBox(
                    fit: BoxFit
                        .scaleDown, // Escalar el texto hacia abajo si es necesario
                    child: Text(
                      'TODA NUESTRA ACTIVIDAD DE VENTA  EST?? DETERMINADO  POR NUESTRAS POLITOCAS DE LA EMPRESA.',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                ),
              ],
            )));
  }
}
