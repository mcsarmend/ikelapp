import 'package:flutter/material.dart';
import 'package:ikelapp/screens/client/product_page.dart';

// ignore: must_be_immutable
class BeerHouse extends StatelessWidget {
  ProductPage productpage = ProductPage();
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
                  productpage.build(
                      'Barrilito 355 ml No Retornable 1pzs 1pz',
                      '\$11.00',
                      'assets/imgs/Beerhouse/Barrilito355ml.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Barrilito 444 ml No Retornable 1pzs 1pz',
                      '\$13.00',
                      'assets/imgs/Beerhouse/Barrilito444ml.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Bocanegra 355 ml No Retornable 1pzs 1pz',
                      '\$28.00',
                      'assets/imgs/Beerhouse/Bocanegra355ml.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Bohemia Clara 355 ml No Retornable 1pzs 1pz',
                      '\$13.00',
                      'assets/imgs/Beerhouse/BohemiaClara355.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Bohemia Clara 355 ml No Retornable 1pz 1pz',
                      '\$16.00',
                      'assets/imgs/Beerhouse/BohemiaClaraNoretornable355.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Bohemia Obscura 355 ml No Retornable 1pz 1pz',
                      '\$13.00',
                      'assets/imgs/Beerhouse/BohemiaObscura355.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Bohemia Obscura 355 ml No Retornable 1pz 1pz',
                      '\$16.00',
                      'assets/imgs/Beerhouse/BohemiaObscuraNoretornable355.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Brooklyn 355 ml No Retornable 1pz 1pz',
                      '\$44.00',
                      'assets/imgs/Beerhouse/Brooklyn355ml.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'BudLight 355 ml No Retornable 1pz',
                      '\$14.00',
                      'assets/imgs/Beerhouse/BudLight355ml.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Carta Blanca 355 ml Retornable 1pz ',
                      '\$16.00',
                      'assets/imgs/Beerhouse/CartaBlanca355.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Carta Blanca 940 ml Retornable 1pz',
                      '\$24.00',
                      'assets/imgs/Beerhouse/CartaBlanca940ml.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Carta Blanca 355 ml No Retornable 1pz',
                      '\$16.00',
                      'assets/imgs/Beerhouse/CartaBlancaNoretornable355.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Cornona 355 ml Retornable 1pz',
                      '\$14.00',
                      'assets/imgs/Beerhouse/Cornona355.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Corona 1.2L Retornable 1pz',
                      '\$34.00',
                      'assets/imgs/Beerhouse/Corona12L.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Corona 940 ml Retornable 1pz',
                      '\$30.00',
                      'assets/imgs/Beerhouse/Corona940ml.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Corona 355 ml Retornable 1pz',
                      '\$10.00',
                      'assets/imgs/Beerhouse/CoronaAmpolleta.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Corona Light 1.2L Retornable 1pz',
                      '\$34.00',
                      'assets/imgs/Beerhouse/CoronaLight12L.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Corona Light 355 ml Retornable 1pz',
                      '\$14.00',
                      'assets/imgs/Beerhouse/CoronaLight355.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Goose Island 355 ml No Retornable 1pz',
                      '\$49.00',
                      'assets/imgs/Beerhouse/GooseIsland355ml.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Gran Modelo 1L Retornable 1pz',
                      '\$35.00',
                      'assets/imgs/Beerhouse/GranModelo1L.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Grimbergen 330 ml No Retornable 1pz',
                      '\$32.00',
                      'assets/imgs/Beerhouse/Grimbergen330ml.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Heineken 1L Retornable 1pz',
                      '\$33.00',
                      'assets/imgs/Beerhouse/Heineken1L.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Heineken 250 ml No Retornable 1pz',
                      '\$12.00',
                      'assets/imgs/Beerhouse/Heineken250ml.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Heineken 355 ml No Retornable 1pz',
                      '\$17.00',
                      'assets/imgs/Beerhouse/Heineken355.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Heineken 355 ml No Retornable 1pz ',
                      '\$17.00',
                      'assets/imgs/Beerhouse/HeinekenNoRetornable355.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Hoegaarden 355ml No Retornable 1pz',
                      '\$29.00',
                      'assets/imgs/Beerhouse/Hoegaarden355ml.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Indio 1.18L Retornable 1pz',
                      '\$31.00',
                      'assets/imgs/Beerhouse/Indio118L.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Indio 355 ml No Retornable 1pz',
                      '\$13.00',
                      'assets/imgs/Beerhouse/Indio355.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Indio 940 ml Retornable 1pz',
                      '\$25.00',
                      'assets/imgs/Beerhouse/Indio940ml.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Indio 190 ml Retornable 1pz',
                      '\$7.00',
                      'assets/imgs/Beerhouse/Indioampolleta.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Indio 355 ml No Retornable 1pz ',
                      '\$13.00',
                      'assets/imgs/Beerhouse/IndioNoRetornable355.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Jabalí 330 ml No Retornable 1pz',
                      '\$33.00',
                      'assets/imgs/Beerhouse/JabalI330ml.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Lagunitas IPA 355 ml No Retornable 1pz',
                      '\$31.00',
                      'assets/imgs/Beerhouse/LagunitasIpa355ml.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'León 1.2L Retornable 1pz',
                      '\$34.00',
                      'assets/imgs/Beerhouse/Leon12L.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'León 355 ml Retornable 1pz',
                      '\$14.00',
                      'assets/imgs/Beerhouse/Leon355.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'León 325 ml No Retornable 1pz',
                      '\$14.00',
                      'assets/imgs/Beerhouse/LeonNoretornable325.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Michelob Ultra 355 ml No Retornable 1pz',
                      '\$17.00',
                      'assets/imgs/Beerhouse/MichelobUltra355ml.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Modelo Ámbar 355 ml Retornable 1pz',
                      '\$16.00',
                      'assets/imgs/Beerhouse/ModeloAmbar355.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Modelo Especial 355 ml Retornable 1pz',
                      '\$16.00',
                      'assets/imgs/Beerhouse/ModeloEspecial355.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Modelo Trigo 355 ml Retornable 1pz',
                      '\$16.00',
                      'assets/imgs/Beerhouse/ModeloTrigo355.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Montejo 355 ml Retornable 1pz',
                      '\$16.00',
                      'assets/imgs/Beerhouse/Montejo355.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Negra Modelo 355 ml Retornable 1pz',
                      '\$16.00',
                      'assets/imgs/Beerhouse/NegraModelo355.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Noche Buena 355 ml No Retornable 1pz',
                      '\$15.00',
                      'assets/imgs/Beerhouse/NocheBuena355ml.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Pacífico 355 ml Retornable 1pz',
                      '\$14.00',
                      'assets/imgs/Beerhouse/Pacifico355.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Pacífico 210 ml  Retornable 1pz',
                      '\$10.00',
                      'assets/imgs/Beerhouse/PacificoAmpolleta.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Pacífico Light 210 ml Retornable 1pz',
                      '\$10.00',
                      'assets/imgs/Beerhouse/PacificoLightAmpolleta.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Quilmes 355 ml No Retornable 1pz',
                      '\$25.00',
                      'assets/imgs/Beerhouse/Quilmes355ml.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Sol 355 ml Retornable 1pz',
                      '\$13.00',
                      'assets/imgs/Beerhouse/Sol355.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Sol 940 ml Retornable 1pz',
                      '\$25.00',
                      'assets/imgs/Beerhouse/Sol940ml.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Sol 355 ml Retornable 1pz',
                      '\$7.00',
                      'assets/imgs/Beerhouse/SolAmpolleta.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Sol 355 ml No Retornable 1pz',
                      '\$13.00',
                      'assets/imgs/Beerhouse/SolNoretornable355.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Stella Artois 310 ml No Retornable 1pz',
                      '\$19.00',
                      'assets/imgs/Beerhouse/StellaArtois310ml.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Superior 355 ml No Retornable 1pz',
                      '\$13.00',
                      'assets/imgs/Beerhouse/Superior355ml.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Tecate Ámbar 355 ml Retornable 1pz',
                      '\$10.00',
                      'assets/imgs/Beerhouse/TecateAmbar355.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Tecate Ámbar 940 ml Retornable 1pz',
                      '\$25.00',
                      'assets/imgs/Beerhouse/TecateAmbar940ml.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Tecate Light 1.18L Retornable 1pz',
                      '\$31.00',
                      'assets/imgs/Beerhouse/TecateLight118L.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Tecate Light 355 ml Retornable 1pz',
                      '\$13.00',
                      'assets/imgs/Beerhouse/TecateLight355.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Tecate Light 355 ml No Retornable 1pz ',
                      '\$10.00',
                      'assets/imgs/Beerhouse/TecateLightNoRetornable355.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Tecate Roja 1.18L Retornable 1pz',
                      '\$31.00',
                      'assets/imgs/Beerhouse/TecateRoja118L.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Tecate Roja 355ml Retornable 1pz',
                      '\$10.00',
                      'assets/imgs/Beerhouse/TecateRoja355.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Tempús 355 ml No Retornable 1pz',
                      '\$30.00',
                      'assets/imgs/Beerhouse/Tempus355ml.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Tuborg 330 ml No Retornable 1pz',
                      '\$16.00',
                      'assets/imgs/Beerhouse/Tuborg330ml.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Victoria 1.2L',
                      '\$34.00',
                      'assets/imgs/Beerhouse/Victoria12L.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Victoria 355 ml Retornable 1pz',
                      '\$14.00',
                      'assets/imgs/Beerhouse/Victoria355ml.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Victoria 940 ml Retornable 1pz',
                      '\$30.00',
                      'assets/imgs/Beerhouse/Victoria940ml.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Victoria 210 ml Retornable 1pz',
                      '\$10.00',
                      'assets/imgs/Beerhouse/VictoriaAmpolleta.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'XX Lager 1.18L Retornable 1pz',
                      '\$34.00',
                      'assets/imgs/Beerhouse/XXLager118L.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'XX Lager 355 ml Retornable 1pz',
                      '\$11.00',
                      'assets/imgs/Beerhouse/XXLager355.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'XX Lager Ámbar 1.18L Retornable 1pz',
                      '\$34.00',
                      'assets/imgs/Beerhouse/XXLagerAmbar118L.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'XX Lager Ámbar 355 ml Retornable 1pz',
                      '\$11.00',
                      'assets/imgs/Beerhouse/XXLagerAmbar355.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'XX lager 190 ml Retornable 1pz',
                      '\$8.00',
                      'assets/imgs/Beerhouse/XXlagerAmpolleta.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                ],
              )),
          SizedBox(height: 15.0)
        ],
      ),
    );
  }
}
