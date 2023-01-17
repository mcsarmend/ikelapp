import 'package:flutter/material.dart';
import 'package:flutterapp/Screens/beer_house_screen.dart';
import 'package:flutterapp/Screens/candys_party_screen.dart';
import 'package:flutterapp/Screens/healthy_fun_screeen.dart';
import 'package:flutterapp/Screens/pistos_mixes_screen.dart';
import 'package:flutterapp/Screens/prelogin.dart';

import 'hard_drinks_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = TextButton.styleFrom(
      foregroundColor: Theme.of(context).colorScheme.onPrimary,
    );
    final Color PRYMARY_COLOR = Color.fromRGBO(143, 164, 58, 1);
    final Color SECONDARY_COLOR = Color.fromRGBO(141, 166, 199, 1);
    bool typing = false;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: TextField(
          decoration: InputDecoration(
              hintText: 'Buscar', prefixIcon: Icon(Icons.search)),
        ),
        actions: <Widget>[
          Image(
            image: AssetImage('assets/imgs/ikellogo.png'),
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_cart,
                color: SECONDARY_COLOR,
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (_selectedIndex == 0)
              // you can call custom widget here
              Column(
                children: [
                  Column(
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      PistosMix(),
                                ));
                          },
                          child: Text("Pistos Mixes")),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      HardDrinks(),
                                ));
                          },
                          child: Text("Hard Drinks")),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      BeerHouse(),
                                ));
                          },
                          child: Text("Beer House")),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      CandysParty(),
                                ));
                          },
                          child: Text("Candys Party")),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      HealthyFun(),
                                ));
                          },
                          child: Text("Healthy Fun")),
                    ],
                  )
                ],
              )
            else if (_selectedIndex == 1)
              Column(
                children: Profile,
              )
            else
              Column(
                children: const [
                  Text("Pedidos"),
                ],
              ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: PRYMARY_COLOR,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'Perfil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notes),
            label: 'Pedidos',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }

  List<Widget> get Profile {
    final Color PRYMARY_COLOR = Color.fromRGBO(143, 164, 58, 1);
    final Color SECONDARY_COLOR = Color.fromRGBO(141, 166, 199, 1);
    return <Widget>[
      Container(
        height: 400,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [PRYMARY_COLOR, SECONDARY_COLOR],
            begin: Alignment.bottomLeft,
            end: Alignment.centerRight,
            stops: [0.3, 0.9],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.white70,
                  minRadius: 60.0,
                  child: CircleAvatar(
                    radius: 50.0,
                    backgroundColor: PRYMARY_COLOR,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Roberto Herrera Ruiz',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Container(
              height: 20,
            ),
            Text(
              'Santa Maria Trinidad. N°23 In. 8, San Ignacion, Edo.Mex,70789  ',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Container(
              height: 20,
            ),
          ],
        ),
      ),
      Container(
        color: PRYMARY_COLOR,
        child: CircleAvatar(
            backgroundColor: Colors.white,
            minRadius: 25,
            child: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => prelogin_screen(),
                      ));
                },
                icon: Icon(Icons.output))),
      ),
    ];
  }
}

class TextBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      color: Colors.white,
      child: TextField(
        decoration:
            InputDecoration(border: InputBorder.none, hintText: 'Search'),
      ),
    );
  }
}
