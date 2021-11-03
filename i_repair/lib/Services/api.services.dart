import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:i_repair/Models/Company/company.dart';
import 'package:i_repair/Models/Field/field.dart';
import 'package:i_repair/Models/Major/major.dart';
import 'package:i_repair/Models/Order/order.dart';
import 'package:i_repair/Models/Order/orderDetail.dart';
import 'package:i_repair/Models/Profile/userProfile.dart';
import 'package:i_repair/Models/Service/service.dart';
import 'package:i_repair/Models/User/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

final endpoint = dotenv.get('MOBILE_APP_API_URL');

class APIServices {
  static Future<CurrentUser> createUser(List<String> token) async {
    String qParam = '?token=';
    token.forEach((part) {
      qParam += part;
    });
    final response = await http.post(
      Uri.parse("$endpoint/api/v1.0/authenticate-customers$qParam"),
    );
    if (response.statusCode == 200) {
      print("API authenticate-customer success");
      return userFromJson(response.body);
    } else {
      throw Exception(
          'Failed to load user and ${response.statusCode} and ${response.reasonPhrase}');
    }
  }

  static Future<UserProfile?> getUserProfile(String id) async {
    String? token = await getToken();
    if (token == null) return null;
    final response = await http
        .get(Uri.parse("$endpoint/api/v1.0/customers/${id.trim()}"), headers: {
      "Authorization": 'Bearer $token',
      "content-type": "application/json"
    });
    if (response.statusCode == 200) {
      print("API customer success");
      return userProfileFromJson(response.body);
    } else {
      throw Exception(
          'Failed to load user profile and ${response.statusCode} and ${response.reasonPhrase}');
    }
  }

  static Future<List<Major>?> fetchMajors() async {
    String? token = await getToken();
    if (token == null) return null;
    final response = await http
        .get(Uri.parse("$endpoint/api/v1.0/majors?status=0"), headers: {
      "Authorization": 'Bearer $token',
      "content-type": "application/json"
    });
    if (response.statusCode == 200) {
      print("API fetchMajorsAPI() success");
      return majorFromJson(response.body);
    } else {
      throw Exception('Failed to load major');
    }
  }

  static Future<List<OrderDetail>?> fetchOrders(
      String? customerId, int status) async {
    String? token = await getToken();
    if (token == null) return null;
    final response = await http.get(
        Uri.parse(
            "$endpoint/api/v1.0/orders?CustomerId=$customerId&Status=$status"),
        headers: {
          "Authorization": 'Bearer $token',
          "content-type": "application/json"
        });
    if (response.statusCode == 200) {
      print("API fetchOrdersAPI() success");
      await cleanCache();
      return orderDetailFromJson(response.body);
    } else {
      throw Exception(
          'Failed to load orders and ${response.statusCode} and ${response.reasonPhrase}');
    }
  }

  static Future<List<Field>?> fetchFields() async {
    String? token = await getToken();
    if (token == null) return null;
    final response = await http
        .get(Uri.parse("$endpoint/api/v1.0/major-fields?status=0"), headers: {
      "Authorization": 'Bearer $token',
      "content-type": "application/json"
    });
    if (response.statusCode == 200) {
      await Future.delayed(Duration(seconds: 1));
      print("API fetchFieldsAPI() success");
      return fieldFromJson(response.body);
    } else {
      throw Exception('Failed to load field');
    }
  }

  static Future<List<Field>?> fetchFieldsByMajors(Major majors) async {
    String? token = await getToken();
    if (token == null) return null;
    String qParamString = '?';
    qParamString += 'listMajorId=${majors.id}';
    final response = await http.get(
        Uri.parse("$endpoint/api/v1.0/major-fields$qParamString"),
        headers: {
          "Authorization": 'Bearer $token',
          "content-type": "application/json"
        });
    if (response.statusCode == 200) {
      print("API fetchFieldsByMajorsAPI() success");
      return fieldFromJson(response.body);
    } else {
      throw Exception('Failed to load field');
    }
  }

  static Future<List<Service>?> fetchServicesByField(Field field) async {
    String? token = await getToken();
    if (token == null) return null;
    String qParamString = "?FieldId=${field.id}";
    final response = await http.get(
      Uri.parse("$endpoint/api/v1.0/services/$qParamString"),
      headers: {
        "Authorization": 'Bearer $token',
        "content-type": "application/json"
      },
    );
    if (response.statusCode == 200) {
      print("API fetchServicesByFieldAPI() success");
      return serviceFromJson(response.body);
    } else {
      throw Exception('Failed to load service');
    }
  }

  static Future<List<Company>?> fetchCompanyByService(
      Service service, double lat, double lng) async {
    String? token = await getToken();
    if (token == null) return null;
    String qParamString = "?ServiceId=${service.id}&lat=$lat&lng=$lng";
    final response = await http.get(
      Uri.parse("$endpoint/api/v1.0/companies$qParamString"),
      headers: {
        "Authorization": 'Bearer $token',
        "content-type": "application/json"
      },
    );
    if (response.statusCode == 200) {
      print("API fetchServicesByFieldAPI() success");
      return companyFromJson(response.body);
    } else {
      throw Exception('Failed to load company');
    }
  }

  static Future<UserProfile?> updateProfileUser(UserProfile user) async {
    String? token = await getToken();
    if (token == null) return null;
    final body = jsonEncode({
      "id": "${user.id}",
      "avatar": "${user.avatar}",
      "phoneNumber": "${(user.phoneNumber)}",
      "email": "${user.email}",
      "username": null,
      "createDate": "2021-10-15T01:59:29.015Z",
      "address": "${user.address}",
      "fullName": "${user.fullName}",
      "uid": "${user.uid}",
      "lat": user.lat,
      "lng": user.lng
    });
    final response = await http.put(
      Uri.parse("$endpoint/api/v1.0/customers"),
      headers: {
        "Authorization": 'Bearer $token',
        "content-type": "application/json"
      },
      body: body,
    );
    if (response.statusCode == 200) {
      print("API updateProfileAPI() success");
      return userProfileFromJson(response.body);
    } else {
      throw Exception(
          'Failed to put user and ${response.statusCode} and ${response.reasonPhrase}');
    }
  }

  static Future<void> createOrder(Order order) async {
    String? token = await getToken();
    if (token == null) return null;
    final body = jsonEncode({
      "serviceId": "${order.serviceId.toUpperCase()}",
      "customerId": "${order.customerId}",
      "lng": order.lng,
      "lat": order.lat,
      "total": order.total,
      "customerAddress": "${order.customerAddress}"
    });
    final response = await http.post(
      Uri.parse("$endpoint/api/v1.0/orders"),
      headers: {
        "Authorization": 'Bearer $token',
        "content-type": "application/json"
      },
      body: body,
    );
    if (response.statusCode == 200) {
      print("API createOrder() success");
    } else {
      throw Exception(
          'Failed to create order and ${response.statusCode} and ${response.reasonPhrase}');
    }
  }

  static Future<void> feedbackOrder(
      String id, int? feedbackPoint, String feedbackMessage) async {
    String? token = await getToken();
    if (token == null) return null;
    final body = jsonEncode({
      "id": id,
      "feedbackPoint": feedbackPoint ?? 0,
      "feedbackMessage": feedbackMessage,
      "status": 3
    });
    final response = await http.put(
      Uri.parse("$endpoint/api/v1.0/orders"),
      headers: {
        "Authorization": 'Bearer $token',
        "content-type": "application/json"
      },
      body: body,
    );
    if (response.statusCode == 200) {
      print("API feedbackOrder() success");
    } else {
      throw Exception(
          'Failed to feedback order and ${response.statusCode} and ${response.reasonPhrase}');
    }
  }

  static Future<void> cancelOrder(String id, String cancelReason) async {
    String? token = await getToken();
    if (token == null) return null;
    final body =
        jsonEncode({"id": id, "cancelReason": cancelReason, "status": 2});
    final response = await http.put(
      Uri.parse("$endpoint/api/v1.0/orders"),
      headers: {
        "Authorization": 'Bearer $token',
        "content-type": "application/json"
      },
      body: body,
    );
    if (response.statusCode == 200) {
      print("API cancelOrder() success");
    } else {
      throw Exception(
          'Failed to cancel order and ${response.statusCode} and ${response.reasonPhrase}');
    }
  }

  static Future<void> cleanCache() async {
    String? token = await getToken();
    if (token == null) return null;
    final response = await http.delete(
      Uri.parse("$endpoint/api/v1.0/order-redis"),
      headers: {
        "Authorization": 'Bearer $token',
        "content-type": "application/json"
      },
    );
    if (response.statusCode == 200) {
      print("API clean cache success");
    } else {
      throw Exception(
          'Failed to clean cache and ${response.statusCode} and ${response.reasonPhrase}');
    }
  }

  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    final currentUserString = prefs.getString('currentUser');
    if (currentUserString == null || currentUserString.isEmpty) {
      return null;
    }
    return userFromJson(currentUserString).token;
  }
}
