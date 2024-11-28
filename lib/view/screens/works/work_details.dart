import 'dart:html';
import 'dart:ui_web' as ui_web;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/config/themes/app_text_styles.dart';
import 'package:portfolio/core/constants/app_colors.dart';
import 'package:portfolio/core/utils/websites_laucnher/websites_launcher.dart';
import 'package:portfolio/model/work_model/work_model.dart';
import 'package:portfolio/viewmodel/works_viewmodel/work_viewmodel.dart';

class WorkDetails extends StatefulWidget {
  const WorkDetails({super.key, required this.id});
  final String id;

  @override
  State<WorkDetails> createState() => _WorkDetailsState();
}

class _WorkDetailsState extends State<WorkDetails> {
  final ScrollController scrollController = ScrollController();

  late final WorkModel _work;

  @override
  void initState() {
    var cubit = context.read<WorkViewModel>();
    _work = cubit.works.firstWhere((element) => element.id == widget.id);
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
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
            _work.title,
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
                  _work.date.year.toString(),
                  style: AppTextStyles.textButton,
                ),
              ),
              SizedBox(width: 10.w),
              Text(
                _work.type,
                style: AppTextStyles.light,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Text(
            _work.description,
            style: AppTextStyles.bodyMedium,
          ),
          SizedBox(height: 20.h),
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.light),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Image.asset(
              _work.thumbnailUrl,
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
          SizedBox(
            height: 65.h,
            child: ListView.separated(
              itemCount: _work.links.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                return Container(
                  constraints: BoxConstraints.tight(
                    Size(65.w, 65.h),
                  ),
                  clipBehavior: Clip.antiAlias,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.light),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: _work.links[index].type == LinkType.youtube
                      ? IFrameEmbedded(
                          url: _work.links[index].link,
                        )
                      : IconButton(
                          style: IconButton.styleFrom(
                            fixedSize: Size(65.w, 65.h),
                            overlayColor: Colors.transparent,
                          ),
                          onPressed: () {
                            WebsitesLauncher.launchWebsite(
                              _work.links[index].link,
                            );
                          },
                          icon: _work.links[index].type.icon,
                        ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(width: 10.w);
              },
              padding: EdgeInsets.zero,
            ),
          ),
          SizedBox(height: 20.h),

          /// what i did
          Text(
            "work_details.what_i_did".tr(),
            style: AppTextStyles.bodyLarge,
          ),
          SizedBox(height: 10.h),
          if (_work.idDid != null)
            if (_work.idDid != null)
              Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.light),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Column(
                  children: List.generate(
                    _work.idDid!.length,
                    (index) => ListTile(
                      leading: const Icon(Icons.check),
                      title: Text(
                        _work.idDid![index],
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

class IFrameEmbedded extends StatelessWidget {
  const IFrameEmbedded({super.key, required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        String viewType = 'iframeElement$url';
        IFrameElement iFrameElement = IFrameElement();
        iFrameElement.width = '100%';
        iFrameElement.height = '100%';
        iFrameElement.src = url;
        iFrameElement.style.border = 'none';
        iFrameElement.allowFullscreen = true;
        // iFrameElement.style.pointerEvents = 'none';
        viewType = 'iframeElement$url';
        ui_web.platformViewRegistry.registerViewFactory(
          viewType,
          (int viewId) => iFrameElement,
        );
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            contentPadding: EdgeInsets.zero,
            content: SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.4,
              width: MediaQuery.sizeOf(context).width * 0.4,
              child: HtmlElementView(
                viewType: viewType,
                key: UniqueKey(),
              ),
            ),
          ),
        );
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          // YouTube Thumbnail
          Image.network(
            "https://i.ytimg.com/vi/${url.split("/").last}/sddefault.jpg",
            fit: BoxFit.contain,
            height: 65.h,
            width: 65.w,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primary,
                ),
              );
            },
            errorBuilder: (context, error, stackTrace) {
              return const Center(
                child: Icon(
                  FontAwesomeIcons.youtube,
                  size: 50,
                  color: Colors.red,
                ),
              );
            },
          ),

          // Play Button Overlay
          const Center(
            child: Icon(
              FontAwesomeIcons.youtube,
              size: 50,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
