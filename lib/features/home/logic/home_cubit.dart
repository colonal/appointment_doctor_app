import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/repos/home_repo.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo homeRepo;
  HomeCubit(this.homeRepo) : super(const HomeState.initial());
  static HomeCubit get(context) => BlocProvider.of<HomeCubit>(context);

  void getSpecializations() async {
    emit(const HomeState.specializationLoading());

    final response = await homeRepo.getSpecializations();
    log("state: End");
    response.when(
      success: (data) {
        log("state: success");
        emit(HomeState.specializationSuccess(data));
      },
      failure: (error) {
        log("state: error");

        emit(HomeState.specializationError(error));
      },
    );
  }
}
