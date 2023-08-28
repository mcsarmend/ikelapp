import 'package:ikelapp/constant.dart';
import 'package:ikelapp/models/api_response.dart';
import 'package:ikelapp/screens/delivery/delivery_user_screen.dart';
import 'package:ikelapp/screens/home.dart';
import 'package:ikelapp/services/user_service.dart';
import 'package:flutter/material.dart';

import '../models/user.dart';
import 'login/login.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void _loadUserInfo() async {
    String token = await getToken();
    // if (token == '') {
    //   ApiResponse response = await getUserDetail();
    //   Navigator.of(context).pushAndRemoveUntil(
    //       MaterialPageRoute(builder: (context) => Login()), (route) => false);
    // } else {
      ApiResponse response = await getUserDetail();
      if (response.error == null) {
        var n = response.data as User;
        if (n.type == '1') {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => Home()),
              (route) => false);
        } else {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => delivery_user_screen()),
              (route) => false);
        }
      } else if (response.error == unauthorized) {
        Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => Home()),
              (route) => false);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('${response.error}'),
        ));
      }
    // }
  }

  @override
  void initState() {
    _loadUserInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      child: Center(child: CircularProgressIndicator()),
    );
  }
}
