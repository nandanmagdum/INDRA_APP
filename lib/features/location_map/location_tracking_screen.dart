import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:version1/features/location_map/services/gps_service.dart';

const String googleApiKey = "AIzaSyB2B4D4PsJahxk4_88Jc4FLpezHE6Gt8n4";

class LocationTracking extends StatefulWidget {
  const LocationTracking({super.key});
  @override
  State<LocationTracking> createState() => OrderTrackingState();
}

class OrderTrackingState extends State<LocationTracking> {
  final Location _location = Location();
  static const LatLng _source = LatLng(17.308928, 74.187170);
  static const LatLng _destination = LatLng(17.308100, 74.187999);
  LatLng _userLocation = const LatLng(17.308928, 74.187170);
  LatLng _gpsLocation = const LatLng(17.308928, 74.187170);

  List<LatLng> polyLineCoordinates = [];
  LocationData? currentLocation;

  void getCurrentLocation() async {
    final location = await _location.getLocation();
    setState(() {
      _userLocation =
          LatLng(location.latitude!.toDouble(), location.longitude!.toDouble());
    });
  }

  void getGPSLocation() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      var data = await GPSservice().getGPSLocation();
      _location.onLocationChanged.listen((location) {
        setState(() => _gpsLocation = LatLng(data["V1"], data["V2"]));
      });
    });
  }

  @override
  void initState() {
    getCurrentLocation();
    getGPSLocation();
    _location.onLocationChanged.listen((location) {
      setState(() => _userLocation = LatLng(
          location.latitude!.toDouble(), location.longitude!.toDouble()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GoogleMap(
          zoomControlsEnabled: true,
          compassEnabled: true,
          mapToolbarEnabled: true,
          initialCameraPosition:
              const CameraPosition(target: _source, zoom: 14.5),
          polylines: {
            Polyline(
                polylineId: const PolylineId("route"),
                points: polyLineCoordinates,
                color: Colors.red,
                width: 6),
          },
          markers: {
            //* live marker
            Marker(
              markerId: const MarkerId("Guard 1"),
              position: _userLocation,
              icon: BitmapDescriptor.defaultMarker,
              infoWindow: const InfoWindow(title: 'Guard 1 (123456789)'),
            ),

            //* GPS location
            Marker(
              markerId: const MarkerId("GPS"),
              position: _gpsLocation,
              infoWindow: const InfoWindow(title: 'GPS Location'),
            ),
          },
        ),
      ),
    );
  }
}
