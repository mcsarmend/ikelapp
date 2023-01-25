import 'package:blogapp/screens/pedidos.dart';
import 'package:blogapp/screens/post_screen.dart';
import 'package:blogapp/screens/profile.dart';
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
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Prueba de carrito')));
            },
          ),
        ],
      ),
      body: _buildChild(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        notchMargin: 5,
        elevation: 10,
        clipBehavior: Clip.antiAlias,
        shape: CircularNotchedRectangle(),
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
            BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Pedidos')
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
