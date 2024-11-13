import 'package:event_returns_mobile/core/theme/theme_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../cubit/map_cubit.dart';
import '../cubit/map_state.dart';
import '../cubit/search_bar_cubit.dart';
import '../cubit/route_cubit.dart';

class MapWidget extends StatelessWidget {
  const MapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final MapController mapController = MapController();
    final double screenWidth = MediaQuery.of(context).size.width;
    final double topPadding = MediaQuery.of(context).padding.top;


    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SearchBarCubit()),
        BlocProvider(create: (_) => RouteCubit()), // Dodajemy RouteCubit
      ],
      child: Stack(
        children: [
          BlocListener<MapCubit, MapState>(
            listener: (context, state) {
              mapController.move(state.center, state.zoomLevel);
              mapController.rotate(state.rotation);
            },
            child: FlutterMap(
              mapController: mapController,
              options: MapOptions(
                center: LatLng(50.06465, 19.944979),
                zoom: 13.0,
                rotation: 0.0,
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                  subdomains: const ['a', 'b', 'c'],
                ),
                // Dodajemy PolylineLayer dla trasy
                BlocBuilder<RouteCubit, List<LatLng>>(
                  builder: (context, routePoints) {
                    return PolylineLayer(
                      polylines: [
                        if (routePoints.isNotEmpty)
                          Polyline(
                            points: routePoints,
                            strokeWidth: 4,
                            color: Colors.blue,
                          ),
                      ],
                    );
                  },
                ),
                BlocBuilder<MapCubit, MapState>(
                  builder: (context, state) {
                    return MarkerLayer(
                      markers: [
                        Marker(
                          point: state.center,
                          builder: (ctx) => Icon(
                            Icons.my_location,
                            color: Colors.red,
                            size: 30,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
          // Animated Search Field
          Positioned(
            top: topPadding + 10, // Umieszczone na górze z uwzględnieniem notcha
            right: 10,
            child: BlocBuilder<SearchBarCubit, bool>(
              builder: (context, isExpanded) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: isExpanded ? screenWidth - 20 : 50,
                  // Rozszerza się do 80%
                  height: 50,
                  decoration: BoxDecoration(
                    color: context.colorPalette.background,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: () {
                          context.read<SearchBarCubit>().toggle(); // Przełącza stan
                        },
                      ),
                      if (isExpanded)
                        Expanded(
                          child: TextField(
                            decoration: const InputDecoration(
                              hintText: 'Search',
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(horizontal: 10),
                            ),
                            onSubmitted: (value) {
                              context.read<MapCubit>().searchLocation(value);
                            },
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: Column(
              children: [
                FloatingActionButton(
                  mini: true,
                  backgroundColor: context.colorPalette.background,
                  onPressed: () {
                    context.read<MapCubit>().zoomIn();
                  },
                  child: const Icon(Icons.add),
                ),
                SizedBox(height: 10),
                FloatingActionButton(
                  mini: true,
                  backgroundColor: context.colorPalette.background,
                  onPressed: () {
                    context.read<MapCubit>().zoomOut();
                  },
                  child: const Icon(Icons.remove),
                ),
                SizedBox(height: 10),
                FloatingActionButton(
                  mini: true,
                  backgroundColor: context.colorPalette.background,
                  onPressed: () {
                    // context.read<MapCubit>().resetRotation(mapController.center, mapController.zoom);
                    context.read<MapCubit>().getUserLocation(mapController.center);
                  },
                  child: const Icon(Icons.gps_not_fixed),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
