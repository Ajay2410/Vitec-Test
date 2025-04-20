import 'package:vitec_test/imports.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LocationBloc()..add(FetchLocationData()),
      child: Scaffold(
        backgroundColor: ColorUtilities.whiteColor,
        bottomNavigationBar: BottomAppBar(
          height: 50.sp,
          color: ColorUtilities.whiteColor,
          elevation: 1,
          child: Center(child: Icon(Icons.language, color: ColorUtilities.primaryColor)),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 70.sp, left: 20.sp, bottom: 25.sp),
              width: double.infinity,
              decoration: BoxDecoration(
                color: ColorUtilities.primaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15.r),
                  bottomRight: Radius.circular(15.r),
                ),
              ),
              child: Text(
                'Explore routes',
                style: TextStyle(
                  color: ColorUtilities.secondaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Expanded(
              child: BlocConsumer<LocationBloc, LocationState>(
                listener: (context, state) {},
                builder: (context, state) {
                  if (state is LocationInitial || state is LocationLoading) {
                    return Expanded(child: LocationShimmer());
                  } else if (state is LocationLoaded) {
                    final allLocations = state.allLocations;
                    final nearbyList = state.nearbyLocationList;
                    final popularList = state.popularLocationList;

                    return RefreshIndicator(
                      onRefresh: () async {
                        await Future.delayed(Duration(seconds: 1));
                        context.read<LocationBloc>().add(FetchLocationData(isRefresh: true));
                      },
                      child: SingleChildScrollView(
                        physics: AlwaysScrollableScrollPhysics(),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20.sp),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 25.sp),
                              RichText(
                                text: TextSpan(
                                  text: 'Routes ',
                                  style: TextStyle(
                                      color: ColorUtilities.blackColor, fontSize: 16.sp, fontWeight: FontWeight.bold),
                                  children: [
                                    TextSpan(
                                      text: 'nearby',
                                      style: TextStyle(color: ColorUtilities.primaryColor),
                                    ),
                                  ],
                                ),
                              ),
                              ListView.separated(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                padding: EdgeInsets.symmetric(vertical: 15.sp),
                                separatorBuilder: (context, index) => SizedBox(height: 15.sp),
                                itemCount: nearbyList.length,
                                itemBuilder: (context, index) {
                                  return LocationDataView(
                                    isLast: index == nearbyList.length - 1 &&
                                        allLocations.data?.nearby?.length != nearbyList.length,
                                    locationData: nearbyList[index],
                                    onPress: () {
                                      context.read<LocationBloc>().add(LoadMoreNearbyLocations());
                                    },
                                  );
                                },
                              ),
                              SizedBox(
                                  height: allLocations.data?.nearby?.length == nearbyList.length
                                      ? 10.sp
                                      : 0.sp), // if routes list have no more data then give height 10
                              RichText(
                                text: TextSpan(
                                  text: 'Favorite ',
                                  style: TextStyle(
                                      color: ColorUtilities.primaryColor, fontSize: 16.sp, fontWeight: FontWeight.bold),
                                  children: [
                                    TextSpan(
                                      text: 'Tours',
                                      style: TextStyle(color: ColorUtilities.blackColor),
                                    ),
                                  ],
                                ),
                              ),
                              ListView.separated(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                padding: EdgeInsets.symmetric(vertical: 15.sp),
                                separatorBuilder: (context, index) => SizedBox(height: 15.sp),
                                itemCount: popularList.length,
                                itemBuilder: (context, index) {
                                  return LocationDataView(
                                    isLast: index == popularList.length - 1 &&
                                        allLocations.data?.popular?.length != popularList.length,
                                    locationData: popularList[index],
                                    onPress: () {
                                      context.read<LocationBloc>().add(LoadMorePopularLocations());
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  } else {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Failed to load Data"),
                          SizedBox(height: 20.sp),
                          CommonTextButton(
                              title: "Try again",
                              onPress: () {
                                context.read<LocationBloc>().add(FetchLocationData());
                              }),
                        ],
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
