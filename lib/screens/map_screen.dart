import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geojson_vi/geojson_vi.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:geocoding/geocoding.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  List<LatLng> routePoints = [];
  final MapController _mapController = MapController();
  double zoomLevel = 13.0;
  LatLng? markerLocation;
  final TextEditingController _addressController = TextEditingController();

  int _selectedIndex = 0; // Indeks wybranego ekranu

  @override
  void initState() {
    super.initState();
    loadGeoJsonData();
  }

  Future<void> loadGeoJsonData() async {
    final data = await rootBundle.loadString('assets/route.geojson');
    final Map<String, dynamic> geoJsonData = json.decode(data) as Map<String, dynamic>;

    final geojson = GeoJSONFeatureCollection.fromMap(geoJsonData);

    for (var feature in geojson.features) {
      if (feature?.geometry is GeoJSONLineString) {
        final lineString = feature!.geometry as GeoJSONLineString;

        setState(() {
          routePoints = lineString.coordinates
              .map((point) => LatLng(point[1], point[0]))
              .toList();
        });
      }
    }
  }

  void _zoomIn() {
    setState(() {
      zoomLevel += 1.0;
      _mapController.move(_mapController.center, zoomLevel);
    });
  }

  void _zoomOut() {
    setState(() {
      zoomLevel -= 1.0;
      _mapController.move(_mapController.center, zoomLevel);
    });
  }

  Future<void> _searchAddress() async {
    try {
      if (_addressController.text.isNotEmpty) {
        List<Location> locations = await locationFromAddress(_addressController.text);
        if (locations.isNotEmpty) {
          setState(() {
            markerLocation = LatLng(locations[0].latitude, locations[0].longitude);
            _mapController.move(markerLocation!, zoomLevel);
          });
        }
      }
    } catch (e) {
      print("Nie można znaleźć lokalizacji: $e");
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Ekrany, które będą wyświetlane po wybraniu odpowiednich przycisków na pasku
  List<Widget> _screens() => [
    _buildMapScreen(),
    Center(child: Text('Ekran Ustawień', style: TextStyle(fontSize: 24))),
    Center(child: Text('Ekran Profilu', style: TextStyle(fontSize: 24))),
  ];

  Widget _buildMapScreen() {
    return Stack(
      children: [
        FlutterMap(
          mapController: _mapController,
          options: MapOptions(
            center: routePoints.isNotEmpty ? routePoints[0] : LatLng(50.06465, 19.944979),
            zoom: zoomLevel,
          ),
          children: [
            TileLayer(
              urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              subdomains: ['a', 'b', 'c'],
            ),
            PolylineLayer(
              polylines: [
                Polyline(
                  points: routePoints,
                  strokeWidth: 4.0,
                  color: Colors.blue,
                ),
              ],
            ),
            MarkerLayer(
              markers: [
                if (markerLocation != null)
                  Marker(
                    point: markerLocation!,
                    builder: (ctx) => Icon(Icons.location_on, color: Colors.red, size: 40),
                  ),
              ],
            ),
          ],
        ),
        Positioned(
          top: 20,
          left: 20,
          right: 20,
          child: TextField(
            controller: _addressController,
            decoration: InputDecoration(
              hintText: 'Wpisz adres',
              border: OutlineInputBorder(),
              filled: true,
              fillColor: Colors.white,
            ),
            onSubmitted: (value) {
              _searchAddress();
            },
          ),
        ),
        Positioned(
          bottom: 20,
          right: 20,
          child: Column(
            children: [
              FloatingActionButton(
                heroTag: 'zoomIn',
                onPressed: _zoomIn,
                child: Icon(Icons.zoom_in),
              ),
              SizedBox(height: 10),
              FloatingActionButton(
                heroTag: 'zoomOut',
                onPressed: _zoomOut,
                child: Icon(Icons.zoom_out),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens(),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 6.0,
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.map),
              label: 'Mapa',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Ustawienia',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profil',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Funkcja dla przycisku "+" na środku paska
          print("Dodano nowy element!");
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
