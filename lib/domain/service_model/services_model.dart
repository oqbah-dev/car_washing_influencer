class ServicesHistoryModel {
  String? message;
  List<ServiceHistories>? serviceHistories;

  ServicesHistoryModel({this.message, this.serviceHistories});

  ServicesHistoryModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['service_histories'] != null) {
      serviceHistories = <ServiceHistories>[];
      json['service_histories'].forEach((v) {
        serviceHistories!.add(ServiceHistories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (serviceHistories != null) {
      data['service_histories'] =
          serviceHistories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ServiceHistories {
  int? id;
  int? clientId;
  int? workerId;
  String? serviceName;
  String? status;
  String? serviceDetails;
  String? paymentAmount;
  String? createdAt;
  String? updatedAt;

  ServiceHistories(
      {this.id,
        this.clientId,
        this.workerId,
        this.serviceName,
        this.status,
        this.serviceDetails,
        this.paymentAmount,
        this.createdAt,
        this.updatedAt});

  ServiceHistories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    clientId = json['client_id'];
    workerId = json['worker_id'];
    serviceName = json['service_name'];
    status = json['status'];
    serviceDetails = json['service_details'];
    paymentAmount = json['payment_amount'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['client_id'] = clientId;
    data['worker_id'] = workerId;
    data['service_name'] = serviceName;
    data['status'] = status;
    data['service_details'] = serviceDetails;
    data['payment_amount'] = paymentAmount;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
