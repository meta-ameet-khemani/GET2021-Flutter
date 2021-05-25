import 'package:flutter/material.dart';
import 'directions_repository.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyGoogleMapsDemo extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyGoogleMapsDemo> {
  GoogleMapController _googleMapController;
  MapType _currentMapType = MapType.normal;
  IconData _icon = Icons.all_out;
  int index = 1;
  final _center = LatLng(26.238947, 73.024307);
  Marker _origin, _destination;
  Directions info;

  final Set<Marker> _markers = {
    Marker(
        markerId: MarkerId('0'),
        position: LatLng(26.20761623695986, 72.95865652476884),
        infoWindow: InfoWindow(
          title: 'Home',
          snippet: 'Home Sweet Home',
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen))
  };

  @override
  Widget build(BuildContext context) {
    if (_origin != null) _markers.add(_origin);
    if (_destination != null) _markers.add(_destination);
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Maps'),
        centerTitle: true,
        actions: [
          _origin != null
              ? IconButton(
                  icon: Icon(Icons.star_outline),
                  onPressed: () {
                    _googleMapController.animateCamera(
                      CameraUpdate.newCameraPosition(
                        CameraPosition(
                          target: _origin.position,
                          zoom: 35,
                          tilt: 50,
                        ),
                      ),
                    );
                  },
                )
              : Text(''),
          _destination != null
              ? IconButton(
                  icon: Icon(Icons.enhanced_encryption),
                  onPressed: () {
                    _googleMapController.animateCamera(
                      CameraUpdate.newCameraPosition(
                        CameraPosition(
                          target: _destination.position,
                          zoom: 35,
                          tilt: 50,
                        ),
                      ),
                    );
                  },
                )
              : Text(''),
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              _googleMapController.animateCamera(
                CameraUpdate.newCameraPosition(
                  CameraPosition(
                    target: LatLng(26.20761623695986, 72.95865652476884),
                    tilt: 50,
                    zoom: 20,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          GoogleMap(
            // myLocationButtonEnabled: false,
            // zoomControlsEnabled: true,
            mapType: _currentMapType,
            onMapCreated: _mapController,
            onCameraMove: (position) => print(position),
            markers: _markers,
            polylines: {
              if (info != null)
                Polyline(
                  polylineId: PolylineId('overview_polyline'),
                  color: Colors.red,
                  width: 5,
                  points: info.polyLinePoints
                      .map((e) => LatLng(e.latitude, e.longitude))
                      .toList(),
                ),
            },
            onLongPress: (position) => _addPositions(position),
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 12,
            ),
          ),
          if (info != null)
            Positioned(
              top: 20.0,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 6.0,
                  horizontal: 12.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.yellowAccent,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 2),
                      blurRadius: 6.0,
                    )
                  ],
                ),
                child: Text(
                  '${info.totalDistance}, ${info.totalDuration}',
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 90),
        child: FloatingActionButton(
          onPressed: () {
            // _changeMapType
            _googleMapController.animateCamera(
              info != null
                  ? CameraUpdate.newLatLngBounds(info.bounds, 100)
                  : CameraUpdate.newCameraPosition(
                      CameraPosition(
                        target: _center,
                        zoom: 12,
                      ),
                    ),
            );
          },
          child: Icon(_icon),
        ),
      ),
    );
  }

  void _mapController(GoogleMapController googleMapController) {
    _googleMapController = googleMapController;
  }

  void _changeMapType() {
    index++;
    int position = index % 4;
    print(position);
    switch (position) {
      case 0:
        setState(() {
          _currentMapType = MapType.hybrid;
          _icon = Icons.all_out;
        });
        break;
      case 1:
        setState(() {
          _currentMapType = MapType.normal;
          _icon = Icons.auto_fix_normal;
        });
        break;
      case 2:
        setState(() {
          _currentMapType = MapType.satellite;
          _icon = Icons.satellite;
        });
        break;
      case 3:
        setState(() {
          _currentMapType = MapType.terrain;
          _icon = Icons.terrain;
        });
        break;
    }
  }

  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  void _addPositions(LatLng position) async {
    if ((_origin == null || (_origin != null && _destination != null))) {
      setState(() {
        _origin = Marker(
          markerId: MarkerId('origin'),
          infoWindow: InfoWindow(
            title: 'Origin',
            snippet: 'Starting Position',
          ),
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
          position: position,
        );
        _destination = null;
      });
      info = null;
    } else {
      setState(() {
        _destination = Marker(
          markerId: MarkerId('destination'),
          infoWindow: InfoWindow(
            title: 'Destination',
            snippet: 'Destination Position',
          ),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
          position: position,
        );
      });

      final directions = await DirectionsRepository().getDirections(
          origin: _origin.position, destination: _destination.position);
      print('directions');
      print(directions);
      setState(() {
        info = directions;
      });
    }
  }
}
