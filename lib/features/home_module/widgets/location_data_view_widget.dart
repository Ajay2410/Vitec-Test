import 'package:vitec_test/imports.dart';

class LocationDataView extends StatelessWidget {
  bool isLast;
  VoidCallback onPress;
  LocationData locationData;
  LocationDataView({super.key, this.isLast = false, required this.onPress, required this.locationData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 5.sp, horizontal: 10.sp),
          decoration: BoxDecoration(
            color: ColorUtilities.whiteColor,

            /// (Ajay): remove this line to remove shadow
            boxShadow: [BoxShadow(color: ColorUtilities.black12Color, blurRadius: 4)],
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Row(
            children: [
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: CommonImageView(
                      url: locationData.coverImage ?? "-", height: 80.sp, width: 80.sp, fit: BoxFit.cover)),
              SizedBox(width: 15.sp),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            (locationData.name ?? "").isEmpty ? "-" : locationData.name!,
                            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.sp),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4.sp),
                    Row(
                      children: [
                        Container(
                          width: 22.sp,
                          height: 22.sp,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,

                            /// (Ajay): can take color in ColorUtilities for this, for demo i have used opacity
                            color: ColorUtilities.greyColor.withOpacity(0.3),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.directions_bike,
                              color: ColorUtilities.greyColor,
                              size: 15.sp,
                            ),
                          ),
                        ),
                        SizedBox(width: 5.sp),
                        Expanded(
                          child: Text(
                            (locationData.location ?? "").isEmpty ? "-" : locationData.location!,
                            style: TextStyle(
                                fontSize: 12.sp, color: ColorUtilities.greyColor, fontWeight: FontWeight.w500),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Container(
                          width: 24.sp,
                          height: 24.sp,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: ColorUtilities.greyColor.withOpacity(0.3),
                          ),
                          clipBehavior: Clip.hardEdge,
                          child:

                              /// (Ajay): Show image from locationData once available
                              CommonImageView(
                                  url: "https://flagcdn.com/w40/de.png",
                                  height: 24.sp,
                                  width: 24.sp,
                                  fit: BoxFit.cover),
                        ),
                        SizedBox(width: 6.sp),
                        SizedBox(
                          height: 10.sp,
                          child: VerticalDivider(
                            color: ColorUtilities.greyColor.withOpacity(0.5),
                            thickness: 1,
                            width: 1,
                          ),
                        ),
                        SizedBox(width: 4.sp),
                        Icon(Icons.star, size: 14, color: ColorUtilities.yellowColor),
                        SizedBox(width: 1.sp),
                        Text('${locationData.averageRating ?? "-"}/5',
                            style: TextStyle(
                                fontSize: 12.sp, color: ColorUtilities.greyColor, fontWeight: FontWeight.w500)),
                      ],
                    ),
                    SizedBox(
                      width: double.maxFinite,
                      child: Divider(
                        color: ColorUtilities.greyColor.withOpacity(0.5),
                        thickness: 0.5,
                        height: 10.sp,
                      ),
                    ),
                    Row(
                      children: [
                        Flexible(
                          flex: 4,
                          child: DistanceWidget(
                              icon: Icons.access_time_sharp, text1: (locationData.min ?? 0).toString(), text2: 'm'),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 6.sp),
                          child: SizedBox(
                            height: 18.sp,
                            child: VerticalDivider(
                              color: ColorUtilities.greyColor.withOpacity(0.5),
                              thickness: 1,
                              width: 1,
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 4,
                          child: DistanceWidget(
                              icon: Icons.account_balance_wallet_outlined,
                              text1: '\$',
                              text2: (locationData.price ?? 0).toString(),
                              isSizeDifference: false),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 6.sp),
                          child: SizedBox(
                            height: 18.sp,
                            child: VerticalDivider(
                              color: ColorUtilities.greyColor.withOpacity(0.5),
                              thickness: 1,
                              width: 1,
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 5,
                          child: DistanceWidget(
                              icon: Icons.swap_horiz, text1: (locationData.distance ?? 0).toString(), text2: 'km'),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(width: 5.sp),
            ],
          ),
        ),
        if (isLast)
          Padding(
            padding: EdgeInsets.only(top: 15.sp),
            child: Center(
              child: CommonTextButton(
                  title: "Load More",
                  onPress: () {
                    onPress();
                  }),
            ),
          ),
      ],
    );
  }
}
