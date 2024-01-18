// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rate_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RateModel _$RateModelFromJson(Map<String, dynamic> json) => RateModel(
      message: json['message'] as String,
      rate: Rate.fromJson(json['rate'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RateModelToJson(RateModel instance) => <String, dynamic>{
      'message': instance.message,
      'rate': instance.rate,
    };

Rate _$RateFromJson(Map<String, dynamic> json) => Rate(
      clientId: json['clientId'] as String,
      workerId: json['workerId'] as String,
      rate: json['rate'] as String,
      notes: json['notes'] as String,
      updatedAt: json['updatedAt'] as String,
      createdAt: json['createdAt'] as String,
      id: json['id'] as int,
    );

Map<String, dynamic> _$RateToJson(Rate instance) => <String, dynamic>{
      'clientId': instance.clientId,
      'workerId': instance.workerId,
      'rate': instance.rate,
      'notes': instance.notes,
      'updatedAt': instance.updatedAt,
      'createdAt': instance.createdAt,
      'id': instance.id,
    };
