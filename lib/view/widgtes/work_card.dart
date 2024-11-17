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
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      color: AppColors.secondaryLight,
      margin: const EdgeInsets.all(10),
      elevation: 3,
      child: LayoutBuilder(
        builder: (context, constraints) {
          bool isWideScreen = constraints.maxWidth > 600;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _displayWorkDetails(isWideScreen),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  work.description,
                  style: AppTextStyles.bodyMedium,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 4,
                  softWrap: true,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _displayWorkDetailsMobile(
    bool isWideScreen,
    List<Widget> children,
  ) {
    return Column(
      children: [
        children[0],
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              children[1],
              Row(
                children: [
                  children[2],
                  const SizedBox(width: 10),
                  children[3],
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _displayWorkDetailsDesktop(
    bool isWideScreen,
    List<Widget> children,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        children[0],
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              children[1],
              // const SizedBox(width: 10),
              children[2],
              // const SizedBox(width: 10),
              children[3],
            ],
          ),
        ),
      ],
    );
  }

  Widget _displayWorkDetails(
    bool isWideScreen,
  ) {
    return ConditionallyWrapper(
      wrapper: (children, condition) {
        if (isWideScreen) {
          return _displayWorkDetailsDesktop(isWideScreen, children);
        } else {
          return _displayWorkDetailsMobile(isWideScreen, children);
        }
      },
      condition: isWideScreen,
      children: [
        Card(
          clipBehavior: Clip.antiAlias,
          child: Image.asset(
            work.thumbnail!,
            fit: BoxFit.fill,
            height: isWideScreen ? 200 : 250,
            width: isWideScreen ? 200 : double.infinity,
          ),
        ),
        Text(
          work.title,
          style: AppTextStyles.bodyMedium,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
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
        Text(
          work.type,
          style: AppTextStyles.light,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ],
    );
  }
}
