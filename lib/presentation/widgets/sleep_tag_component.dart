import 'package:flutter/material.dart';

import '../../core/utils/colors.dart';
import '../../core/utils/fonts.dart';
import '../../core/utils/icons.dart';


class SleepTagComponent extends StatelessWidget {
  const SleepTagComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 63,
      height: 33,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColor.error,
          width: 1,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(4),
        ),
      ),
      child: Row(
        spacing: 4,

        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppIcon.moon(
            color: AppColor.error,
            width: 16,
            height: 16,
          ),
          Text(
            '수면',
            style: AppTypography.caption1R.copyWith(
              color: AppColor.error,
            ),
          )
        ],
      ),
    );
  }
}
