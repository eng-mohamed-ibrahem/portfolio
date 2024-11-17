import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/config/navigation/routes_enum.dart';
import 'package:portfolio/config/themes/app_text_styles.dart';
import 'package:portfolio/core/constants/app_colors.dart';
import 'package:portfolio/view/widgtes/bottom_section.dart';
import 'package:portfolio/view/widgtes/header.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key, required this.body});
  final Widget body;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedTab = 0;
  @override
  Widget build(BuildContext context) {
    var titles = [
      'home.title'.tr(),
      'works.header'.tr(),
      'contact.title'.tr(),
    ];
    return Scaffold(
      body: Column(
        children: [
          Header(
            onTap: (selectedTabIndex) {
              selectedTab = selectedTabIndex;
            },
          ),
          Expanded(child: widget.body),
          const BottomSection(),
        ],
      ),
      endDrawer: MediaQuery.sizeOf(context).width > 600
          ? null
          : Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: CircleAvatar(
                        radius: 10.r,
                        backgroundColor: AppColors.wight,
                        child: Icon(
                          FontAwesomeIcons.xmark,
                          color: AppColors.dark,
                          size: 10.r,
                        ),
                      ),
                    ),
                  ),
                  Drawer(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 10.h),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(
                          titles.length,
                          (index) => TextButton(
                            onPressed: () {
                              selectedTab = index;
                              Navigator.pop(context);
                              context.go(Routes.values[selectedTab].path);
                            },
                            child: Text(
                              titles[index],
                              style: AppTextStyles.bodySmall.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 10.sp,
                                color: selectedTab == index
                                    ? AppColors.primary
                                    : null,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
