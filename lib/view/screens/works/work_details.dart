import 'dart:html';
import 'dart:ui_web' as ui_web;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/config/themes/app_text_styles.dart';
import 'package:portfolio/core/constants/app_colors.dart';
import 'package:portfolio/model/work_model/work_model.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class WorkDetails extends StatefulWidget {
  const WorkDetails({super.key, required this.work});
  final WorkModel work;

  @override
  State<WorkDetails> createState() => _WorkDetailsState();
}

class _WorkDetailsState extends State<WorkDetails> {
  final ScrollController scrollController = ScrollController();

  late final WorkModel _work;
  @override
  void initState() {
    _work = widget.work;
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
            // width: MediaQuery.sizeOf(context).width,
            child: ListView.separated(
              itemCount: _work.links.length,
              // shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                return Container(
                  constraints: BoxConstraints.tight(
                    Size(
                      65.h,
                      65.w,
                    ),
                  ),
                  clipBehavior: Clip.antiAlias,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.light),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: YoutubePlayerHandler(
                    videoLink: _work.links[index].link,
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: 20.w);
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

class YoutubePlayerHandler extends StatefulWidget {
  const YoutubePlayerHandler({super.key, required this.videoLink});
  final String videoLink;

  @override
  State<YoutubePlayerHandler> createState() => _YoutubePlayerHandlerState();
}

class _YoutubePlayerHandlerState extends State<YoutubePlayerHandler> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final YoutubePlayerController controller =
            YoutubePlayerController.fromVideoId(
          videoId: widget.videoLink.split("/").last,
          autoPlay: false,
        );
        await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            contentPadding: EdgeInsets.zero,
            content: AspectRatio(
              aspectRatio: 16.w / 9.h,
              child: YoutubePlayer(
                controller: controller,
                aspectRatio: 16.w / 9.h,
              ),
            ),
          ),
        ).whenComplete(() => controller.close());
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          // YouTube Thumbnail
          Image.network(
            "https://img.youtube.com/vi/${widget.videoLink.split("/").last}/0.jpg",
            fit: BoxFit.cover,
            width: 300,
            height: 200,
          ),

          // Play Button Overlay
          Container(
            width: 300,
            height: 200,
            color: Colors.black.withOpacity(0.4), // Semi-transparent overlay
          ),
          const Icon(
            Icons.play_circle_fill,
            color: Colors.white,
            size: 60,
          ),
        ],
      ),
    );
  }
}

class IFrameEmbedded extends StatefulWidget {
  const IFrameEmbedded({super.key, required this.url, this.onTap});
  final String url;
  final void Function(IFrameElement iframeElement)? onTap;

  @override
  State<IFrameEmbedded> createState() => _IFrameEmbeddedState();
}

class _IFrameEmbeddedState extends State<IFrameEmbedded> {
  late final IFrameElement iFrameElement;
  late final String viewType;
  @override
  void initState() {
    iFrameElement = IFrameElement();
    iFrameElement.width = '100%';
    iFrameElement.height = '100%';
    iFrameElement.src = widget.url;
    iFrameElement.style.border = 'none';
    // iFrameElement.style.pointerEvents = 'none';
    viewType = 'iframeElement${widget.url}';
    ui_web.platformViewRegistry.registerViewFactory(
      viewType,
      (int viewId) => iFrameElement,
    );
    super.initState();
  }

  bool isPaused = false;
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.onTap?.call(iFrameElement);
        });
      },
      child: Stack(
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            height: 40.h,
            width: 40.w,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.light),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: HtmlElementView(
              viewType: viewType,
              key: UniqueKey(),
            ),
          ),
          // Add an overlay initially
          // if (iFrameElement.style.pointerEvents == 'none')
          if (isPaused)
            Container(
              color: Colors.transparent,
              alignment: Alignment.center,
            ),
        ],
      ),
    );
  }
}
