import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constant.dart';
import '../home.dart';

class PartyScreen extends StatefulWidget {
  @override
  State<PartyScreen> createState() => _PartyScreenState();
}

class _PartyScreenState extends State<PartyScreen> {
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
          title: Text(''),
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
                      'FIESTAS',
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
                      image: AssetImage('assets/imgs/category_2.png'),
                      width: 100.0,
                      height: 100.0,
                    ),
                    SizedBox(
                        width: 16.0), // Espacio entre la imagen y el párrafo
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Título del párrafo',
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                              height:
                                  8.0), // Espacio entre el título y el texto del párrafo
                          Text(
                            'Texto del párrafo. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Padding(
                    padding: const EdgeInsets.all(8.0), // Ancho máximo
                    child: Text(
                      "CONTRATA MEDIANTE",
                      style: TextStyle(fontSize: 30, color: PRYMARY_COLOR),
                    )),
                Padding(
                    padding: const EdgeInsets.all(8.0), // Ancho máximo
                    child: ElevatedButton(
                      onPressed: () async {
                        final String phoneNumber = '+525533668907';
                        final String message = '¡Hola!';
                        final String whatsappUrl =
                            'https://wa.me/$phoneNumber?text=${Uri.encodeFull(message)}';
                        if (await canLaunch(whatsappUrl)) {
                          await launch(whatsappUrl);
                        } else {
                          throw 'No se pudo abrir $whatsappUrl';
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green, // color de fondo del botón
                        shape: RoundedRectangleBorder(
                          // forma del botón
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 8.0), // espacio dentro del botón
                      ),
                      child: Text(
                        'WhatsApp',
                        style: TextStyle(fontSize: 18.0, color: Colors.white),
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.all(8.0), // Ancho máximo
                  child: FittedBox(
                    fit: BoxFit
                        .scaleDown, // Escalar el texto hacia abajo si es necesario
                    child: Text(
                      'CONSULTA NUESTROS TÉRMINOS Y CONDICIONES.',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0), // Ancho máximo
                  child: FittedBox(
                    fit: BoxFit
                        .scaleDown, // Escalar el texto hacia abajo si es necesario
                    child: Text(
                      'TODA NUESTRA ACTIVIDAD DE VENTA  ESTÄ DETERMINADO  POR NUESTRAS POLITOCAS DE LA EMPRESA.',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                ),
              ],
            )));
  }
}
