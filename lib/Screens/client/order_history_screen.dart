import 'package:flutter/material.dart';
import 'package:ikelapp/constant.dart';
import 'package:ikelapp/screens/client/map_scren.dart';
import 'package:ikelapp/screens/client/purchase_detail_screen.dart';
import '../../models/orders.dart';
import '../../models/api_response.dart';
import '../../services/user_service.dart';

class OrderHistoryScreen extends StatefulWidget {
  @override
  _OrderHistoryScreenState createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
  List<String> orderList = [];
  List<String> orderCost = [];
  var loading = true;
  var userId = 0;
  var orders;
  var dat;
  @override
  void initState() {
    super.initState();
    loadingorders();
  }

  void loadingorders() async {
    userId = await getUserId();

    ApiResponse res = await getorders(userId.toString());

    dat = (res.data as Map)['orders'];

    setState(() {
      for (var element in dat) {
        orderList.add(element["internal_id"]);
        orderCost.add(element["cost"]);
      }
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
/*       appBar: AppBar(
        title: Text("Pedidos Activos"),
        backgroundColor: PRYMARY_COLOR,
      ), */
      body: loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: orderList.length,
              itemBuilder: (context, index) => loading
                  ? CircularProgressIndicator()
                  : ListTile(
                      leading: Icon(Icons.shopping_cart),
                      title: Text(orderList[index]),
                      subtitle: Text("Detalles del pedido"),
                      trailing: Text("\$" + orderCost[index]),
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PurchaseDetailScreen(
                                    itemName: dat[index]["internal_id"],
                                    itemDescription: dat[index]
                                        ["order_description"],
                                    itemPrice: dat[index]["cost"],
                                    itemImageUrl:
                                        'assets/imgs/Beerhouse/Barrilito355ml.png',
                                    itemtype: false,
                                  )),
                        );
                      },
                    ),
            ),
    );
  }
}
