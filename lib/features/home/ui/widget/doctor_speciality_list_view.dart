import 'package:appointment_doctor_app/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theming/app_color.dart';

class DoctorSpecialityListView extends StatelessWidget {
  const DoctorSpecialityListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 8,
        separatorBuilder: (context, index) => SizedBox(width: 24.w),
        itemBuilder: (context, index) {
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
                "Specialization",
                style: TextStyles.font12GrayRegular,
              )
            ],
          );
        },
      ),
    );
  }
}
