import 'package:vitec_test/imports.dart';

class CommonImageView extends StatelessWidget {
  final String url;
  final double width;
  final double height;
  final BoxFit fit;

  const CommonImageView({
    super.key,
    required this.url,
    required this.width,
    required this.height,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      imageBuilder: (context, imageProvider) => Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: fit,
          ),
        ),
      ),
      placeholder: (context, url) => Shimmer.fromColors(
        baseColor: ColorUtilities.shimmerColor1,
        highlightColor: ColorUtilities.shimmerColor2,
        child: Container(
          width: width,
          height: height,
          color: ColorUtilities.greyColor,
        ),
      ),
      errorWidget: (context, url, error) => Container(
        width: width,
        height: height,
        color: ColorUtilities.shimmerColor1,
        child: Icon(Icons.error_outline, color: ColorUtilities.errorColor),
      ),
    );
  }
}
