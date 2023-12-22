import 'package:appointment_doctor_app/core/networking/api_constants.dart';
import 'package:appointment_doctor_app/features/login/data/models/login_request_body.dart';
import 'package:appointment_doctor_app/features/login/data/models/login_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<LoginResponse> login(@Body() LoginRequestBody requestBody);
}
