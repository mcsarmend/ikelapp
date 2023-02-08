import 'package:blogapp/screens/profile.dart';
import 'package:blogapp/screens/shoppingbag_screen.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:flutter/material.dart';
import '../constant.dart';
import 'delivery_screen.dart';

class delivery_user_screen extends StatefulWidget {
  @override
  _delivery_user_screenState createState() => _delivery_user_screenState();
}

class _delivery_user_screenState extends State<delivery_user_screen> {
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
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => shoppingbag()),
                  (route) => false);
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
                icon: Icon(Icons.person, color: Colors.white), label: 'Perfil')
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
      return delivery_screen();
    } else {
      return Profile();
    }
  }
}
