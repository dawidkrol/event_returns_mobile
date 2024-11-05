import 'package:event_returns_mobile/app/app.dart';
import 'package:event_returns_mobile/bootstrap.dart';
import 'package:event_returns_mobile/screens/map_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geojson_vi/geojson_vi.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MapScreen(),
    );
  }
}


