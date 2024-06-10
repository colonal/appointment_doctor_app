import 'package:appointment_doctor_app/core/networking/api_error_handler.dart';
import 'package:appointment_doctor_app/core/networking/api_result.dart';
import 'package:appointment_doctor_app/features/home/data/api/home_api_service.dart';

import '../model/specializations_response_model.dart';

class HomeRepo {
  final HomeApiService homeApiService;

  HomeRepo(this.homeApiService);

  Future<ApiResult<SpecializationsResponseModel>> getSpecializations() async {
    try {
      final response = await homeApiService.getSpecializations();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
