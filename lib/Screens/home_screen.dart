import 'package:blogapp/constant.dart';
import 'package:blogapp/screens/client/beer_house_screen.dart';
import 'package:blogapp/screens/client/candys_party_screen.dart';
import 'package:blogapp/screens/client/hard_drinks_screen.dart';
import 'package:flutter/material.dart';
import 'client/pistos_mixes_screen.dart';
import 'client/healthy_fun_screeen.dart';
import 'package:blogapp/screens/client/product_page.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  ProductPage productpage = ProductPage();
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(left: 20.0),
        children: <Widget>[
          SizedBox(height: 15.0),
          TabBar(
              controller: _tabController,
              indicatorColor: PRYMARY_COLOR,
              labelColor: PRYMARY_COLOR,
              isScrollable: true,
              labelPadding: EdgeInsets.only(right: 45.0),
              unselectedLabelColor: Color(0xFFCDCDCD),
              tabs: [
                Tab(
                  child: Container(
                    child: Text('Pistos Mix',
                        style: TextStyle(
                          fontFamily: 'Varela',
                          fontSize: 11,
                        )),
                  ),
                ),
                Tab(
                  child: Text('Hard Drink',
                      style: TextStyle(
                        fontFamily: 'Varela',
                        fontSize: 11,
                      )),
                ),
                Tab(
                  child: Text('Beer House',
                      style: TextStyle(
                        fontFamily: 'Varela',
                        fontSize: 11,
                      )),
                ),
                Tab(
                  child: Text('Candys Party',
                      style: TextStyle(
                        fontFamily: 'Varela',
                        fontSize: 11,
                      )),
                ),
                Tab(
                  child: Text('Healthy Fun',
                      style: TextStyle(
                        fontFamily: 'Varela',
                        fontSize: 11,
                      )),
                ),
              ]),
          Container(
              height: MediaQuery.of(context).size.height - 50.0,
              width: double.infinity,
              child: TabBarView(controller: _tabController, children: [
                PistosMix(),
                HardDrinks(),
                BeerHouse(),
                CandysParty(),
                HealthyFun(),
              ]))
        ],
      ),
    );
  }
}
