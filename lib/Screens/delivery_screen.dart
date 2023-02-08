import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/api_response.dart';
import '../models/orders.dart';
import '../services/user_service.dart';
import 'package:blogapp/Helpers/show_directions.dart';
import 'package:blogapp/Helpers/show_marker.dart';

class delivery_screen extends StatefulWidget {
  @override
  State<delivery_screen> createState() => _delivery_screenState();
}

class _delivery_screenState extends State<delivery_screen> {
  int userId = 0;
  bool loading = true;
  late Orders orders;
  int selectedTabIndex = 0;

  List<Widget> widgets = [ShowMarker(), ShowDirections()];
  void loadingorders() async {
    ApiResponse response = await getUserDetail();
    userId = await getUserId();
    ApiResponse res = await getorders(userId.toString());

    setState(() {
      orders = res.data as Orders;
      loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    loadingorders();
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : MaterialApp(
            home: Scaffold(
              appBar: AppBar(
                title: const Text('Map Launcher Demo'),
              ),
              body: widgets[selectedTabIndex],
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: selectedTabIndex,
                onTap: (newTabIndex) => setState(() {
                  selectedTabIndex = newTabIndex;
                }),
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.pin_drop),
                    label: 'Marker',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.directions),
                    label: 'Directions',
                  ),
                ],
              ),
            ),
          );
  }
}
