import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

// class DirectionsRepository {
//   static const String _baseURL =
//       "https://maps.googleapis.com/maps/api/directions/json?";

//   Future<Directions> getRoute(
//       {@required LatLng origin, @required LatLng destination}) async {
//     var queryParameters = {
//       'origin': '${origin.latitude},${origin.longitude}',
//       'destination': '${destination.latitude},${destination.longitude}',
//       'key': 'AIzaSyDHxWHP6VbmfPW7oVvnN49agYBHqGRDI7k'
//     };
//     final uri = Uri.https('https://maps.googleapis.com',
//         '/maps/api/directions/json?', queryParameters);
//     print('uri');
//     print(uri);
//     final response = await http.get(uri);
//     if (response.statusCode == 200) {
//       print(response.body as Map<String, dynamic>);
//       return Directions.fromMap(response.body as Map<String, dynamic>);
//     }
//     return null;
//   }
// }

class DirectionsRepository {
  static const String _baseUrl =
      'https://maps.googleapis.com/maps/api/directions/json?';

  final Dio _dio;

  DirectionsRepository({Dio? dio}) : _dio = dio ?? Dio();

  Future<Directions?> getDirections({
    required LatLng origin,
    required LatLng destination,
  }) async {
    final response = await _dio.get(
      _baseUrl,
      queryParameters: {
        'origin': '${origin.latitude},${origin.longitude}',
        'destination': '${destination.latitude},${destination.longitude}',
        'key': 'AIzaSyDHxWHP6VbmfPW7oVvnN49agYBHqGRDI7k',
      },
    );

    // Check if response is successful
    if (response.statusCode == 200) {
      return Directions.fromMap(response.data);
    }
    return null;
  }
}

class Directions {
  final LatLngBounds? bounds;
  final List<PointLatLng>? polyLinePoints;
  final String? totalDistance;
  final String? totalDuration;

  const Directions({
    this.bounds,
    this.polyLinePoints,
    this.totalDistance,
    this.totalDuration,
  });

  factory Directions.fromMap(Map<String, dynamic> map) {
    print('map');
    print(map);
    // if ((map['routes'] as List).isEmpty) {
    //   return null;
    // }

    final data = Map<String, dynamic>.from(map['routes'][0]);

    final northEast = data['bounds']['northeast'];
    final southWest = data['bounds']['southwest'];

    final bounds = LatLngBounds(
      northeast: LatLng(northEast['lat'], northEast['lng']),
      southwest: LatLng(southWest['lat'], southWest['lng']),
    );

    String? distance = '';
    String? duration = '';
    if ((data['legs'] as List).isNotEmpty) {
      final leg = data['legs'][0];
      distance = leg['distance']['text'];
      duration = leg['duration']['text'];
    }

    return Directions(
      bounds: bounds,
      polyLinePoints:
          PolylinePoints().decodePolyline(data['overview_polyline']['points']),
      totalDistance: distance,
      totalDuration: duration,
    );
  }
}
