import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'map_state.dart';

class MapCubit extends Cubit<MapState> {
  MapCubit()
      : super(
          MapState(
            rotation: 0.0,
            center: LatLng(50.06465, 19.944979),
            zoomLevel: 13,
          ),
        );

  // Uzyskanie bieżącej lokalizacji użytkownika
  Future<void> getUserLocation(LatLng actualCenter) async {
    bool serviceEnabled;
    LocationPermission permission;

    // Sprawdzamy, czy usługa lokalizacji jest włączona
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Możesz dodać obsługę błędu, jeśli usługa jest wyłączona
      return;
    }

    // Sprawdzamy i prosimy o uprawnienia do lokalizacji
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Obsługa sytuacji, gdy użytkownik odmówił dostępu
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Obsługa sytuacji, gdy użytkownik trwale odmówił dostępu
      return;
    }

    // Pobieramy bieżącą lokalizację
    final position = await Geolocator.getCurrentPosition();
    final userLocation = LatLng(position.latitude, position.longitude);

    // Emitujemy nowy stan z aktualnym centrum mapy
    if (actualCenter != userLocation)
      emit(state.copyWith(center: actualCenter));

    emit(state.copyWith(center: userLocation));
  }

  void resetRotation(LatLng center, double zoomLevel) {
    emit(state.copyWith(
      center: center,
      zoomLevel: zoomLevel,
      rotation: 0.0,
    ));
  }

  Future<void> searchLocation(String address) async {
    try {
      final locations = await locationFromAddress(address);
      if (locations.isNotEmpty) {
        final newCenter = LatLng(locations[0].latitude, locations[0].longitude);
        emit(state.copyWith(center: newCenter));
      }
    } catch (e) {
      print("Nie można znaleźć lokalizacji: $e");
    }
  }

  void setMap(double zoomLevel, LatLng center) {
    emit(state.copyWith(zoomLevel: zoomLevel, center: center, rotation: 0.0));
  }

  void zoomIn() {
    if (state.zoomLevel < 17)
      emit(state.copyWith(zoomLevel: state.zoomLevel + 1));
  }

  void zoomOut() {
    if (state.zoomLevel - 1 > 0)
      emit(state.copyWith(zoomLevel: state.zoomLevel - 1));
  }

  void rotate(double angle) {
    emit(state.copyWith(rotation: angle));
  }
}
