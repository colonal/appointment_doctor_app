import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theming/app_color.dart';
import '../../../../core/theming/styles.dart';
import '../../data/model/specializations_response_model.dart';

class DoctorSpecialityListViewItem extends StatelessWidget {
  final SpecializationsData specializationsData;
  const DoctorSpecialityListViewItem(this.specializationsData, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
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
          style: TextStyles.font12GrayRegular,
        )
      ],
    );
  }
}
