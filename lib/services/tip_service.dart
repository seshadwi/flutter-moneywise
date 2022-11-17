import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:moneywise_app/models/tip_model.dart';
import 'package:moneywise_app/services/auth_service.dart';
import 'package:moneywise_app/shared/shared_values.dart';

class TipService {
  Future<List<TipModel>> getTips() async {
    try {
      final token = await AuthService().getToken();

      final res = await http.get(Uri.parse('$baseUrl/tips'), headers: {
        'Authorization': token,
      });

      print(res.body);

      if (res.statusCode == 200) {
        return List<TipModel>.from(
          jsonDecode(res.body)['data'].map(
            (tip) => TipModel.fromJson(tip),
          ),
        ).toList();
      }

      throw jsonDecode(res.body)['message'];
    } catch (e) {
      rethrow;
    }
  }
}
