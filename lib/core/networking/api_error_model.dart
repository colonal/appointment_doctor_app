import 'package:appointment_doctor_app/core/helpers/extensions.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api_error_model.g.dart';

@JsonSerializable()
class ApiErrorModel {
  final String? message;
  final int? code;
  @JsonKey(name: 'data')
  final Map<String, dynamic>? errors;

  ApiErrorModel({
    required this.message,
    this.code,
    this.errors,
  });

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);

  /// Returns all error messages as a string
  String getAllErrorMessage() {
    if (errors.isNullOrEmpty()) {
      return message ?? 'Unknown error occurred';
    }

    final errorMessage = errors!.entries.map((entry) {
      final value = entry.value;

      return "${value.join(', ')}".trim();
    }).join("\n");

    return errorMessage;
  }
}
