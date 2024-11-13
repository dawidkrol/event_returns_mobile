import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:latlong2/latlong.dart';

class SearchLocationCubit extends Cubit<LatLng?> {
  SearchLocationCubit() : super(null);

  Future<void> searchLocation(String address) async {
    try {
      final locations = await locationFromAddress(address);
      if (locations.isNotEmpty) {
        emit(LatLng(locations[0].latitude, locations[0].longitude));
      } else {
        emit(null);
      }
    } catch (e) {
      emit(null); // W przypadku błędu w wyszukiwaniu
    }
  }
}
