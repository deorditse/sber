import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_signature_model.freezed.dart';

part 'verify_signature_model.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs
@freezed
class SignatureVerificationModel with _$SignatureVerificationModel {
  const factory SignatureVerificationModel({
    @Default(0) int error_code,
    String? error_comment,
    String? error_details,
    String? error_trace,
    @Default(false) bool success,
    String? signature_time_msk,
    String? signer_full_name,
    String? signer_inn,
    String? signature_guid,
    String? document_origin_guid,
  }) = _SignatureVerificationModel;

  factory SignatureVerificationModel.fromJson(Map<String, Object?> json) =>
      _$SignatureVerificationModelFromJson(json);
}
