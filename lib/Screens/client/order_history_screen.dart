import 'package:flutter/material.dart';
import 'package:ikelapp/constant.dart';
import 'package:ikelapp/screens/client/map_scren.dart';
import 'package:ikelapp/screens/client/purchase_detail_screen.dart';

class OrderHistoryScreen extends StatefulWidget {
  @override
  _OrderHistoryScreenState createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
  List<String> orderList = [
    "Pedido 1",
    "Pedido 2",
    "Pedido 3",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Historial de Pedidos"),
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
