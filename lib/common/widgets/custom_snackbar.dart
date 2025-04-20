import 'package:vitec_test/imports.dart';

class CustomSnackBar {
  static void show({
    required String title,
    Duration duration = const Duration(seconds: 3),
    Color backgroundColor = ColorUtilities.primaryColor,
    Color textColor = ColorUtilities.whiteColor,
    bool isError = false,
  }) {
    final snackBar = SnackBar(
      content: Text(
        title,
        style: TextStyle(
          color: isError ? ColorUtilities.whiteColor : textColor,
          fontSize: 16.sp,
        ),
      ),
      backgroundColor: isError ? ColorUtilities.errorColor : backgroundColor,
      duration: duration,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      margin: EdgeInsets.all(10.sp),
      elevation: 6.0,
    );

    ScaffoldMessenger.of(navKey.currentContext!).showSnackBar(snackBar);
  }
}
