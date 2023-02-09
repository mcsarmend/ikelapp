import 'package:blogapp/models/user.dart';
import 'package:flutter/material.dart';

class Pedidos extends StatefulWidget {
  @override
  _PedidosState createState() => _PedidosState();
}

class _PedidosState extends State<Pedidos> {
  User? user;
  User? email;
  bool loading = true;
  int userId = 0;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController txtNameController = TextEditingController();
  TextEditingController txtEmailController = TextEditingController();
  String location = "Sin ubicación";

  @override
  void initState() {
    super.initState();
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Padding(
            padding: EdgeInsets.only(top: 40, left: 40, right: 40),
            child: ListView(
              children: [
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Pedidos Screen")
              ],
            ),
          );
  }
}
