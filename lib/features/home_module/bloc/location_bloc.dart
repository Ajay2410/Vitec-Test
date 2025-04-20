import 'package:vitec_test/imports.dart';
import 'location_event.dart';
import 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  int nearbyCount = 2;
  int popularCount = 2;
  Timer? _timer;

  LocationBloc() : super(LocationInitial()) {
    on<FetchLocationData>(_onFetchLocations);
    on<LoadMoreNearbyLocations>(_onLoadMoreNearby);
    on<LoadMorePopularLocations>(_onLoadMorePopular);
  }

  Future<void> _onFetchLocations(
    FetchLocationData event,
    Emitter<LocationState> emit,
  ) async {
    emit(LocationLoading());
    try {
      /// (Ajay): enable this to load as first time after refresh
      // nearbyCount = 2;
      // popularCount = 2;
      LocationListModel? response = await LocationRepository.getLocationsData(isRefresh: event.isRefresh);

      /// (Ajay): Call api every 1 minute to update data without loader. as mentioned in doc
      if (!(_timer?.isActive ?? false)) {
        _timer = Timer.periodic(Duration(minutes: 1), (timer) async {
          try {
            LocationListModel? response = await LocationRepository.getLocationsData(isRefresh: false);
            updateDataToState(response: response, isRefresh: false, emit: emit);
          } catch (e) {}
        });
      }

      updateDataToState(response: response, isRefresh: event.isRefresh, emit: emit);
    } catch (e) {
      emit(LocationError(e.toString()));
    }
  }

  void updateDataToState(
      {required LocationListModel? response,
      required Emitter<LocationState> emit,
      bool isRefresh = false,
      bool autoUpdate = false}) {
    if (response != null && response.data != null) {
      final allNearby = response.data!.nearby ?? [];
      final allPopular = response.data!.popular ?? [];

      final initialNearby = allNearby.take(nearbyCount).toList();
      final initialPopular = allPopular.take(popularCount).toList();

      emit(LocationLoaded(
        allLocations: response,
        nearbyLocationList: initialNearby,
        popularLocationList: initialPopular,
      ));
      if (isRefresh) {
        CustomSnackBar.show(
          title: "Refreshed successfully",
          duration: Duration(seconds: 1),
        );
      }
    } else {
      if (!autoUpdate) {
        emit(LocationError('Failed to load data'));
      }
    }
  }

  void _onLoadMoreNearby(
    LoadMoreNearbyLocations event,
    Emitter<LocationState> emit,
  ) {
    final currentState = state;
    if (currentState is LocationLoaded) {
      List<LocationData> updatedNearby;
      if ((currentState.allLocations.data?.nearby?.length ?? 0) > (nearbyCount + 2)) {
        nearbyCount += 2;
        updatedNearby = currentState.allLocations.data?.nearby?.take(nearbyCount).toList() ?? [];
      } else {
        nearbyCount = currentState.allLocations.data?.nearby?.length ?? 0;
        updatedNearby = currentState.allLocations.data?.nearby ?? [];
      }

      emit(LocationLoaded(
        allLocations: currentState.allLocations,
        nearbyLocationList: updatedNearby,
        popularLocationList: currentState.popularLocationList,
      ));
    }
  }

  void _onLoadMorePopular(
    LoadMorePopularLocations event,
    Emitter<LocationState> emit,
  ) {
    final currentState = state;
    if (currentState is LocationLoaded) {
      List<LocationData> updatedPopular;
      if ((currentState.allLocations.data?.popular?.length ?? 0) > (popularCount + 2)) {
        popularCount += 2;
        updatedPopular = currentState.allLocations.data?.popular?.take(popularCount).toList() ?? [];
      } else {
        popularCount = currentState.allLocations.data?.popular?.length ?? 0;
        updatedPopular = currentState.allLocations.data?.popular ?? [];
      }

      emit(LocationLoaded(
        allLocations: currentState.allLocations,
        nearbyLocationList: currentState.nearbyLocationList,
        popularLocationList: updatedPopular,
      ));
    }
  }
}
