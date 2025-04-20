import 'package:vitec_test/imports.dart';

class CommonTextButton extends StatelessWidget {
  final String title;
  final VoidCallback onPress;

  const CommonTextButton({
    super.key,
    required this.title,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 18.sp, vertical: 8.sp),
        decoration: BoxDecoration(
          border: Border.all(color: ColorUtilities.primaryColor),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: ColorUtilities.primaryColor,
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
