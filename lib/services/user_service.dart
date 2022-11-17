import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:moneywise_app/models/user_edit_form_model.dart';
import 'package:moneywise_app/models/user_model.dart';
import 'package:moneywise_app/services/auth_service.dart';
import 'package:moneywise_app/shared/shared_values.dart';

class UserService {
  Future<void> updateUser(UserEditFormModel data) async {
    try {
      final token = await AuthService().getToken();

      final res = await http
          .put(Uri.parse('$baseUrl/users'), body: data.toJson(), headers: {
        'Authorization': token,
      });

      if (res.statusCode != 200) {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<UserModel>> getRecentUser() async {
    final token = await AuthService().getToken();

    final res = await http.get(
      Uri.parse(
        '$baseUrl/transfer_histories',
      ),
      headers: {
        'Authorization': token,
      },
    );

    if (res.statusCode == 200) {
      return List<UserModel>.from(
        jsonDecode(res.body)['data'].map(
          (user) => UserModel.fromJson(user),
        ),
      );
    }

    throw jsonDecode(res.body)['message'];
  }

  Future<List<UserModel>> getUsersByUsername(String username) async {
    final token = await AuthService().getToken();

    final res = await http.get(
      Uri.parse(
        '$baseUrl/users/$username',
      ),
      headers: {
        'Authorization': token,
      },
    );

    if (res.statusCode == 200) {
      return List<UserModel>.from(
        jsonDecode(res.body).map(
          (user) => UserModel.fromJson(user),
        ),
      );
    }

    throw jsonDecode(res.body)['message'];
  }
}
