import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/config/themes/app_text_styles.dart';
import 'package:portfolio/core/constants/app_colors.dart';
import 'package:portfolio/model/work_model/work_model.dart';
import 'package:portfolio/view/widgtes/conditionally_wrapper.dart';

class WorkCard extends StatelessWidget {
  const WorkCard({super.key, required this.work});
  final WorkModel work;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isWideScreen = constraints.maxWidth > 600;
        return Padding(
          padding: const EdgeInsets.all(10),
          child: isWideScreen
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ..._displayWorkDetails(isWideScreen),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ..._displayWorkDetails(isWideScreen),
                  ],
                ),
        );
      },
    );
  }

  List<Widget> _displayWorkDetails(
    bool isWideScreen,
  ) {
    return [
      Card(
        clipBehavior: Clip.antiAlias,
        child: Image.asset(
          work.thumbnail!,
          fit: BoxFit.fill,
          height: isWideScreen ? 200 : 250,
          width: isWideScreen ? 200 : double.infinity,
        ),
      ),
      ConditionallyWrapper(
        condition: isWideScreen,
        wrapper: (child) => Expanded(
          child: child,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              work.title,
              style: AppTextStyles.bodyMedium,
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  decoration: BoxDecoration(
                    color: AppColors.dark,
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  child: Text(
                    work.date.year.toString(),
                    style: AppTextStyles.textButton,
                  ),
                ),
                SizedBox(width: 10.w),
                Text(
                  work.type,
                  style: AppTextStyles.light,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              work.description,
              style: AppTextStyles.bodySmall,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ],
        ),
      ),
    ];
  }
}
