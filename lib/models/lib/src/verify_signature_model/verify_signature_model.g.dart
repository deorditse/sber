// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_signature_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SignatureVerificationModel _$$_SignatureVerificationModelFromJson(
        Map<String, dynamic> json) =>
    _$_SignatureVerificationModel(
      error_code: json['error_code'] as int? ?? 0,
      error_comment: json['error_comment'] as String?,
      error_details: json['error_details'] as String?,
      error_trace: json['error_trace'] as String?,
      success: json['success'] as bool? ?? false,
      signature_time_msk: json['signature_time_msk'] as String?,
      signer_full_name: json['signer_full_name'] as String?,
      signer_inn: json['signer_inn'] as String?,
      signature_guid: json['signature_guid'] as String?,
      document_origin_guid: json['document_origin_guid'] as String?,
    );

Map<String, dynamic> _$$_SignatureVerificationModelToJson(
        _$_SignatureVerificationModel instance) =>
    <String, dynamic>{
      'error_code': instance.error_code,
      'error_comment': instance.error_comment,
      'error_details': instance.error_details,
      'error_trace': instance.error_trace,
      'success': instance.success,
      'signature_time_msk': instance.signature_time_msk,
      'signer_full_name': instance.signer_full_name,
      'signer_inn': instance.signer_inn,
      'signature_guid': instance.signature_guid,
      'document_origin_guid': instance.document_origin_guid,
    };
