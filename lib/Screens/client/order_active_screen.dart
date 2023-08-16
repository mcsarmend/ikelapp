import 'package:flutter/material.dart';
import 'package:ikelapp/screens/client/purchase_detail_screen.dart';
import '../../models/api_response.dart';
import '../../services/user_service.dart';

class OrderActiveScreen extends StatefulWidget {
  @override
  _OrderActiveScreenState createState() => _OrderActiveScreenState();
}

class _OrderActiveScreenState extends State<OrderActiveScreen> {
  List<String> orderList = [];
  List<String> orderCost = [];
  var loading = true;
  var userId = 0;
  var orders;
  var dat;
  
 List<Map<String, dynamic>> locations = [];

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
        if (element["status"] == 1) {
          orderList.add(element["internal_id"]);
          orderCost.add(element["cost"]);
            Map<String, dynamic> newLocation = {
              "latitude":element["current_latitude"],
              "longitude": element["current_longitude"],
            };

          locations.add(newLocation);
        }
      }
      print(locations);
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
                                    itemtype: true,
                                    itemlatitude: locations[index]["latitude"],
                                    itemlongitude: locations[index]["longitude"]
                                  )),
                        );
                      },
                    ),
            ),
    );
  }
}
