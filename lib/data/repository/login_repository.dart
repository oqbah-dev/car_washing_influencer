import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/login_model/login_model.dart';


class LoginRepository {
  final Dio _dio = Dio();
  Future<LoginModel> loginUser(
      {required String phoneNumber, required String password}) async {
    try {
      final response = await _dio.post(
          'https://wash-stations.com/api/client/login-api',
          data: {'phone_number': phoneNumber, 'password': password});
      return LoginModel.fromJson(response.data);
    } catch (e) {
      throw Exception('');
    }
  }
}

final loginRepositoryProvider = Provider<LoginRepository>((ref) {
  return LoginRepository();
});



// final loginProvider = FutureProvider.autoDispose.family<bool,Login>((ref,credentials) async {
//   return ref.watch(loginRepositoryProvider).loginUser(phoneNumber: 'user' , password: 'user');
// });