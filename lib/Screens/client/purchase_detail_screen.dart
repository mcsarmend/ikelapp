import 'package:flutter/material.dart';
import 'package:ikelapp/screens/client/map_scren.dart';

import '../../constant.dart';

class PurchaseDetailScreen extends StatelessWidget {
  final String itemName;
  final String itemDescription;
  final String itemPrice;
  final String itemImageUrl;
  final double itemlatitude;
  final double itemlongitude;
  final bool itemtype;

  PurchaseDetailScreen({
    required this.itemName,
    required this.itemDescription,
    required this.itemPrice,
    required this.itemImageUrl,
    required this.itemlatitude,
    required this.itemlongitude,
    required this.itemtype,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalle de compra'),
        backgroundColor: PRYMARY_COLOR,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              itemName,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Precio: \$' + itemPrice,
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[600],
              ),
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              itemDescription,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          itemtype
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(PRYMARY_COLOR),
                    ),
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MapScreen(itemlatitude, itemlongitude)),
                      );
                    },
                    child: Text('Rastrear en mapa'),
                  ),
                )
              : SizedBox(
                  height: 20,
                ),
        ],
      ),
    );
  }
}
