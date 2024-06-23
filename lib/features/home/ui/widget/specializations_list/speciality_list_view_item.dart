import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/theming/app_color.dart';
import '../../../../../core/theming/styles.dart';
import '../../../data/model/specializations_response_model.dart';

class SpecialityListViewItem extends StatelessWidget {
  final SpecializationsData specializationsData;
  final bool isSelected;
  const SpecialityListViewItem(
    this.specializationsData, {
    required this.isSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        isSelected
            ? Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: ColorManager.darkBlue,
                  ),
                  shape: BoxShape.circle,
                ),
                child: CircleAvatar(
                  radius: 28,
                  backgroundColor: ColorManager.lightBlue,
                  child: SvgPicture.asset(
                    'assets/svgs/general_speciality.svg',
                    height: 42.h,
                    width: 42.w,
                  ),
                ),
              )
            : CircleAvatar(
                radius: 28,
                backgroundColor: ColorManager.lightBlue,
                child: SvgPicture.asset(
                  "assets/svgs/general_speciality.svg",
                  height: 40.h,
                  width: 40.h,
                ),
              ),
        const SizedBox(height: 8),
        Text(
          specializationsData.name ?? 'Specialization',
          style: isSelected
              ? TextStyles.font14DarkBlueBold
              : TextStyles.font12GrayRegular,
        )
      ],
    );
  }
}
