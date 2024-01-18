class UpdateWorkerModel {
  String? message;
  User? user;

  UpdateWorkerModel({this.message, this.user});

  UpdateWorkerModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  int? isVerified;
  String? email;
  String? workerPicture;
  String? workStatus;
  String? startHoursWork;
  String? endHoursWork;
  String? daysStartWork;
  String? daysEndWork;
  int? trash;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
        this.firstName,
        this.lastName,
        this.phoneNumber,
        this.isVerified,
        this.email,
        this.workerPicture,
        this.workStatus,
        this.startHoursWork,
        this.endHoursWork,
        this.daysStartWork,
        this.daysEndWork,
        this.trash,
        this.createdAt,
        this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    phoneNumber = json['phone_number'];
    isVerified = json['isVerified'];
    email = json['email'];
    workerPicture = json['worker_picture'];
    workStatus = json['work_status'];
    startHoursWork = json['start_hours_work'];
    endHoursWork = json['end_hours_work'];
    daysStartWork = json['days_start_work'];
    daysEndWork = json['days_end_work'];
    trash = json['trash'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['phone_number'] = phoneNumber;
    data['isVerified'] = isVerified;
    data['email'] = email;
    data['worker_picture'] = workerPicture;
    data['work_status'] = workStatus;
    data['start_hours_work'] = startHoursWork;
    data['end_hours_work'] = endHoursWork;
    data['days_start_work'] = daysStartWork;
    data['days_end_work'] = daysEndWork;
    data['trash'] = trash;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
