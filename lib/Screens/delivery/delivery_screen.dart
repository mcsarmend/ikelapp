import 'package:flutter/material.dart';
import '../../Helpers/show_directions.dart';
import '../../models/api_response.dart';
import '../../models/orders.dart';
import '../../services/user_service.dart';
import 'gps_access_screen.dart';

class delivery_screen extends StatefulWidget {
  @override
  State<delivery_screen> createState() => _delivery_screenState();
}

class _delivery_screenState extends State<delivery_screen> {
  int userId = 0;
  bool loading = true;
  late Orders orders;
  int selectedTabIndex = 0;

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
        : ShowDirections();
  }
}
