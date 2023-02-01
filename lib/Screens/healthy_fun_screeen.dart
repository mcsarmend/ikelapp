import 'package:flutter/material.dart';
import 'package:blogapp/screens/product_detail.dart';

import '../constant.dart';

class HealthyFun extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCFAF8),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 15.0),
          Container(
              padding: EdgeInsets.only(right: 15.0),
              width: MediaQuery.of(context).size.width - 30.0,
              height: MediaQuery.of(context).size.height - 50.0,
              child: GridView.count(
                crossAxisCount: 2,
                primary: false,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 15.0,
                childAspectRatio: 0.8,
                children: <Widget>[
                  _buildCard(
                      'Alka Seltzer  2pzs',
                      '\$10.00',
                      'imgs/Healthyfun/AlkaSeltzer.png',
                      false,
                      false,
                      "Detalle de AlkaSeltzer",
                      context),
                  _buildCard(
                      'Aspirina 10pzs',
                      '\$15.00',
                      'imgs/Healthyfun/Aspirina.png',
                      false,
                      false,
                      "Detalle Aspirina",
                      context),
                  _buildCard(
                      'Copade cristal para vino 1pz',
                      '\$50.00',
                      'imgs/Healthyfun/Copadecristalparavino.png',
                      false,
                      false,
                      "Detalle copa",
                      context),
                  _buildCard(
                      'Cucharas Medianos Biodegradables 25pzs',
                      '\$26.00',
                      'imgs/Healthyfun/CucharasMedianoBiodegradables.png',
                      false,
                      false,
                      "Detalle cucharas",
                      context),
                  _buildCard(
                      'Cuchillos Medianos Biodegradables 25pzs',
                      '\$26.00',
                      'imgs/Healthyfun/CuchillosMedianosBiodegradables.png',
                      false,
                      false,
                      "Detalle Cuchillos",
                      context),
                  _buildCard(
                      'Descorchador de dos tiempos 1pz',
                      '\$100.00',
                      'imgs/Healthyfun/DescorchadordedosTiempos.png',
                      false,
                      false,
                      "Detalle Descorchador",
                      context),
                  _buildCard(
                      'Encendedor Tokai 1pz',
                      '\$10.00',
                      'imgs/Healthyfun/EncendedorTokai.png',
                      false,
                      false,
                      "Detalle encendedor",
                      context),
                  _buildCard(
                      'Peptobismol 2pzs',
                      '\$10.00',
                      'imgs/Healthyfun/PeptoBismol.png',
                      false,
                      false,
                      "Detalle Peptobismol",
                      context),
                  _buildCard(
                      'Encendedor Tokai',
                      '\$2.99',
                      'imgs/Healthyfun/EncendedorTokai.png',
                      false,
                      false,
                      "Detalle pepto bismol",
                      context),
                  _buildCard(
                      'Pistolitro',
                      '\$499.00',
                      'imgs/Healthyfun/pistoslitro.png',
                      false,
                      false,
                      "Detalle Pistolitro",
                      context),
                  _buildCard(
                      'Plato cuadrado Biodegradable 10pzs',
                      '\$50.00',
                      'imgs/Healthyfun/PlatocuadradoBiodegradable.png',
                      false,
                      false,
                      "Detalle plato cuadrado",
                      context),
                  _buildCard(
                      'Plato redondo Biodegradable 10pzs',
                      '\$35.00',
                      'imgs/Healthyfun/PlatoredondoBiodegradable.png',
                      false,
                      false,
                      "Detalle Plato redondo",
                      context),
                  _buildCard(
                      'Playboy preservativo fresa 1pz',
                      '\$15.00',
                      'imgs/Healthyfun/Playboypreservativofresa.png',
                      false,
                      false,
                      "Detalle Fresa",
                      context),
                  _buildCard(
                      'Playboy preservativo Uva 1pz',
                      '\$15.00',
                      'imgs/Healthyfun/PlayboypreservativoUva.png',
                      false,
                      false,
                      "Detalle Uva",
                      context),
                  _buildCard(
                      'Tenedores Medianos Biodegradables 25pzs',
                      '\$26.00',
                      'imgs/Healthyfun/TenedoresMedianosBiodegradables.png',
                      false,
                      false,
                      "Detalle Tenedores",
                      context),
                  _buildCard(
                      'Vasos Rojos 10pzs',
                      '\$10.00',
                      'imgs/Healthyfun/VasosRojos.png',
                      false,
                      false,
                      "Detalle vasos rojos",
                      context),
                ],
              )),
          SizedBox(height: 15.0)
        ],
      ),
    );
  }

  Widget _buildCard(String name, String price, String imgPath, bool added,
      bool isFavorite, String detalle, context) {
    return Padding(
        padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
        child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ProductDetail(
                        assetPath: imgPath,
                        cookieprice: price,
                        cookiename: name,
                        detalle: detalle,
                      )));
            },
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 3.0,
                          blurRadius: 5.0)
                    ],
                    color: Colors.white),
                child: Column(children: [
                  Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            isFavorite
                                ? Icon(Icons.favorite, color: Color(0xFFEF7532))
                                : Icon(Icons.favorite_border,
                                    color: Color(0xFFEF7532))
                          ])),
                  Hero(
                      tag: imgPath,
                      child: Container(
                          height: 110,
                          width: 110,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(imgPath),
                                  fit: BoxFit.contain)))),
                  SizedBox(height: 7.0),
                  Text(price,
                      style: TextStyle(
                          color: PRYMARY_COLOR,
                          fontFamily: 'Varela',
                          fontSize: 14.0)),
                  Text(name,
                      style: TextStyle(
                          color: Color(0xFF575E67),
                          fontFamily: 'Varela',
                          fontSize: 14.0)),
                  Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Container(color: Color(0xFFEBEBEB), height: 1.0)),
                  Padding(
                      padding: EdgeInsets.only(left: 5.0, right: 5.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            if (!added) ...[
                              Icon(Icons.shopping_basket,
                                  color: Color(0xFFD17E50), size: 12.0),
                              Text('Add to cart',
                                  style: TextStyle(
                                      fontFamily: 'Varela',
                                      color: Color(0xFFD17E50),
                                      fontSize: 12.0))
                            ],
                            if (added) ...[
                              Icon(Icons.remove_circle_outline,
                                  color: Color(0xFFD17E50), size: 12.0),
                              Text('3',
                                  style: TextStyle(
                                      fontFamily: 'Varela',
                                      color: Color(0xFFD17E50),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.0)),
                              Icon(Icons.add_circle_outline,
                                  color: Color(0xFFD17E50), size: 12.0),
                            ]
                          ]))
                ]))));
  }
}
