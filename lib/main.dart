import 'package:flutter/services.dart';
import 'package:ikelapp/screens/home.dart';
import 'package:flutter/material.dart';

import 'Screens/loading.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized(); // Asegúrate de inicializar los widgets de Flutter
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
     runApp(App());
  });
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Loading(),
    );
  }
}
