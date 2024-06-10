import 'package:appointment_doctor_app/core/networking/api_service.dart';
import 'package:appointment_doctor_app/core/networking/dio_factory.dart';
import 'package:appointment_doctor_app/features/login/data/repos/login_repo.dart';
import 'package:appointment_doctor_app/features/login/logic/cubit/login_cubit.dart';
import 'package:appointment_doctor_app/features/sign_up/data/repos/sign_up_repo.dart';
import 'package:appointment_doctor_app/features/sign_up/logic/sign_up_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/home/data/api/home_api_service.dart';
import '../../features/home/data/repos/home_repo.dart';
import '../../features/home/logic/home_cubit.dart';

final getIt = GetIt.instance;

Future<void> setUpGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // Login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(apiService: getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(loginRepo: getIt()));

  // SigUp
  getIt
      .registerLazySingleton<SignUpRepo>(() => SignUpRepo(apiService: getIt()));
  getIt.registerFactory<SignUpCubit>(() => SignUpCubit(signUpRepo: getIt()));

  // home
  getIt.registerLazySingleton<HomeApiService>(() => HomeApiService(dio));
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));
}
