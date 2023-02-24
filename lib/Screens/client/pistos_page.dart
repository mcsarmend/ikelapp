import 'package:flutter/material.dart';
import 'package:ikelapp/screens/client/pistos_detail.dart';
import 'package:ikelapp/screens/client/product_detail.dart';
import '../../constant.dart';

class PistosPage {
  @override
  Widget build(
      String name,
      String price,
      String imgPath,
      bool added,
      bool isFavorite,
      String detalle,
      bool frosty,
      bool beertype,
      bool skewer,
      bool snack,
      bool redbull,
      bool icecream,
      bool mezcal,
      bool clamato,
      bool flavors,
      context) {
    return Padding(
        padding: EdgeInsets.only(top: 4.0, bottom: 4.0, left: 4.0, right: 4.0),
        child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => PistosDetail(
                        assetPath: imgPath,
                        price: price,
                        productname: name,
                        detail: detalle,
                        frosty: frosty,
                        beertype: beertype,
                        skewer: skewer,
                        snack: snack,
                        redbull: redbull,
                        icecream: icecream,
                        mezcal: mezcal,
                        clamato: clamato,
                        flavors: flavors,
                      )));
            },
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 3.0,
                          blurRadius: 5.0)
                    ],
                    color: Colors.white),
                child: Column(children: [
                  Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            isFavorite
                                ? Icon(Icons.favorite, color: Color(0xFFEF7532))
                                : Icon(Icons.favorite_border,
                                    color: Color(0xFFEF7532))
                          ])),
                  Hero(
                      tag: imgPath,
                      child: Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(imgPath),
                                  fit: BoxFit.contain)))),
                  SizedBox(height: 7.0),
                  Text(price,
                      style: TextStyle(
                          color: PRYMARY_COLOR,
                          fontFamily: 'Varela',
                          fontSize: 14.0)),
                  Text(name,
                      style: TextStyle(
                          color: Color(0xFF575E67),
                          fontFamily: 'Varela',
                          fontSize: 14.0)),
                  Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Container(color: Color(0xFFEBEBEB), height: 1.0)),
                ]))));
  }
}
