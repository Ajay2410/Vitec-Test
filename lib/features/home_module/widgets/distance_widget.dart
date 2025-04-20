import 'package:vitec_test/imports.dart';

class DistanceWidget extends StatelessWidget {
  IconData icon;
  String text1;
  String text2;
  bool isSizeDifference;
  DistanceWidget(
      {super.key, required this.icon, required this.text1, required this.text2, this.isSizeDifference = true});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(width: 18.sp, child: Icon(icon, size: 15.sp, color: ColorUtilities.greyColor)),
        RichText(
          text: TextSpan(
            text: text1,
            style: TextStyle(fontSize: 11.sp, color: ColorUtilities.greyColor, fontWeight: FontWeight.w500),
            children: [
              TextSpan(
                text: text2,
                style: TextStyle(fontSize: isSizeDifference ? 10.sp : 11.sp),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
