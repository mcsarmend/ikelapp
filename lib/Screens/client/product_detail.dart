import 'package:counter_button/counter_button.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../constant.dart';
import '../home.dart';

class ProductDetail extends StatefulWidget {
  final assetPath, price, productname, detail;

  ProductDetail({this.assetPath, this.price, this.productname, this.detail});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  int _counterValue = 0;
  String t = "texto";

  void addToCar(path, name, price, count) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (count == 0) {
      t = "No has indicado la cantidad";
    } else {
      var cartItems = await pref.getStringList('cartItems');
      var costItems = await pref.getStringList('costItems');
      var countItems = await pref.getStringList('countItems');

      if (cartItems == null) {
        cartItems = [];
      }
      if (costItems == null) {
        costItems = [];
      }
      if (countItems == null) {
        countItems = [];
      }

      var p = price.substring(1, price.length - 3);
      cartItems.add(name);
      costItems.add(p);
      countItems.add(count.toString());

      await pref.setStringList('cartItems', cartItems);
      await pref.setStringList('costItems', costItems);
      await pref.setStringList('countItems', countItems);
      t = "Producto agregado correctamente";
    }

    showAlertDialog(context);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF545D68)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('Pickup',
            style: TextStyle(
                fontFamily: 'Varela',
                fontSize: 20.0,
                color: Color(0xFF545D68))),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications_none, color: Color(0xFF545D68)),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(children: [
        SizedBox(height: 10.0),
        Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: Text('Detalle',
              style: TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 42.0,
                  fontWeight: FontWeight.bold,
                  color: PRYMARY_COLOR)),
        ),
        SizedBox(height: 10.0),
        Hero(
            tag: widget.assetPath,
            child: Image.asset(widget.assetPath,
                height: 350, width: 300.0, fit: BoxFit.contain)),
        SizedBox(height: 10.0),
        Center(
          child: Text(widget.price,
              style: TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  color: PRYMARY_COLOR)),
        ),
        SizedBox(height: 10.0),
        Center(
          child: Text(widget.productname,
              style: TextStyle(
                  color: Color(0xFF575E67),
                  fontFamily: 'Varela',
                  fontSize: 24.0)),
        ),
        SizedBox(height: 10.0),
        Center(
          child: Container(
            width: MediaQuery.of(context).size.width - 50.0,
            child: Text(widget.detail,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Varela',
                    fontSize: 16.0,
                    color: Color(0xFFB4B8B9))),
          ),
        ),
        Center(
          child: CounterButton(
            loading: false,
            onChange: (int val) {
              if (val >= 0 && val <= 100) {
                setState(() {
                  _counterValue = val;
                });
              } else if (val < 0) {
                setState(() {
                  _counterValue = 0;
                });
              } else {
                setState(() {
                  _counterValue = 100;
                });
              }
            },
            count: _counterValue,
            countColor: Colors.black,
            buttonColor: PRYMARY_COLOR,
            progressColor: PRYMARY_COLOR,
          ),
        ),
        SizedBox(height: 20.0),
        Center(
            child: Container(
                width: MediaQuery.of(context).size.width - 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    color: PRYMARY_COLOR),
                child: Center(
                    child: TextButton(
                        onPressed: () {
                          addToCar(widget.assetPath, widget.productname,
                              widget.price, _counterValue);
                        },
                        child: Text('Añadir al carrito',
                            style: TextStyle(
                                fontFamily: 'Varela',
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white))))))
      ]),
    );
  }
}
