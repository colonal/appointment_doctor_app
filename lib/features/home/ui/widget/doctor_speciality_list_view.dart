import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/model/specializations_response_model.dart';
import 'doctor_speciality_list_view_item.dart';

class DoctorSpecialityListView extends StatelessWidget {
  final List<SpecializationsData?> specializationList;
  const DoctorSpecialityListView(this.specializationList, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: specializationList.length,
        separatorBuilder: (context, index) => SizedBox(width: 24.w),
        itemBuilder: (context, index) {
          return DoctorSpecialityListViewItem(specializationList[index]!);
        },
      ),
    );
  }
}
