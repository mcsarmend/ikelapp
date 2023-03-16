import 'package:flutter/material.dart';
import 'package:ikelapp/constant.dart';
import 'package:ikelapp/screens/client/product_page.dart';

class HealthyFun extends StatelessWidget {
  ProductPage productpage = ProductPage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SECONDARY_COLOR,
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
                  productpage.build(
                      'Alka Seltzer  2pzs',
                      '\$10.00',
                      'assets/imgs/Healthyfun/AlkaSeltzer.png',
                      false,
                      false,
                      "Detalle de AlkaSeltzer",
                      context),
                  productpage.build(
                      'Aspirina 10pzs',
                      '\$15.00',
                      'assets/imgs/Healthyfun/Aspirina.png',
                      false,
                      false,
                      "Detalle Aspirina",
                      context),
                  productpage.build(
                      'Copade cristal para vino 1pz',
                      '\$50.00',
                      'assets/imgs/Healthyfun/Copadecristalparavino.png',
                      false,
                      false,
                      "Detalle copa",
                      context),
                  productpage.build(
                      'Cucharas Medianos Biodegradables 25pzs',
                      '\$26.00',
                      'assets/imgs/Healthyfun/CucharasMedianoBiodegradables.png',
                      false,
                      false,
                      "Detalle cucharas",
                      context),
                  productpage.build(
                      'Cuchillos Medianos Biodegradables 25pzs',
                      '\$26.00',
                      'assets/imgs/Healthyfun/CuchillosMedianosBiodegradables.png',
                      false,
                      false,
                      "Detalle Cuchillos",
                      context),
                  productpage.build(
                      'Descorchador de dos tiempos 1pz',
                      '\$100.00',
                      'assets/imgs/Healthyfun/DescorchadordedosTiempos.png',
                      false,
                      false,
                      "Detalle Descorchador",
                      context),
                  productpage.build(
                      'Encendedor Tokai 1pz',
                      '\$10.00',
                      'assets/imgs/Healthyfun/EncendedorTokai.png',
                      false,
                      false,
                      "Detalle encendedor",
                      context),
                  productpage.build(
                      'Peptobismol 2pzs',
                      '\$10.00',
                      'assets/imgs/Healthyfun/PeptoBismol.png',
                      false,
                      false,
                      "Detalle Peptobismol",
                      context),
                  productpage.build(
                      'Encendedor Tokai',
                      '\$2.99',
                      'assets/imgs/Healthyfun/EncendedorTokai.png',
                      false,
                      false,
                      "Detalle pepto bismol",
                      context),
                  productpage.build(
                      'Pistolitro',
                      '\$499.00',
                      'assets/imgs/Healthyfun/pistoslitro.png',
                      false,
                      false,
                      "Detalle Pistolitro",
                      context),
                  productpage.build(
                      'Plato cuadrado Biodegradable 10pzs',
                      '\$50.00',
                      'assets/imgs/Healthyfun/PlatocuadradoBiodegradable.png',
                      false,
                      false,
                      "Detalle plato cuadrado",
                      context),
                  productpage.build(
                      'Plato redondo Biodegradable 10pzs',
                      '\$35.00',
                      'assets/imgs/Healthyfun/PlatoredondoBiodegradable.png',
                      false,
                      false,
                      "Detalle Plato redondo",
                      context),
                  productpage.build(
                      'Playboy preservativo fresa 1pz',
                      '\$15.00',
                      'assets/imgs/Healthyfun/Playboypreservativofresa.png',
                      false,
                      false,
                      "Detalle Fresa",
                      context),
                  productpage.build(
                      'Playboy preservativo Uva 1pz',
                      '\$15.00',
                      'assets/imgs/Healthyfun/PlayboypreservativoUva.png',
                      false,
                      false,
                      "Detalle Uva",
                      context),
                  productpage.build(
                      'Tenedores Medianos Biodegradables 25pzs',
                      '\$26.00',
                      'assets/imgs/Healthyfun/TenedoresMedianosBiodegradables.png',
                      false,
                      false,
                      "Detalle Tenedores",
                      context),
                  productpage.build(
                      'Vasos Rojos 10pzs',
                      '\$10.00',
                      'assets/imgs/Healthyfun/VasosRojos.png',
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
}
