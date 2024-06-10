import 'package:appointment_doctor_app/core/networking/api_error_handler.dart';
import 'package:appointment_doctor_app/features/home/data/model/specializations_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../logic/home_cubit.dart';
import '../../logic/home_state.dart';
import 'doctor_list_view.dart';
import 'doctor_speciality_list_view.dart';

class SpecializationAndDoctorBlocBuilder extends StatelessWidget {
  const SpecializationAndDoctorBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is SpecializationError ||
          current is SpecializationLoading ||
          current is SpecializationSuccess,
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () => const SizedBox(),
          specializationError: (message) => setupError(message),
          specializationLoading: () => setupLoading(),
          specializationSuccess: (specializationsResponseModel) {
            var specializationList =
                specializationsResponseModel.specializationDataList ?? [];
            return setupSuccess(specializationList);
          },
        );
      },
    );
  }

  Widget setupSuccess(List<SpecializationsData?> specializationList) {
    return Expanded(
      child: Column(
        children: [
          DoctorSpecialityListView(specializationList),
          SizedBox(height: 8.h),
          DoctorListView(specializationList.first!.doctorsList ?? []),
        ],
      ),
    );
  }

  Widget setupError(ErrorHandler message) =>
      Text(message.apiErrorModel.message ?? "");

  Widget setupLoading() {
    return const Center(child: CircularProgressIndicator());
  }
}
