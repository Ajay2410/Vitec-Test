import 'package:vitec_test/imports.dart';

class LocationShimmer extends StatelessWidget {
  const LocationShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(vertical: 20.sp, horizontal: 20.sp),
      itemCount: 10,
      separatorBuilder: (_, __) => SizedBox(height: 15.sp),
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: ColorUtilities.shimmerColor1,
          highlightColor: ColorUtilities.shimmerColor2,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 5.sp, horizontal: 10.sp),
            decoration: BoxDecoration(
              color: ColorUtilities.whiteColor,
              boxShadow: [BoxShadow(color: ColorUtilities.black12Color, blurRadius: 4)],
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: SizedBox(
              width: 80.sp,
              height: 80.sp,
            ),
          ),
        );
      },
    );
  }
}
