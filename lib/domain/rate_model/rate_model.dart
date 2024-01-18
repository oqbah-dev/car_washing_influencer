import 'package:json_annotation/json_annotation.dart';

part 'rate_model.g.dart';

@JsonSerializable()
class RateModel {
  String message;
  Rate rate;

  RateModel({required this.message, required this.rate});

  factory RateModel.fromJson(Map<String, dynamic> json) =>
      _$RateModelFromJson(json);

  Map<String, dynamic> toJson() => _$RateModelToJson(this);
}

@JsonSerializable()
class Rate {
  String clientId;
  String workerId;
  String rate;
  String notes;
  String updatedAt;
  String createdAt;
  int id;

  Rate({
    required this.clientId,
    required this.workerId,
    required this.rate,
    required this.notes,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  factory Rate.fromJson(Map<String, dynamic> json) => _$RateFromJson(json);

  Map<String, dynamic> toJson() => _$RateToJson(this);
}
