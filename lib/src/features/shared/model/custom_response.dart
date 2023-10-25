// To parse this JSON data, do
//
//     final customResponse = customResponseFromMap(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';

part 'custom_response.freezed.dart';
part 'custom_response.g.dart';

@freezed
class CustomResponse with _$CustomResponse {
  const factory CustomResponse({
    required dynamic message,
    required dynamic status,
  }) = _CustomResponse;

  factory CustomResponse.fromJson(Map<String, dynamic> json) =>
      _$CustomResponseFromJson(json);
}
