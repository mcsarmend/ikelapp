// import 'dart:async';

import 'package:flutter/cupertino.dart' show ChangeNotifier;
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:mirrowmovile/helpers/asset_to_bytes.dart';

class MapController extends ChangeNotifier {
  final Map<MarkerId, Marker> _markers = {};

  Set<Marker> get markers => _markers.values.toSet();

  final initialCameraPosition =
      const CameraPosition(target: LatLng(20.9147933, -101.2412761), zoom: 5);
}
