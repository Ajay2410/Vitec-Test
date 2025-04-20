abstract class LocationEvent {}

class FetchLocationData extends LocationEvent {
  final bool isRefresh;

  FetchLocationData({this.isRefresh = false});
}

class LoadMoreNearbyLocations extends LocationEvent {}

class LoadMorePopularLocations extends LocationEvent {}

class RefreshLocations extends LocationEvent {}
