import 'dart:html';
import 'dart:ui_web' as ui_web;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/config/themes/app_text_styles.dart';
import 'package:portfolio/core/constants/app_colors.dart';
import 'package:portfolio/model/work_model/work_model.dart'; // For HTML iframe

class WorkDetails extends StatefulWidget {
  const WorkDetails({super.key, required this.work});
  final WorkModel work;

  @override
  State<WorkDetails> createState() => _WorkDetailsState();
}

class _WorkDetailsState extends State<WorkDetails> {
  final ScrollController scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  Widget _iframe(String url) {
    final IFrameElement iFrameElement = IFrameElement();
    iFrameElement.width = '100%';
    iFrameElement.height = '100%';
    iFrameElement.src = url;
    iFrameElement.style.border = 'none';
    ui_web.platformViewRegistry.registerViewFactory(
      'iframeElement$url',
      (int viewId) => iFrameElement,
    );
    return HtmlElementView(
      viewType: 'iframeElement$url',
      key: UniqueKey(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        controller: scrollController,
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.sizeOf(context).width > 600
              ? MediaQuery.sizeOf(context).width * 0.12
              : 10.w,
          vertical: 5.h,
        ),
        children: [
          Text(
            widget.work.title,
            style: AppTextStyles.bodyLarge,
          ),
          SizedBox(height: 10.h),
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: Text(
                  widget.work.date.year.toString(),
                  style: AppTextStyles.textButton,
                ),
              ),
              SizedBox(width: 10.w),
              Text(
                widget.work.type,
                style: AppTextStyles.light,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Text(
            widget.work.description,
            style: AppTextStyles.bodyMedium,
          ),
          // SizedBox(height: 10.h),
          // Container(
          //   clipBehavior: Clip.antiAlias,
          //   padding: EdgeInsets.symmetric(horizontal: 5.w),
          //   decoration: BoxDecoration(
          //     border: Border.all(color: AppColors.light),
          //     borderRadius: BorderRadius.circular(10.r),
          //   ),
          //   child: Row(
          //     children: [
          //       ...List.generate(
          //         work.links.length,
          //         (index) => IconButton(
          //           onPressed: () {},
          //           icon: work.links[index].type.icon,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          SizedBox(height: 20.h),
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.light),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Image.asset(
              widget.work.thumbnailUrl,
              fit: BoxFit.contain,
              isAntiAlias: true,
              height: MediaQuery.sizeOf(context).height * 0.3,
            ),
          ),
          SizedBox(height: 20.h),
          Text(
            "work_details.preview".tr(),
            style: AppTextStyles.bodyLarge,
          ),
          SizedBox(height: 10.h),
          ListView.separated(
            itemCount: widget.work.links.length,
            shrinkWrap: true,
            itemBuilder: (_, index) {
              return Container(
                clipBehavior: Clip.antiAlias,
                height: MediaQuery.sizeOf(context).height * 0.4,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.light),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: _iframe(widget.work.links[index].link),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: 20.h);
            },
            padding: EdgeInsets.zero,
          ),
          SizedBox(height: 20.h),

          /// what i did
          Text(
            "work_details.what_i_did".tr(),
            style: AppTextStyles.bodyLarge,
          ),
          SizedBox(height: 10.h),
          if (widget.work.idDid != null)
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.light),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Column(
                children: List.generate(
                  widget.work.idDid!.length,
                  (index) => ListTile(
                    leading: const Icon(Icons.check),
                    title: Text(
                      widget.work.idDid![index],
                      style: AppTextStyles.bodyMedium,
                    ),
                  ),
                ),
              ),
            ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
