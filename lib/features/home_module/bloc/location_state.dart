import 'package:vitec_test/imports.dart';

abstract class LocationState {}

class LocationInitial extends LocationState {}

class LocationLoading extends LocationState {}

class LocationLoaded extends LocationState {
  final LocationListModel allLocations;
  final List<LocationData> nearbyLocationList;
  final List<LocationData> popularLocationList;

  LocationLoaded({
    required this.allLocations,
    required this.nearbyLocationList,
    required this.popularLocationList,
  });
}

class LocationError extends LocationState {
  final String message;

  LocationError(this.message);
}
