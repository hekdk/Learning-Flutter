import 'package:favorite_places/models/place.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsScreen extends StatefulWidget {
  const MapsScreen({
    super.key,
    this.location = const PlaceLocation(
        latitude: 27.58034767881631, longitude: 77.7010708670166, address: ''),
    this.isSelecting = true,
  });

  final PlaceLocation location;
  final bool isSelecting;

  @override
  State<StatefulWidget> createState() {
    return _MapsScreenState();
  }
}

class _MapsScreenState extends State<MapsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(widget.isSelecting ? 'Pick your location' : 'Your Location'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(
            widget.location.latitude,
            widget.location.longitude,
          ),
          zoom: 16,
        ),
        markers: {
          Marker(
            markerId: MarkerId('m1'),
            position: LatLng(
              widget.location.latitude,
              widget.location.longitude,
            ),
          ),
        },
      ),
    );
  }
}
