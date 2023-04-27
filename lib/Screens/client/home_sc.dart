import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ikelapp/screens/client/party_screen.dart';
import 'package:ikelapp/screens/client/wholesale_screen.dart';

import '../../constant.dart';

class HomeSc extends StatefulWidget {
  const HomeSc(TabController tabController, {Key? key}) : super(key: key);

  @override
  _HomeScState createState() => _HomeScState();
}

class _HomeScState extends State<HomeSc> {
  int _currentIndex = 0;

  final List<String> _bannerImages = [
    'assets/imgs/banner_1.png',
    'assets/imgs/banner_2.png',
    'assets/imgs/banner_3.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(height: 30),
          CarouselSlider.builder(
            itemCount: _bannerImages.length,
            options: CarouselOptions(
              height: 200,
              viewportFraction: 1,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              onPageChanged: (index, _) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
            itemBuilder: (context, index, realIndex) {
              return Image.asset(
                _bannerImages[index],
                fit: BoxFit.cover,
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(_bannerImages.length, (index) {
              return Container(
                width: 8,
                height: 8,
                margin: EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                      _currentIndex == index ? Colors.blue : Colors.grey[400],
                ),
              );
            }),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Comienza a armar la fiesta',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 150 / 200,
            children: [
              Card(
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PartyScreen()),
                        );
                      },
                      child: Image.asset('assets/imgs/category_2.png'),
                    ),
                    Text('Arma tu fiesta', style: TextStyle(fontSize: 18)),
                    Text(
                      "Presiona la imágen",
                      style: TextStyle(color: PRYMARY_COLOR),
                    )
                  ],
                ),
              ),
              Card(
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WholeSaleScreen()),
                        );
                      },
                      child: Image.asset('assets/imgs/category_1.png'),
                    ),
                    Text(
                      'Pedidos Grandes',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      "Presiona la imágen",
                      style: TextStyle(color: PRYMARY_COLOR),
                    )
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: FittedBox(
              fit: BoxFit.cover,
              child: Row(
                children: <Widget>[
                  SizedBox(width: 8.0),
                  Column(
                    children: [
                      Image(
                        image: AssetImage('assets/imgs/pistosmix.png'),
                        width: 150,
                        height: 150,
                      ),
                      FittedBox(
                        fit: BoxFit
                            .scaleDown, // Escalar el texto hacia abajo si es necesario
                        child: Text(
                          'Las mejores combinaciones para divertirte a lo grande en tus fiestas.',
                          style: TextStyle(fontSize: 8.0),
                        ),
                      ),
                      FittedBox(
                        fit: BoxFit
                            .scaleDown, // Escalar el texto hacia abajo si es necesario
                        child: Text(
                          'Cerveza como nunca la haz probado.',
                          style: TextStyle(fontSize: 8.0),
                        ),
                      ),
                      FittedBox(
                        fit: BoxFit
                            .scaleDown, // Escalar el texto hacia abajo si es necesario
                        child: Text(
                          'Es tu mejor momento para probar los pistos sagrados.',
                          style: TextStyle(fontSize: 8.0),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.swipe_left_sharp,
                            color: PRYMARY_COLOR,
                          ))
                    ],
                  ) // Espacio entre la imagen y el icono
                ],
              ),
            ),
          ),
          SizedBox(height: 30),
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
      ),
    );
  }
}
