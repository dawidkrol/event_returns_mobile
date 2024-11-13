import 'package:equatable/equatable.dart';
import 'package:latlong2/latlong.dart';

class MapState extends Equatable {
  final double rotation;
  final LatLng center;
  double zoomLevel;

  MapState({required this.rotation, required this.center, required this.zoomLevel});

  MapState copyWith({double? rotation, LatLng? center, double? zoomLevel}) {
    return MapState(
      rotation: rotation ?? this.rotation,
      center: center ?? this.center,
      zoomLevel: zoomLevel ?? this.zoomLevel,
    );
  }

  @override
  List<Object?> get props => [rotation, center, zoomLevel]; // Props do porównania
}
