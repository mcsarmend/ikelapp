import 'package:flutter/material.dart';
import 'package:ikelapp/screens/client/confirmation_screen.dart';
import 'package:ikelapp/screens/home.dart';
import 'package:ikelapp/models/address.dart';
import 'package:ikelapp/models/api_response.dart';
import 'package:ikelapp/models/user.dart';
import 'package:ikelapp/services/user_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../constant.dart';

class shoppingbag extends StatefulWidget {
  @override
  State<shoppingbag> createState() => _shoppingbagState();
}

class _shoppingbagState extends State<shoppingbag> {
  int userId = 0;
  User? user;
  User? email;
  bool loading = true;
  String location = "Sin ubicación";
  String description = "";
  List<String> _cartItems = [];
  List<double> _costItems = [];
  List<String> _countItems = [];
  List<double> totalCostList = [];
  List<String> ca = [];
  List<String> co = [];
  List<String> cu = [];
  String carrito = "";
  double cost = 0.0;
  String t = "";
  double shippingCost = 50.0;
  double total = 50.0;
  void getUser() async {
    ApiResponse response = await getUserDetail();
    userId = await getUserId();
    ApiResponse res = await getaddress(userId.toString());

    if (response.error == null) {
      setState(() {
        user = response.data as User;
        loading = false;

        if (res.error != null) {
          location = "Sin dirección registrada";
        } else {
          var address = res.data as Address;
          location = address.street.toString() +
              ", " +
              address.number.toString() +
              ", " +
              address.suburb.toString() +
              ", " +
              address.city.toString() +
              ", " +
              address.state.toString() +
              ", " +
              address.cp.toString();
        }
      });
    }
  }

  void setOrderBag() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var cartItems = await pref.getStringList('cartItems');
    var costItems = await pref.getStringList('costItems');
    var countItems = await pref.getStringList('countItems');

    if (cartItems != null && cartItems.length > 0) {
      ca = cartItems;
      co = costItems!;
      cu = countItems!;
      for (var i = 0; i < cartItems.length; i++) {
        var costTemp =
            int.tryParse(countItems[i])! * double.tryParse(costItems![i])!;
        var ele = cartItems[i] +
            " (" +
            countItems[i] +
            ")" +
            " \$" +
            costTemp!.toString();
        _cartItems.add(ele);
      }

      for (var i = 0; i < cartItems.length; i++) {
        totalCostList.add(
            int.tryParse(countItems![i])! * double.tryParse(costItems![i])!);
      }

      setState(() {
        cost = totalCostList.reduce((a, b) => a + b);
        total = (shippingCost + cost);
      });
    }
  }

  void deleteitem(index) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (_cartItems.length > 0) {
      ca.removeAt(index);
      co.removeAt(index);
      cu.removeAt(index);
      _cartItems.removeAt(index);
      totalCostList = [];
      for (var i = 0; i < ca.length; i++) {
        totalCostList.add(int.tryParse(cu![i])! * double.tryParse(co![i])!);
      }

      if (_cartItems.length == 0) {
        setState(() {
          cost = 0;
          total = (shippingCost + cost);
        });
      } else {
        await pref.setStringList('cartItems', ca);
        await pref.setStringList('costItems', co);
        await pref.setStringList('countItems', cu);
        setState(() {
          cost = totalCostList.reduce((a, b) => a + b);
          total = (shippingCost + cost);
        });
      }
    }
  }

  showAlertDialog(BuildContext context) {
    // Create button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => Home(),
            ));
      },
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(t),
      content: Text(""),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void buy(BuildContext context) async {
    if (_cartItems.length == 0) {
      setState(() {
        t = "No tienes nada en el carrito";
      });
      showAlertDialog(context);
    } else {
      SharedPreferences pref = await SharedPreferences.getInstance();
      List<String> clear = [];
      await pref.setStringList('cartItems', clear);
      await pref.setStringList('costItems', clear);
      await pref.setStringList('countItems', clear);
      await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ConfirmationScreen()),
      );
    }
  }

  @override
  void initState() {
    getUser();
    setOrderBag();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carrito de compras'),
        backgroundColor: PRYMARY_COLOR,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _cartItems.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(_cartItems[index]),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      setState(() {
                        deleteitem(index);
                      });
                    },
                  ),
                );
              },
            ),
          ),
          Divider(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Subtotal:'),
                Text('\$' + cost.toString()),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Costo de envío:'),
                Text('\$$shippingCost'),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total:'),
                Text('\$' + total.toString()),
              ],
            ),
          ),
          SizedBox(height: 24.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Dirección de entrega: " + location,
              style: TextStyle(fontSize: 18, color: SECONDARY_COLOR),
            ),
          ),
          SizedBox(height: 16.0),
          kTextButton('  Finalizar compra  ', () {
            buy(context);
          }),
        ],
      ),
    );
  }
}
