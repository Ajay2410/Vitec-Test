import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:vitec_test/imports.dart';

enum APIType {
  tPost,
  tGet,
  tPut,
  tPatch,
}

class API {
  static Future<dynamic> callAPI({
    required String url,
    required APIType type,
    Map<String, dynamic>? body,
    Map<String, String>? header,
  }) async {
    try {
      http.Response apiResponse;
      // String apiBody = jsonEncode(body);
      dynamic apiBody = body;

      Map<String, String> appHeader = {};

      String token = VariableUtilities.pref?.getString(ConstantsUtilities.token) ?? VariableUtilities.tempToken;
      debugPrint("tokrn ====>?? $token");
      if (token != "") {
        appHeader.addAll(
          {
            'Accept': 'application/json',
            "Authorization": 'Basic $token',
          },
        );
      }

      /// dynamically passed parameters.
      if (header != null) {
        appHeader.addAll(header);
      }
      debugPrint('URL ==>$url');
      debugPrint('TYPE ==>$type');
      debugPrint('BODY ==>$body');
      debugPrint('HEADER ==>$appHeader');

      /// [POST CALL]
      if (type == APIType.tPost) {
        assert(body != null);
        appHeader.addAll({"Accept": "application/json"});

        /// Api call
        apiResponse = await http.post(Uri.parse(url), body: apiBody, headers: appHeader);
      }

      /// [GET CALL]
      else if (type == APIType.tGet) {
        /// Api call.
        apiResponse = await http.get(
          Uri.parse(url),
          headers: appHeader,
        );
      }

      /// [PATCH CALL]
      else if (type == APIType.tPatch) {
        /// Api call.
        apiResponse = await http.patch(Uri.parse(url), headers: appHeader, body: body);
      } else {
        /// Api call.
        apiResponse = await http.put(
          Uri.parse(url),
          body: apiBody,
          headers: appHeader,
        );
      }

      log(apiResponse.body);

      Map<String, dynamic> response = jsonDecode(apiResponse.body);

      switch (apiResponse.statusCode) {
        case 200:
          return response;
        case 422:
          return response;
        case 500: // server error !
          /// when the error is from server side then it manage the response and show the snack accordingly.

          CustomSnackBar.show(title: response["message"].toString());
          return response;

        case 404: // page not found !

          /// when the page called from the application is not found then it show the message.
          CustomSnackBar.show(title: response["message"].toString());
          return response;
        case 400: // bad request !

          /// when the request is made with some mistakes or bad or improper parameters this part will execute.
          CustomSnackBar.show(title: response["message"].toString());
          return response;

        case 401:

          /// when there are some authorization error.

          if (response["message"].toString() == "Unauthenticated.") {
            VariableUtilities.pref?.clear();
            // Navigate to login screen
          }
          return response;

        default:

          /// when there is some other errors like server, page-not-found, bad connection then it will return null.

          CustomSnackBar.show(title: "Failed, Please try again later".toString());

          return response;
      }
    } catch (e) {
      return null;
    }
  }
}
