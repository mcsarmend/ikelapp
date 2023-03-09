import 'package:flutter/material.dart';
import 'package:ikelapp/constant.dart';
import 'package:ikelapp/screens/client/map_scren.dart';
import 'package:ikelapp/screens/client/purchase_detail_screen.dart';

class OrderActiveScreen extends StatefulWidget {
  @override
  _OrderActiveScreenState createState() => _OrderActiveScreenState();
}

class _OrderActiveScreenState extends State<OrderActiveScreen> {
  List<String> orderList = [
    "Pedido 1",
    "Pedido 2",
    "Pedido 3",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pedidos Activos"),
        backgroundColor: PRYMARY_COLOR,
      ),
      body: ListView.builder(
        itemCount: orderList.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text(orderList[index]),
            subtitle: Text("Detalles del pedido"),
            trailing: Text("\$50.00"),
            onTap: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PurchaseDetailScreen(
                        itemName: "itemName",
                        itemDescription: 'ItemDescription',
                        itemPrice: 92.5,
                        itemImageUrl:
                            'assets/imgs/Beerhouse/Barrilito355ml.png')),
              );
            },
          );
        },
      ),
    );
  }
}
