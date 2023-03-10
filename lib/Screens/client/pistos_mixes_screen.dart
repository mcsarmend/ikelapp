import 'package:flutter/material.dart';
import 'package:ikelapp/screens/client/pistos_page.dart';
import 'package:ikelapp/screens/client/product_detail.dart';
import 'package:ikelapp/screens/client/product_page.dart';
import '../../constant.dart';

// ignore: must_be_immutable
class PistosMix extends StatelessWidget {
/*   var pistoxmixarr = [
    {
      {
        'Alfa Romeo',
        '95',
        true,
        true,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
      },
      {
        'Aston Martin',
        '129',
        true,
        true,
        true,
        true,
        true,
        false,
        false,
        false,
        false,
      },
      {
        'Bentley Mango o Tamarindo',
        '109',
        true,
        true,
        true,
        true,
        false,
        true,
        false,
        false,
        false,
      },
      {
        'Bugatti',
        '85',
        true,
        false,
        true,
        true,
        false,
        false,
        false,
        false,
        false,
      },
      {
        'Cadillac',
        '109',
        true,
        true,
        true,
        true,
        false,
        false,
        false,
        false,
        false,
      },
      {
        'Citroen',
        '85',
        true,
        false,
        true,
        true,
        false,
        false,
        false,
        false,
        false,
      },
      {
        'Corvette',
        '119',
        true,
        true,
        true,
        true,
        false,
        false,
        false,
        false,
        false,
      },
      {
        'Ferrari',
        '109',
        true,
        true,
        true,
        true,
        false,
        false,
        false,
        false,
        false,
      },
      {
        'Hennessey',
        '129',
        true,
        true,
        true,
        true,
        true,
        false,
        false,
        false,
        false,
      },
      {
        'Lamborghini',
        '99',
        true,
        true,
        true,
        true,
        false,
        false,
        false,
        false,
        false,
      },
      {
        'Lexus',
        '129',
        true,
        true,
        true,
        true,
        true,
        false,
        false,
        false,
        false,
      },
      {
        'Likan',
        '129',
        true,
        true,
        true,
        true,
        true,
        false,
        false,
        false,
        false,
      },
      {
        'Maserati',
        '99',
        true,
        true,
        true,
        true,
        true,
        false,
        false,
        false,
        false,
      },
      {
        'Mastretta',
        '139',
        true,
        true,
        true,
        true,
        true,
        false,
        true,
        false,
        false,
      },
      {
        'Mclaren',
        '109',
        true,
        true,
        true,
        true,
        false,
        false,
        false,
        true,
        false,
      },
      {
        'MG',
        '109',
        true,
        true,
        true,
        true,
        false,
        false,
        false,
        false,
        false,
      },
      {
        'Nos F1',
        '139',
        true,
        true,
        true,
        true,
        false,
        false,
        false,
        false,
        false,
      },
      {
        'Rolls Royce',
        '119',
        true,
        false,
        true,
        true,
        false,
        false,
        false,
        false,
        false,
      },
      {
        'Saleen ',
        '119',
        true,
        true,
        true,
        true,
        false,
        false,
        false,
        false,
        false,
      },
      {
        'Porsche',
        '109',
        true,
        true,
        true,
        true,
        false,
        false,
        false,
        false,
        true,
      },
      {
        'Venom',
        '129',
        true,
        true,
        true,
        true,
        true,
        false,
        false,
        false,
        false,
      },
      {
        'Viper',
        '109',
        true,
        true,
        true,
        true,
        false,
        false,
        false,
        false,
        false,
      },
    }
  ];
  var cervesas = [
    'Barrilito',
    'Blanc',
    'Bocanegra',
    'Bohemia Clara',
    'Bohemia Cl??sica',
    'Bohemia Obscura',
    'Bohemina Weizen ',
    'Brooklyn',
    'Bud Light',
    'Budweiser',
    'Carta Blanca',
    'Corona',
    'Corona l',
    'Cucapa',
    'Goose Island',
    'Gran Modelo',
    'Grimbergen',
    'Heineken',
    'Hoegaarden',
    'Indio ',
    'Jabal??',
    'Lagunitas Ipa',
    'Le??n',
    'Michelob Ultra',
    'Modelo Ambar ',
    'Modelo Especial',
    'Modelo Trigo',
    'Montejo',
    'Negra Modelo',
    'Noche Buena ',
    'Pacifico',
    'Pacifico l',
    'Quilmes',
    'Sol',
    'Stella Artois',
    'Superior',
    'Tecate Ambar',
    'Tecate Ambar ',
    'Tecate Light',
    'Tecate Roja',
    'Tempus',
    'Tuborg',
    'Victoria',
    'XX Ambar',
    'xx Lager',
  ];
 */

  PistosPage pistospage = PistosPage();
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
                  pistospage.build(
                      'Alfa romeo',
                      '\$95.00',
                      'assets/imgs/PistosMix/Alfaromeo.png',
                      false,
                      false,
                      "Michelada tradicional sal, lim??n y  escarchado",
                      true,
                      true,
                      false,
                      false,
                      false,
                      false,
                      false,
                      false,
                      false,
                      context),
                  pistospage.build(
                      'Aston Martin',
                      '\$129.00',
                      'assets/imgs/PistosMix/astonmartin.png',
                      false,
                      false,
                      "Michelada sabor Bluberry con Red Bull",
                      true,
                      true,
                      true,
                      true,
                      true,
                      false,
                      false,
                      false,
                      false,
                      context),
                  pistospage.build(
                      'Bentley',
                      '\$109.00',
                      'assets/imgs/PistosMix/Bentley.png',
                      false,
                      false,
                      "Cerveza sabor a mango con nieve del mismo sabor",
                      true,
                      true,
                      true,
                      true,
                      false,
                      true,
                      false,
                      false,
                      false,
                      context),
                  pistospage.build(
                      'Bugatti',
                      '\$85.00',
                      'assets/imgs/PistosMix/Bugatti.png',
                      false,
                      false,
                      "Sangr??a preparada con lim??n y sal ",
                      true,
                      false,
                      true,
                      true,
                      false,
                      false,
                      false,
                      false,
                      false,
                      context),
                  pistospage.build(
                      'Cadillac',
                      '\$109.00',
                      'assets/imgs/PistosMix/Cadillac.png',
                      false,
                      false,
                      "Chabelita cerveza mezclada con refresco rojo, sal Y lim??n",
                      true,
                      true,
                      true,
                      true,
                      false,
                      false,
                      false,
                      false,
                      false,
                      context),
                  pistospage.build(
                      'Citroen',
                      '\$85.00',
                      'assets/imgs/PistosMix/Citroen.png',
                      false,
                      false,
                      "Tehuacan preparado con lim??n y sal",
                      true,
                      false,
                      true,
                      true,
                      false,
                      false,
                      false,
                      false,
                      false,
                      context),
                  pistospage.build(
                      'Corvette',
                      '\$119.00',
                      'assets/imgs/PistosMix/Corvette.png',
                      false,
                      false,
                      "Cerveza con sidra Strongbow gold sabor a frambuesa",
                      true,
                      true,
                      true,
                      true,
                      false,
                      false,
                      false,
                      false,
                      false,
                      context),
                  pistospage.build(
                      'Ferrari',
                      '\$109.00',
                      'assets/imgs/PistosMix/Ferrari.png',
                      false,
                      false,
                      "Mezcla de sabor cerveza y chamoy",
                      true,
                      true,
                      true,
                      true,
                      false,
                      false,
                      false,
                      false,
                      false,
                      context),
                  pistospage.build(
                      'Hennessey',
                      '\$129.00',
                      'assets/imgs/PistosMix/Hennessey.png',
                      false,
                      false,
                      "Michelada sabor frutos rojos con Red Bull",
                      true,
                      true,
                      true,
                      true,
                      true,
                      false,
                      false,
                      false,
                      false,
                      context),
                  pistospage.build(
                      'Lamborghinni',
                      '\$99.00',
                      'assets/imgs/PistosMix/Lamborghinni.png',
                      false,
                      false,
                      "Michelada tradicional sal, lim??n y  escarchado",
                      true,
                      true,
                      true,
                      true,
                      false,
                      false,
                      false,
                      false,
                      false,
                      context),
                  pistospage.build(
                      'Lexus',
                      '\$129.00',
                      'assets/imgs/PistosMix/Lexus.png',
                      false,
                      false,
                      "Michelada sabor manzana verde con Red Bull",
                      true,
                      true,
                      true,
                      true,
                      true,
                      false,
                      false,
                      false,
                      false,
                      context),
                  pistospage.build(
                      'Likan',
                      '\$129.00',
                      'assets/imgs/PistosMix/Likan.png',
                      false,
                      false,
                      "Michelada sabor maracuya-chamoy verde con Red Bull",
                      true,
                      true,
                      true,
                      true,
                      true,
                      false,
                      false,
                      false,
                      false,
                      context),
                  pistospage.build(
                      'Masserati',
                      '\$99.00',
                      'assets/imgs/PistosMix/Masserati.png',
                      false,
                      false,
                      "Michelada Cubana, salsa inglesa, salsa Maggy, salsa Valentina, salsa Tabasco, lim??n y sal",
                      true,
                      true,
                      true,
                      true,
                      true,
                      false,
                      false,
                      false,
                      false,
                      context),
                  pistospage.build(
                      'Mastretta',
                      '\$139.00',
                      'assets/imgs/PistosMix/Mastretta.png',
                      false,
                      false,
                      "Michelada sabor pepino-morita y una onza de Mezcal ",
                      true,
                      true,
                      true,
                      true,
                      true,
                      false,
                      true,
                      false,
                      false,
                      context),
                  pistospage.build(
                      'Mclaren',
                      '\$109.00',
                      'assets/imgs/PistosMix/Mclaren.png',
                      false,
                      false,
                      "Clamachela, cerveza con clamato natural",
                      true,
                      true,
                      true,
                      true,
                      false,
                      false,
                      false,
                      true,
                      false,
                      context),
                  pistospage.build(
                      'Mg',
                      '\$109.00',
                      'assets/imgs/PistosMix/Mg.png',
                      false,
                      false,
                      "Gomichela, mezcla de chamoy y gomitas ",
                      true,
                      true,
                      true,
                      true,
                      false,
                      false,
                      false,
                      false,
                      false,
                      context),
                  pistospage.build(
                      'NosF1',
                      '\$139.00',
                      'assets/imgs/PistosMix/NosF1.png',
                      false,
                      false,
                      "Cerveza sabor a uva y jugo de litchi",
                      true,
                      true,
                      true,
                      true,
                      false,
                      false,
                      false,
                      false,
                      false,
                      context),
                  pistospage.build(
                      'Porshe',
                      '\$109.00',
                      'assets/imgs/PistosMix/porshe.png',
                      false,
                      false,
                      "Cerveza con sabores, fresa, coco, maracuya, pi??a, uva, durazno y chamoy",
                      true,
                      true,
                      true,
                      true,
                      false,
                      false,
                      false,
                      false,
                      true,
                      context),
                  pistospage.build(
                      'RollRoyce',
                      '\$119.00',
                      'assets/imgs/PistosMix/RollRoyce.png',
                      false,
                      false,
                      "Calimocho, Vino tinto con lim??n, sal y Coca cola",
                      true,
                      false,
                      true,
                      true,
                      false,
                      false,
                      false,
                      false,
                      false,
                      context),
                  pistospage.build(
                      'Saleen',
                      '\$119.00',
                      'assets/imgs/PistosMix/Saleen.png',
                      false,
                      false,
                      "Cerveza con Skyy Blue y sabor a mandarina",
                      true,
                      true,
                      true,
                      true,
                      false,
                      false,
                      false,
                      false,
                      false,
                      context),
                  pistospage.build(
                      'Venom',
                      '\$129.00',
                      'assets/imgs/PistosMix/Venom.png',
                      false,
                      false,
                      "Michelada sabor pi??a colada con Red Bull",
                      true,
                      true,
                      true,
                      true,
                      true,
                      false,
                      false,
                      false,
                      false,
                      context),
                  pistospage.build(
                      'Viper',
                      '\$109.00',
                      'assets/imgs/PistosMix/Viper.png',
                      false,
                      false,
                      "Cerveza con sabor a fresa- kiwi acompa??ada de bing picosito",
                      true,
                      true,
                      true,
                      true,
                      false,
                      false,
                      false,
                      false,
                      false,
                      context),
                ],
              )),
          SizedBox(height: 15.0)
        ],
      ),
    );
  }
}
