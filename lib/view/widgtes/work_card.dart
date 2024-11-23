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
        bool isWideScreen = MediaQuery.sizeOf(context).width > 600;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _displayWorkDetails(isWideScreen),
            Divider(
              thickness: 1,
              height: 50.h,
              color: const Color.fromRGBO(224, 224, 224, 1),
            ),
          ],
        );
      },
    );
  }

  Widget _displayWorkDetailsMobile(
    List<Widget> children,
  ) {
    return Column(
      children: [
        SizedBox(
          height: 230,
          width: double.infinity,
          child: children[0],
        ),
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
              const SizedBox(height: 10),
              children[4],
            ],
          ),
        ),
      ],
    );
  }

  Widget _displayWorkDetailsDesktop(
    List<Widget> children,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 180,
          width: 245,
          child: children[0],
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              children[1],
              const SizedBox(height: 10),
              Row(
                children: [
                  children[2],
                  const SizedBox(width: 10),
                  children[3],
                ],
              ),
              const SizedBox(height: 10),
              children[4],
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
          return _displayWorkDetailsDesktop(children);
        } else {
          return _displayWorkDetailsMobile(children);
        }
      },
      condition: isWideScreen,
      children: [
        Card(
          clipBehavior: Clip.antiAlias,
          child: Image.asset(
            work.thumbnailUrl,
            fit: isWideScreen ? BoxFit.fill : BoxFit.cover,
          ),
        ),
        Text(
          work.title,
          style: AppTextStyles.bodyMedium,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          decoration: BoxDecoration(
            color: AppColors.dark,
            borderRadius: BorderRadius.circular(15.r),
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            work.description,
            style: AppTextStyles.bodyMedium,
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
            softWrap: true,
          ),
        ),
      ],
    );
  }
}
