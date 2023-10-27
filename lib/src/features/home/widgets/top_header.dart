import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sql_app/src/core/constants/app_colors.dart';
import 'package:sql_app/src/core/constants/app_text_styles.dart';

class HomeTopHeader extends StatelessWidget {
  const HomeTopHeader({super.key});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'TrimartSQl',
              style: AppTextStyles.displayOne
                  .copyWith(color: AppColors.primaryColor),
            ),
            Text(
              'Feel the difference',
              style: AppTextStyles.bodyOnePoppins
                  .copyWith(color: AppColors.grey, fontSize: 12.sp),
            )
          ],
        ),
      );
}
