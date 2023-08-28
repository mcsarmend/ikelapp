import 'package:counter_button/counter_button.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../constant.dart';

class PistosDetail extends StatefulWidget {
  final assetPath,
      price,
      productname,
      detail,
      beertype,
      frosty,
      skewer,
      snack,
      redbull,
      icecream,
      mezcal,
      clamato,
      flavors;

  PistosDetail(
      {this.assetPath,
      this.price,
      this.productname,
      this.detail,
      this.beertype,
      this.frosty,
      this.skewer,
      this.snack,
      this.redbull,
      this.icecream,
      this.mezcal,
      this.clamato,
      this.flavors});

  @override
  State<PistosDetail> createState() => _PistosDetailState();
}

class _PistosDetailState extends State<PistosDetail> {
  int _counterValue = 0;
  String t = "texto";
  String beertypeval = beersList[0];
  String frostyval = frostyList[0];
  String skewerval = skewerList[0];
  String snackval = snackList[0];
  String redbullval = redbullList[0];
  String icecreamval = icecreamList[0];
  String mezcalval = mezcalList[0];
  String clamatoval = clamatoList[0];
  String flavorsval = flavorsList[0];
  void addToCar(
      path,
      name,
      price,
      count,
      beertypeval,
      frostyval,
      skewerval,
      snackval,
      redbullval,
      icecreamval,
      mezcalval,
      clamatoval,
      flavorsval) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

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

    if (count == 0) {
      t = "No tienes agregada la cantidad";
    } else {
      var item = name + " preparado con: ";

      if (widget.beertype) {
        item = item + beertypeval + " ,";
      }
      if (widget.frosty) {
        item = item + frostyval + " ,";
      }
      if (widget.skewer) {
        item = item + skewerval + " ,";
      }
      if (widget.snack) {
        item = item + snackval + " ,";
      }
      if (widget.redbull) {
        item = item + redbullval + " ,";
      }
      if (widget.icecream) {
        item = item + icecreamval + " ,";
      }
      if (widget.mezcal) {
        item = item + mezcalval + " ,";
      }
      if (widget.clamato) {
        item = item + clamatoval + " ,";
      }
      if (widget.flavors) {
        item = item + flavorsval + " ,";
      }
      var p = price.substring(1, price.length - 3);
      item = item.substring(0, item.length - 2);
      cartItems.add(item);
      costItems.add(p);
      countItems.add(count.toString());
      await pref.setStringList('cartItems', cartItems);
      await pref.setStringList('costItems', costItems);
      await pref.setStringList('countItems', countItems);

      t = "Producto agregado";
    }
/*     await pref.setStringList('cartItems', cartItems); */

    showAlertDialog(context);
  }

  showAlertDialog(BuildContext context) {
    // Create button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
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
        title: Text('',
            style: TextStyle(
                fontFamily: 'Varela', fontSize: 20.0, color: PRYMARY_COLOR)),
        actions: <Widget>[],
      ),
      body: ListView(children: [
        SizedBox(height: 10.0),
        Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: Text('Pistos Mix',
              style: TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 42.0,
                  fontWeight: FontWeight.bold,
                  color: PRYMARY_COLOR)),
        ),
        SizedBox(height: 10.0),
        Row(
          children: [
            Hero(
                tag: widget.assetPath,
                child: Image.asset(widget.assetPath,
                    height: 200, width: 150, fit: BoxFit.contain)),
            SizedBox(height: 10.0),
            Column(
              children: [
                widget.beertype
                    ? Column(
                        children: [
                          Text(
                            "Tipo de Cerveza",
                            style:
                                TextStyle(color: PRYMARY_COLOR, fontSize: 16),
                          ),
                          DropdownButton<String>(
                            value: beertypeval,
                            items: beersList
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                beertypeval = newValue!;
                              });
                            },
                          ),
                        ],
                      )
                    : SizedBox(
                        height: 1,
                      ),
                widget.frosty
                    ? Column(
                        children: [
                          Text(
                            "Escarchado",
                            style:
                                TextStyle(color: PRYMARY_COLOR, fontSize: 16),
                          ),
                          DropdownButton<String>(
                            value: frostyval,
                            items: frostyList
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                frostyval = newValue!;
                              });
                            },
                          ),
                        ],
                      )
                    : SizedBox(
                        height: 1,
                      ),
                widget.skewer
                    ? Column(
                        children: [
                          Text(
                            "Brocheta",
                            style:
                                TextStyle(color: PRYMARY_COLOR, fontSize: 16),
                          ),
                          DropdownButton<String>(
                            value: skewerval,
                            items: skewerList
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                skewerval = newValue!;
                              });
                            },
                          ),
                        ],
                      )
                    : SizedBox(
                        height: 1,
                      ),
                widget.snack
                    ? Column(
                        children: [
                          Text(
                            "Botana",
                            style:
                                TextStyle(color: PRYMARY_COLOR, fontSize: 16),
                          ),
                          DropdownButton<String>(
                            value: snackval,
                            items: snackList
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                snackval = newValue!;
                              });
                            },
                          ),
                        ],
                      )
                    : SizedBox(
                        height: 1,
                      ),
                widget.redbull
                    ? Column(
                        children: [
                          Text(
                            "Redbull",
                            style:
                                TextStyle(color: PRYMARY_COLOR, fontSize: 16),
                          ),
                          DropdownButton<String>(
                            value: redbullval,
                            items: redbullList
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                redbullval = newValue!;
                              });
                            },
                          ),
                        ],
                      )
                    : SizedBox(
                        height: 1,
                      ),
                widget.icecream
                    ? Column(
                        children: [
                          Text(
                            "Helado",
                            style:
                                TextStyle(color: PRYMARY_COLOR, fontSize: 16),
                          ),
                          DropdownButton<String>(
                            value: icecreamval,
                            items: icecreamList
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                icecreamval = newValue!;
                              });
                            },
                          ),
                        ],
                      )
                    : SizedBox(
                        height: 1,
                      ),
                widget.mezcal
                    ? Column(
                        children: [
                          Text(
                            "Mezcal",
                            style:
                                TextStyle(color: PRYMARY_COLOR, fontSize: 16),
                          ),
                          DropdownButton<String>(
                            value: mezcalval,
                            items: mezcalList
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                mezcalval = newValue!;
                              });
                            },
                          ),
                        ],
                      )
                    : SizedBox(
                        height: 1,
                      ),
                widget.clamato
                    ? Column(
                        children: [
                          Text(
                            "Clamato",
                            style:
                                TextStyle(color: PRYMARY_COLOR, fontSize: 16),
                          ),
                          DropdownButton<String>(
                            value: clamatoval,
                            items: clamatoList
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                clamatoval = newValue!;
                              });
                            },
                          ),
                        ],
                      )
                    : SizedBox(
                        height: 1,
                      ),
                widget.flavors
                    ? Column(
                        children: [
                          Text(
                            "Sabores",
                            style:
                                TextStyle(color: PRYMARY_COLOR, fontSize: 16),
                          ),
                          DropdownButton<String>(
                            value: flavorsval,
                            items: flavorsList
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                flavorsval = newValue!;
                              });
                            },
                          ),
                        ],
                      )
                    : SizedBox(
                        height: 1,
                      ),
              ],
            ),
          ],
        ),
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
                          addToCar(
                              widget.assetPath,
                              widget.productname,
                              widget.price,
                              _counterValue,
                              beertypeval,
                              frostyval,
                              skewerval,
                              snackval,
                              redbullval,
                              icecreamval,
                              mezcalval,
                              clamatoval,
                              flavorsval);
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
