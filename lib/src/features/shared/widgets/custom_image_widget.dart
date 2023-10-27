import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sql_app/src/core/constants/app_colors.dart';
import 'package:sql_app/src/core/constants/svgs.dart';

class CustomImageWidget extends StatelessWidget {
  final dynamic imageUrl;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final String? placeholder;
  const CustomImageWidget(
      {super.key,
      required this.imageUrl,
      this.width,
      this.height,
      this.fit,
      this.placeholder});

  @override
  Widget build(BuildContext context) => imageUrl.isNotEmpty
      ? Image.memory(
          imageUrl,
          width: width,
          height: height,
          fit: BoxFit.cover,
        )
      : SizedBox(
          height: height,
          width: width,
          child: Container(
            color: AppColors.grey.withOpacity(.5),
            child: Center(
              child: SvgPicture.asset(
                SvgIcons.imageIcon,
                width: 19.w,
                height: 19.h,
              ),
            ),
          ),
        );
}
