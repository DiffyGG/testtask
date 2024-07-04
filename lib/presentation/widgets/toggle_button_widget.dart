import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:test_task_2/presentation/utils/app_colors.dart';
import 'package:test_task_2/presentation/utils/app_text_styles.dart';

class ToggleButtonWidget extends StatefulWidget {
  const ToggleButtonWidget({
    super.key,
    required this.blogPage,
    required this.statisticPage,
  });

  final Widget blogPage;
  final Widget statisticPage;

  @override
  State<ToggleButtonWidget> createState() => _ToggleButtonWidgetState();
}

class _ToggleButtonWidgetState extends State<ToggleButtonWidget> {
  late bool _isLeftSelected;
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _isLeftSelected = true;
    _pageController = PageController();
  }

  static const _borderRadius = BorderRadius.all(
    Radius.circular(50),
  );

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 43),
            child: AnimatedToggleSwitch<bool>.size(
              current: _isLeftSelected,
              height: 30,
              values: const [true, false],
              indicatorSize: const Size(double.infinity, 30),
              iconOpacity: 1.0,
              inactiveOpacity: 1.0,
              customIconBuilder: (_, local, ___) {
                if (local.value) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ImageIcon(
                        const AssetImage('assets/icons/blog.png'),
                        size: 12,
                        color: Color.lerp(
                          AppColors.greyTwo,
                          AppColors.white,
                          local.animationValue,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        'Дневник настроения',
                        style: AppTextStyles.toggle.copyWith(
                          color: Color.lerp(
                            AppColors.greyTwo,
                            AppColors.white,
                            local.animationValue,
                          ),
                        ),
                      ),
                    ],
                  );
                }

                return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ImageIcon(
                      const AssetImage('assets/icons/statistic.png'),
                      size: 12,
                      color: Color.lerp(
                        AppColors.greyTwo,
                        AppColors.white,
                        local.animationValue,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'Статистика',
                      style: AppTextStyles.toggle.copyWith(
                        color: Color.lerp(
                          AppColors.greyTwo,
                          AppColors.white,
                          local.animationValue,
                        ),
                      ),
                    ),
                  ],
                );
              },
              selectedIconScale: 1,
              styleAnimationType: AnimationType.onHover,
              style: const ToggleStyle(
                backgroundColor: AppColors.greyFour,
                borderRadius: _borderRadius,
                borderColor: Colors.transparent,
                indicatorColor: AppColors.primary,
              ),
              onChanged: (value) {
                setState(() {
                  _isLeftSelected = value;
                });
                _pageController.animateToPage(
                  _isLeftSelected ? 0 : 1,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
            ),
          ),
          const SizedBox(height: 30),
          Expanded(
            child: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                widget.blogPage,
                widget.statisticPage,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
