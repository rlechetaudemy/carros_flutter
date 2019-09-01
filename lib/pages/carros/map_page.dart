
import 'package:carros/pages/carros/carro.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  final Carro carro;

  MapPage(this.carro);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  GoogleMapController mapController;

  Carro get carro => widget.carro;

  @override
  Widget build(BuildContext context) {
    print(carro);
    print(carro.latlng);

    return Scaffold(
      appBar: AppBar(
        title: Text(carro.nome),
      ),
      body: Container(
        child: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: latlng(),
            zoom: 12,
          ),
          mapType: MapType.normal,
          onMapCreated: _onMapCreated,
          zoomGesturesEnabled: true,
          markers: Set.of(_getMarkers()),
        ),
      ),
    );
  }

  // Retorna os marcores da tela.
  List<Marker> _getMarkers() {
    return [
      Marker(
        markerId: MarkerId("1"),
        position: latlng(),
        infoWindow:
        InfoWindow(title: carro.nome, snippet: "Fábrica do ${carro.nome}"),
        onTap: () {
          print("> ${carro.nome}");
        },
      )
    ];
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
  }

  latlng() {
    return carro.latlng;
  }
}
