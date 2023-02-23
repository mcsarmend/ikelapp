import 'package:ikelapp/screens/client/pedidos.dart';
import 'package:ikelapp/screens/home_screen.dart';
import 'package:ikelapp/screens/general/profile.dart';
import 'package:ikelapp/screens/client/shoppingbag_screen.dart';
import 'package:flutter/material.dart';
import '../constant.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
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
            icon: Icon(
              Icons.shopping_cart,
              color: SECONDARY_COLOR,
            ),
            tooltip: 'Carrito',
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => shoppingbag()),
              );
            },
          ),
        ],
      ),
      body: _buildChild(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: PRYMARY_COLOR,
        notchMargin: 5,
        elevation: 10,
        clipBehavior: Clip.antiAlias,
        shape: CircularNotchedRectangle(),
        child: BottomNavigationBar(
          backgroundColor: PRYMARY_COLOR,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person, color: Colors.white), label: 'Perfil'),
            BottomNavigationBarItem(
                icon: Icon(Icons.list, color: Colors.white), label: 'Pedidos')
          ],
          currentIndex: currentIndex,
          onTap: (val) {
            setState(() {
              currentIndex = val;
            });
          },
        ),
      ),
    );
  }

  Widget _buildChild() {
    if (currentIndex == 0) {
      return HomeScreen();
    } else {
      if (currentIndex == 1) {
        return Profile();
      } else {
        return Pedidos();
      }
    }
  }
}
