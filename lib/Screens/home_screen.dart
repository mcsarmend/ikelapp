import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterapp/Screens/beer_house_screen.dart';
import 'package:flutterapp/Screens/candys_party_screen.dart';
import 'package:flutterapp/Screens/healthy_fun_screeen.dart';
import 'package:flutterapp/Screens/pistos_mixes_screen.dart';
import 'package:flutterapp/Screens/prelogin.dart';
import 'package:flutterapp/Services/globals.dart';
import 'package:flutterapp/rounded_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'address_register.dart';
import 'hard_drinks_screen.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);
  var name = "";
  var email = "";
  @override
  State<HomeScreen> createState() => _HomeScreenState();

  Future<void> setName(name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('name', name);
  }

  Future<String?> getName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('name');
  }

  Future<void> setEmail(email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('email', email);
  }

  Future<void> getEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    email = prefs.getString('email').toString();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  late SharedPreferences logindata;
  void initial() async {
    logindata = await SharedPreferences.getInstance();
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    await loadClientName();
  }

  // ignore: unused_field
  bool _isLoading = true;
  @override
  void initState() {
    super.initState();
    _isLoading = false;
    initial();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final ButtonStyle style = TextButton.styleFrom(
      foregroundColor: Theme.of(context).colorScheme.onPrimary,
    );

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

  String nameClient = "";
  String clientEmail = "";
  String location = "Sin ubicación registrada";
  Future<void> loadClientName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    nameClient = prefs.getString('name').toString();
    clientEmail = prefs.getString('email').toString();
    setState(() {});
  }

  List<Widget> get Profile {
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
              nameClient,
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
              clientEmail,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Container(
              height: 20,
            ),
            Text(
              location,
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
        height: 20,
      ),
      Container(
          child: RoundedButton(
        btnText: "Actualizar Ubicacion",
        onBtnPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => address_register(),
              ));
        },
      )),
      Container(
        height: 30,
      ),
      Container(
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.only(left: 40, top: 40),
          alignment: Alignment.bottomRight,
          child: FloatingActionButton(
              child: Icon(
                Icons.output,
                color: SECONDARY_COLOR,
              ),
              elevation: 50.0,
              backgroundColor: Colors.white,
              onPressed: () {
                logindata.setBool('login', true);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => prelogin_screen(),
                    ));
              }))
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
