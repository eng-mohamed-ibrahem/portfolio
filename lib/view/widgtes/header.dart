import 'package:auto_animated/auto_animated.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/config/navigation/routes_enum.dart';
import 'package:portfolio/config/themes/app_text_styles.dart';
import 'package:portfolio/core/constants/app_colors.dart';
import 'package:portfolio/viewmodel/main_viewmodel/main_viewmodel.dart';

class Header extends StatelessWidget {
  const Header({super.key});

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
              child: BlocBuilder<MainViewmodel, MainViewModelState>(
                builder: (context, state) {
                  return LayoutBuilder(
                    builder: (context, constraints) {
                      bool isWideScreen = constraints.maxWidth > 600;
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          isWideScreen
                              ? Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Row(
                                    children:
                                        _createHeaderTitles(context, titles),
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
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }

  List<TextButton> _createHeaderTitles(
      BuildContext context, List<String> titles) {
    var children = List.generate(
      titles.length,
      (index) => TextButton(
        onPressed: () {
          context.read<MainViewmodel>().setSelectedTab(index);

          context.go(Routes.values[index].path);
        },
        child: Text(
          titles[index],
          style: AppTextStyles.bodySmall.copyWith(
            fontWeight: FontWeight.bold,
            color: context.read<MainViewmodel>().currentTapIndex == index
                ? AppColors.primary
                : null,
          ),
        ),
      ),
    );
    return children;
  }
}
