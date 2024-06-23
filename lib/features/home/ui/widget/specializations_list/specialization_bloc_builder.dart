import 'package:appointment_doctor_app/core/networking/api_error_handler.dart';
import 'package:appointment_doctor_app/features/home/data/model/specializations_response_model.dart';
import 'package:appointment_doctor_app/features/home/ui/widget/doctor_list/doctors_shimmer_loading.dart';
import 'package:appointment_doctor_app/features/home/ui/widget/specializations_list/speciality_shimmer_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../logic/home_cubit.dart';
import '../../../logic/home_state.dart';
import 'speciality_list_view.dart';

class SpecializationBlocBuilder extends StatelessWidget {
  const SpecializationBlocBuilder({super.key});

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
          specializationSuccess: (specializationList) {
            return setupSuccess(specializationList ?? []);
          },
        );
      },
    );
  }

  Widget setupSuccess(List<SpecializationsData?> specializationList) {
    return SpecialityListView(specializationList);
  }

  Widget setupError(ErrorHandler message) =>
      Text(message.apiErrorModel.message ?? "");

  Widget setupLoading() {
    return Expanded(
      child: Column(
        children: [
          const SpecialityShimmerLoading(),
          verticalSpacing(8),
          const DoctorsShimmerLoading()
        ],
      ),
    );
  }
}
