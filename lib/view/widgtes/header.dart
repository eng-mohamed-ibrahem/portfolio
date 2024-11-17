import 'package:auto_animated/auto_animated.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/config/navigation/routes_enum.dart';
import 'package:portfolio/config/themes/app_text_styles.dart';
import 'package:portfolio/core/constants/app_colors.dart';

class Header extends StatefulWidget {
  const Header({super.key, required this.onTap});
  final void Function(int selectedTabIndex) onTap;

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  int selectedTabIndex = 0;
  bool drawerOpened = false;

  @override
  Widget build(BuildContext context) {
    var titles = [
      'home.title'.tr(),
      'works.header'.tr(),
      'contact.title'.tr(),
    ];
    return AnimateIfVisibleWrapper(
      // Show each item through
      showItemInterval: const Duration(milliseconds: 300),
      child: SingleChildScrollView(
        child: AnimateIfVisible(
          key: const Key('header'),
          delay: const Duration(milliseconds: 350),
          duration: const Duration(milliseconds: 350),
          reAnimateOnVisibility: true,
          builder: (
            BuildContext context,
            Animation<double> animation,
          ) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  bool isWideScreen = constraints.maxWidth > 600;
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      isWideScreen
                          ? Padding(
                              padding: const EdgeInsets.all(15),
                              child: Row(
                                children: _createHeaderTitles(titles),
                              ),
                            )
                          : IconButton(
                              key: const Key('menu_button'),
                              onPressed: () {
                                Scaffold.of(context).openEndDrawer();
                              },
                              icon: const Icon(
                                FontAwesomeIcons.bars,
                                color: AppColors.dark,
                              ),
                            ),
                    ],
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }

  List<TextButton> _createHeaderTitles(List<String> titles) {
    var children = List.generate(
      titles.length,
      (index) => TextButton(
        onPressed: () {
          setState(() {
            selectedTabIndex = index;
            widget.onTap(selectedTabIndex);
            Navigator.pop(context);
            context.go(Routes.values[selectedTabIndex].path);
          });
        },
        child: Text(
          titles[index],
          style: AppTextStyles.bodySmall.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 10.sp,
            color: selectedTabIndex == index ? AppColors.primary : null,
          ),
        ),
      ),
    );
    return children;
  }

  void _showDrawerDialog(BuildContext context, List<Widget> children) async {
    var result = await showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Align(
          alignment:
              AlignmentDirectional.centerEnd, // Align dialog like a drawer
          child: Padding(
            padding: EdgeInsets.only(top: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  child: InkWell(
                    onTap: () {
                      drawerOpened = false;
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
                Material(
                  elevation: 8,
                  color: Colors.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                  ),
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                    // Width of the drawer
                    width: MediaQuery.sizeOf(context).width * 0.4,
                    height: double.infinity,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: children,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
    drawerOpened = result ?? false;
  }
}
