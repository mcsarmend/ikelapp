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
        body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: <Widget>[
                SizedBox(height: 20.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'MAYOREO',
                      style: TextStyle(fontSize: 40.0, color: SECONDARY_COLOR),
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
                SizedBox(height: 10.0),
                Row(
                  children: <Widget>[
                    Image(
                      image: AssetImage('assets/imgs/category_1.png'),
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
                            'Descubre una amplia selección de productos de alta calidad a precios competitivos para tu negocio en nuestra app de venta al por mayor. Navega fácilmente por nuestras categorías, agrega productos a tu carrito y accede a precios especiales por volumen. ¡Regístrate ahora y comienza a disfrutar de todas las ventajas que te ofrecemos!',
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
                      style: TextStyle(fontSize: 20, color: PRYMARY_COLOR),
                    )),
                Padding(
                    padding: const EdgeInsets.all(8.0), // Ancho máximo
                    child: ElevatedButton(
                      onPressed: () async {
                        final String phoneNumber = '+525533668907';
                        final String message = '¡Hola!';
                        final String whatsappUrl =
                            'https://wa.me/$phoneNumber?text=${Uri.encodeFull(message)}';
                        // ignore: deprecated_member_use
                        if (await canLaunch(whatsappUrl)) {
                          // ignore: deprecated_member_use
                          await launch(whatsappUrl);
                        } else {
                          throw 'No se pudo abrir $whatsappUrl';
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        // ignore: deprecated_member_use
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
