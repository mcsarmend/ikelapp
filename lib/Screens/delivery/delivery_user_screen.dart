import 'package:ikelapp/screens/general/profile.dart';
import 'package:flutter/material.dart';
import '../../constant.dart';
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
/*       appBar: AppBar(
        backgroundColor: PRYMARY_COLOR,
        automaticallyImplyLeading: false,
        title: Text("Repartidor"),
        actions: <Widget>[],
      ), */
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
