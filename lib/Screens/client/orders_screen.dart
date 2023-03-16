import 'package:ikelapp/constant.dart';
import 'package:flutter/material.dart';
import 'package:ikelapp/screens/client/product_page.dart';

import 'order_active_screen.dart';
import 'order_history_screen.dart';

class OrderScreen extends StatefulWidget {
  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  ProductPage productpage = ProductPage();
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(left: 20.0),
        children: <Widget>[
          SizedBox(height: 20.0),
          Center(
            child: TabBar(
                controller: _tabController,
                indicatorColor: PRYMARY_COLOR,
                labelColor: PRYMARY_COLOR,
                isScrollable: true,
                labelPadding: EdgeInsets.only(right: 35.0),
                unselectedLabelColor: SECONDARY_COLOR,
                tabs: [
                  Tab(
                    child: Container(
                      child: Text('Activos',
                          style: TextStyle(
                            fontFamily: 'Varela',
                            fontSize: 22,
                          )),
                    ),
                  ),
                  Tab(
                    child: Container(
                      child: Text('Historico',
                          style: TextStyle(
                            fontFamily: 'Varela',
                            fontSize: 22,
                          )),
                    ),
                  ),
                ]),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
              height: MediaQuery.of(context).size.height - 250.0,
              width: double.infinity,
              child: TabBarView(controller: _tabController, children: [
                OrderActiveScreen(),
                OrderHistoryScreen(),
              ]))
        ],
      ),
    );
  }
}
