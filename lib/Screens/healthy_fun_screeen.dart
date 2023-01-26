import 'package:flutter/material.dart';
import 'package:blogapp/screens/cookie_detail.dart';

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
                  _buildCard('Alka Seltzer  ', '\$3.99',
                      'imgs/Healthyfun/AlkaSeltzer.png', false, false, context),
                  _buildCard('Aspirina', '\$5.99',
                      'imgs/Healthyfun/Aspirina.png', false, false, context),
                  _buildCard(
                      'Copade cristal para vino',
                      '\$1.99',
                      'imgs/Healthyfun/Copadecristalparavino.png',
                      false,
                      false,
                      context),
                  _buildCard(
                      'Cucharas Medianos Biodegradables',
                      '\$2.99',
                      'imgs/Healthyfun/CucharasMedianoBiodegradables.png',
                      false,
                      false,
                      context),
                  _buildCard(
                      'Cuchillos Medianos Biodegradables',
                      '\$2.99',
                      'imgs/Healthyfun/CuchillosMedianosBiodegradables.png',
                      false,
                      false,
                      context),
                  _buildCard(
                      'Descorchador de dos tiempos',
                      '\$2.99',
                      'imgs/Healthyfun/DescorchadordedosTiempos.png',
                      false,
                      false,
                      context),
                  _buildCard(
                      'Encendedor Tokai',
                      '\$2.99',
                      'imgs/Healthyfun/EncendedorTokai.png',
                      false,
                      false,
                      context),
                  _buildCard('Peptobismol', '\$2.99',
                      'imgs/Healthyfun/PeptoBismol.png', false, false, context),
                  _buildCard(
                      'Encendedor Tokai',
                      '\$2.99',
                      'imgs/Healthyfun/EncendedorTokai.png',
                      false,
                      false,
                      context),
                  _buildCard('Pistos Litro', '\$2.99',
                      'imgs/Healthyfun/pistoslitro.png', false, false, context),
                  _buildCard(
                      'Plato cuadrado Biodegradable',
                      '\$2.99',
                      'imgs/Healthyfun/PlatocuadradoBiodegradable.png',
                      false,
                      false,
                      context),
                  _buildCard(
                      'Plato redondo Biodegradable',
                      '\$2.99',
                      'imgs/Healthyfun/PlatoredondoBiodegradable.png',
                      false,
                      false,
                      context),
                  _buildCard(
                      'Playboy preservativo fresa',
                      '\$2.99',
                      'imgs/Healthyfun/Playboypreservativofresa.png',
                      false,
                      false,
                      context),
                  _buildCard(
                      'Playboy preservativo Uva',
                      '\$2.99',
                      'imgs/Healthyfun/PlayboypreservativoUva.png',
                      false,
                      false,
                      context),
                  _buildCard(
                      'Tenedores Medianos Biodegradables',
                      '\$2.99',
                      'imgs/Healthyfun/TenedoresMedianosBiodegradables.png',
                      false,
                      false,
                      context),
                  _buildCard('Vasos Rojos', '\$2.99',
                      'imgs/Healthyfun/VasosRojos.png', false, false, context),
                ],
              )),
          SizedBox(height: 15.0)
        ],
      ),
    );
  }

  Widget _buildCard(String name, String price, String imgPath, bool added,
      bool isFavorite, context) {
    return Padding(
        padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
        child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CookieDetail(
                      assetPath: imgPath,
                      cookieprice: price,
                      cookiename: name)));
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
