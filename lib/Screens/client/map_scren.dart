import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ikelapp/constant.dart';

class MapScreen extends StatefulWidget {
  final double itemlatitude;
  final double itemlongitude;

  const MapScreen(this.itemlatitude, this.itemlongitude, {Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late LatLng _initialPosition;
  GoogleMapController? _mapController;
  final Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _initialPosition = LatLng(widget.itemlatitude, widget.itemlongitude);
    print(widget.itemlatitude);
    print(widget.itemlongitude);
    _getMarkers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seguimiento'),
        backgroundColor: PRYMARY_COLOR,
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: _initialPosition,
          zoom: 12,
        ),
        onMapCreated: (controller) => _mapController = controller,
        markers: _markers,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => refresh(),
        child: Icon(Icons.refresh_sharp),
      ),
    );
  }

  void _getMarkers() {
    final marker = Marker(
      markerId: MarkerId(_markers.length.toString()),
      position: _initialPosition,
      infoWindow: InfoWindow(title: 'New Marker', snippet: 'Example snippet'),
    );
    setState(() {
      _markers.add(marker);
    });
  }

  void refresh() {}
}
