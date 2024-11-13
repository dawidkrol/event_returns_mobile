import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class UserLocationCubit extends Cubit<LatLng?> {
  UserLocationCubit() : super(null);

  Future<void> getUserLocation() async {
    try {
      final position = await Geolocator.getCurrentPosition();
      emit(LatLng(position.latitude, position.longitude));
    } catch (e) {
      emit(null); // W przypadku błędu lokalizacji
    }
  }
}


