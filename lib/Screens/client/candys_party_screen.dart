import 'package:flutter/material.dart';
import 'package:ikelapp/screens/client/product_detail.dart';
import 'package:ikelapp/screens/client/product_page.dart';
import '../../constant.dart';

class CandysParty extends StatelessWidget {
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
                      'Agua mineral ciel 1.75lts',
                      '\$23.00',
                      'assets/imgs/Candysparty/Aguamineralciel175lt.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Agua mineral Perrier',
                      '\$29.00',
                      'assets/imgs/Candysparty/AguaMineralPerrier.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Agua Natural 1lt',
                      '\$8.00',
                      'assets/imgs/Candysparty/AguaNatural1lt.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Agua Natural 500ml',
                      '\$5.00',
                      'assets/imgs/Candysparty/AguaNatural500ml.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Benson Hedges Gold Cajetilla',
                      '\$63.00',
                      'assets/imgs/Candysparty/BensonHedgesGoldCajetillas.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Benson Hedges Mentolados Cajetilla',
                      '\$63.00',
                      'assets/imgs/Candysparty/BensonHedgesMentolCajetillas.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Bolsa de Hielo',
                      '\$27.00',
                      'assets/imgs/Candysparty/BolsadeHielo.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Boost 235ml',
                      '\$25.00',
                      'assets/imgs/Candysparty/Boost235ml.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Botana Mixta',
                      '\$29.00',
                      'assets/imgs/Candysparty/BotanaMixta.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Cacahuate Enchilado',
                      '\$29.00',
                      'assets/imgs/Candysparty/CacahuateEnchilado.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Cacahuate Garapi??ado 200gr',
                      '\$N/A',
                      'assets/imgs/Candysparty/CacahuateGarapinado200gr.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Cacahuate Japones',
                      '\$69',
                      'assets/imgs/Candysparty/CacahuateJapones.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Cacahuate japones 160gr',
                      '\$20',
                      'assets/imgs/Candysparty/Cacahuatejapones160gr.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Cacahuate Salado sol',
                      '\$69',
                      'assets/imgs/Candysparty/CacahuateSaladosol.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Cacahuate surtido 185gr',
                      '\$20',
                      'assets/imgs/Candysparty/Cacahuatesurtido185gr.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Cacahuate Tipo Espa??ol con Ajo',
                      '\$69',
                      'assets/imgs/Candysparty/CacahuateTipoEspanolconAjo.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Canada Dry 237ml',
                      '\$N/A',
                      'assets/imgs/Candysparty/CanadaDry237ml.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Candy Camel Cajetilla',
                      '\$63.00',
                      'assets/imgs/Candysparty/candycamelcajetilla.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Charritos chile y lim??n',
                      '\$15.00',
                      'assets/imgs/Candysparty/Charritoschileylimon.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Clamato 2.5lts',
                      '\$69.00',
                      'assets/imgs/Candysparty/Clamato25lts.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Coca Cola 1lt',
                      '\$20.00',
                      'assets/imgs/Candysparty/CocaCola1lt.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Coca Cola 2.5lt',
                      '\$36.00',
                      'assets/imgs/Candysparty/CocaCola25lt.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Coca Cola light 2lt',
                      '\$31.00',
                      'assets/imgs/Candysparty/CocaColalight2lt.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Crunchi sol Cuadritos',
                      '\$N/A',
                      'assets/imgs/Candysparty/CrunchisolCuadritos.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Crunchisol Donitas Enchiladas',
                      '\$N/A',
                      'assets/imgs/Candysparty/CrunchisolDonitasEnchiladas.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Cueritosde Cerdo 750gr',
                      '\$59.00',
                      'assets/imgs/Candysparty/CueritosdeCerdo750gr.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Fresca 2lt',
                      '\$29.00',
                      'assets/imgs/Candysparty/Fresca2lt.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'frituras sabor queso sol 300gr',
                      '\$20.00',
                      'assets/imgs/Candysparty/friturassaborquesosol300gr.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Garbanzo Enchilado',
                      '\$69.00',
                      'assets/imgs/Candysparty/GarbanzoEnchilado.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Garbanzo enchilado 140gr',
                      '\$20.00',
                      'assets/imgs/Candysparty/Garbanzoenchilado140gr.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Ginger Ale 237 ml',
                      '\$9.00',
                      'assets/imgs/Candysparty/GingerAle237ml.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Haba Enchilada',
                      '\$69.00',
                      'assets/imgs/Candysparty/HabaEnchilada.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Haba Enchilada 120gr',
                      '\$20.00',
                      'assets/imgs/Candysparty/HabaEnchilada120gr.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Halls Negras',
                      '\$10.00',
                      'assets/imgs/Candysparty/HallsNegras.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Marlboro gold cajetilla',
                      '\$63.00',
                      'assets/imgs/Candysparty/Marlborogoldcajetilla.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Marlboro Ice Xpress',
                      '\$63.00',
                      'assets/imgs/Candysparty/MarlboroIceXpress.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Marlboro Rojo cajetilla',
                      '\$63.00',
                      'assets/imgs/Candysparty/marlboroRojocajetilla.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Maruchan',
                      '\$15.00',
                      'assets/imgs/Candysparty/Maruchan.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Monster Energy',
                      '\$42.00',
                      'assets/imgs/Candysparty/MonsterEnergy.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Mundet Prisco',
                      '\$12.00',
                      'assets/imgs/Candysparty/MundetPrisco.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Nectar del Valle Naranja',
                      '\$19.00',
                      'assets/imgs/Candysparty/NectardelValleNaranja.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Nectar del Valle Uva',
                      '\$19.00',
                      'assets/imgs/Candysparty/NectardelValleUva.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Nectar del Valle Pi??a',
                      '\$19.00',
                      'assets/imgs/Candysparty/NectarPinaDelValle.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Ocean Spray Cranberry',
                      '\$26.00',
                      'assets/imgs/Candysparty/OceanSprayCranberry.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Ocean Spray Uva',
                      '\$26.00',
                      'assets/imgs/Candysparty/OceanSprayUva.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Papa Adobada sol',
                      '\$59.00',
                      'assets/imgs/Candysparty/PapaAdobadasol.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Papa con queso sol',
                      '\$59.00',
                      'assets/imgs/Candysparty/Papaconquesosol.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Papa Natural de sal',
                      '\$59.00',
                      'assets/imgs/Candysparty/PapaNaturaldelsal.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Pe??afiel 1lt',
                      '\$12.00',
                      'assets/imgs/Candysparty/Penafiel1lt.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Pepita frita',
                      '\$99.00',
                      'assets/imgs/Candysparty/Pepitafrita.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Pepitarusa100gr',
                      '\$20.00',
                      'assets/imgs/Candysparty/Pepitarusa100gr.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'RedBull Energy',
                      '\$40.00',
                      'assets/imgs/Candysparty/RedBullEnergy.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'RedBull Sugar Free',
                      '\$40.00',
                      'assets/imgs/Candysparty/RedBullSugarFree.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'RedBull Tropical',
                      '\$40.00',
                      'assets/imgs/Candysparty/RedBullTropical.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Rockaleta',
                      '\$5.00',
                      'assets/imgs/Candysparty/Rockaleta.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Sal La Fina',
                      '\$15.00',
                      'assets/imgs/Candysparty/SalLaFina.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Salsa Valentina',
                      '\$15.00',
                      'assets/imgs/Candysparty/SalsaValentina.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Sangr??a Se??orial 1lt',
                      '\$21.00',
                      'assets/imgs/Candysparty/SangriaSenorial1lt.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Sangrita Viuda de Sanchez',
                      '\$71.00',
                      'assets/imgs/Candysparty/SangritaViudadeSanchez.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Sidral Mundet 2lt',
                      '\$29.00',
                      'assets/imgs/Candysparty/SidralMundet2lt.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Skyy Blue',
                      '\$22.00',
                      'assets/imgs/Candysparty/SkyyBlue.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Sangria Se??orial 2lt',
                      '\$30.00',
                      'assets/imgs/Candysparty/SnagriaSenorial2lt.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Sprite 2lt',
                      '\$29.00',
                      'assets/imgs/Candysparty/Sprite2lt.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Trident XtraCare Menta Tabletas',
                      '\$10.00',
                      'assets/imgs/Candysparty/Trident.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Tubi Charro Naturales',
                      '\$N/A',
                      'assets/imgs/Candysparty/TubiCharroNaturales.png',
                      false,
                      false,
                      "Detalle de Producto",
                      context),
                  productpage.build(
                      'Tupsi Pop',
                      '\$5',
                      'assets/imgs/Candysparty/Tupsi.png',
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
