import 'dart:developer';

import 'package:appointment_doctor_app/core/helpers/extensions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/networking/api_error_handler.dart';
import '../data/model/specializations_response_model.dart';
import '../data/repos/home_repo.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo homeRepo;
  HomeCubit(this.homeRepo) : super(const HomeState.initial());
  static HomeCubit get(context) => BlocProvider.of<HomeCubit>(context);

  List<SpecializationsData?>? specializationsDataList = [];

  void getSpecializations() async {
    emit(const HomeState.specializationLoading());

    final response = await homeRepo.getSpecializations();
    log("state: End");
    response.when(
      success: (data) {
        log("state: success");
        specializationsDataList = data.specializationDataList ?? [];

        // getting the doctor list for the first specialization by default.
        getDoctorList(specializationId: specializationsDataList?.first?.id);

        emit(HomeState.specializationSuccess(specializationsDataList));
      },
      failure: (error) {
        log("state: error");

        emit(HomeState.specializationError(error));
      },
    );
  }

  void getDoctorList({required int? specializationId}) {
    List<Doctors?>? specializationDoctorList =
        getDoctorsListBySpecializationId(specializationId);

    if (!specializationDoctorList.isNullOrEmpty()) {
      emit(HomeState.doctorSuccess(specializationDoctorList));
    } else {
      emit(HomeState.doctorError(ErrorHandler.handle("No doctor found")));
    }
  }

  /// return the list of doctors based on the specialization id
  List<Doctors?>? getDoctorsListBySpecializationId(int? specializationId) {
    return specializationsDataList
        ?.firstWhere((specialization) => specialization?.id == specializationId)
        ?.doctorsList;
  }
}
