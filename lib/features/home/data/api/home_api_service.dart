import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart' hide Headers;

import '../../../../core/networking/api_constants.dart';
import '../model/specializations_response_model.dart';
import 'home_api_constants.dart';

part 'home_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class HomeApiService {
  factory HomeApiService(Dio dio, {String baseUrl}) = _HomeApiService;

  @GET(HomeApiConstants.specializationEP)
  Future<SpecializationsResponseModel> getSpecializations();
}
