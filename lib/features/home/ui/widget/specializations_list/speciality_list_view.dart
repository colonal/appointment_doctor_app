import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/model/specializations_response_model.dart';
import '../../../logic/home_cubit.dart';
import 'speciality_list_view_item.dart';

class SpecialityListView extends StatefulWidget {
  final List<SpecializationsData?> specializationList;
  const SpecialityListView(this.specializationList, {super.key});

  @override
  State<SpecialityListView> createState() => _SpecialityListViewState();
}

class _SpecialityListViewState extends State<SpecialityListView> {
  int selectedSpecializationIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: widget.specializationList.length,
        separatorBuilder: (context, index) => SizedBox(width: 24.w),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedSpecializationIndex = index;
              });
              context.read<HomeCubit>().getDoctorList(
                    specializationId: widget.specializationList[index]?.id,
                  );
            },
            child: SpecialityListViewItem(
              widget.specializationList[index]!,
              isSelected: selectedSpecializationIndex == index,
            ),
          );
        },
      ),
    );
  }
}
