import 'package:vitec_test/imports.dart';

class LocationRepository {
  static Future<LocationListModel?> getLocationsData({bool isRefresh = false}) async {
    try {
      dynamic response;
      String? storedData = VariableUtilities.pref?.getString(ConstantsUtilities.locationData);
      if (storedData == null || !isRefresh) {
        response = await API.callAPI(
          url: APIUtilities.locationList,
          type: APIType.tGet,
        );
        if (!(response['status'] ?? false) && storedData != null) {
          response = jsonDecode(storedData);
        }
      } else {
        response = jsonDecode(storedData);
      }

      if (response['status'] ?? false) {
        await VariableUtilities.pref?.setString(ConstantsUtilities.locationData, jsonEncode(response));
        return LocationListModel.fromJson(response);
      }
    } catch (e) {
      print('Error fetching locations: $e');
    }
    return null;
  }
}
