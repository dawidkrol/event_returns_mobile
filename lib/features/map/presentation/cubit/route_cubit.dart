import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latlong2/latlong.dart';

class RouteCubit extends Cubit<List<LatLng>> {
  RouteCubit() : super([]);

  // Dodaje punkty do trasy
  void setRoute(List<LatLng> points) => emit(points);

  // Resetuje trasę
  void clearRoute() => emit([]);
}
