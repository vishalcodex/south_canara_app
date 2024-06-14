import 'package:get/get.dart';

import '../models/api_response.dart';
import '../models/contacted_seller_model.dart';
import '../models/user_model.dart';
import '../providers/api_provider.dart';
import 'package:dio/dio.dart' as dio;

class UserRepository {
  late ApiProvider apiProvider;

  UserRepository() {
    apiProvider = Get.find<ApiProvider>();
  }

  // Future<ApiResponse> signUp(String phoneNo) async {
  //   return await apiProvider
  //       .makeAPICall("POST", "api/signup", {"phone": phoneNo}).then((value) {
  //     if (value.status == Status.COMPLETED) {
  //       // User user = User.fromJson(value.data["user"]);
  //       // user.token = value.data["token"];
  //       // value.data = user;
  //     }
  //     return value;
  //   });
  // }

  // Future<ApiResponse> verifyOtp(creds) async {
  //   return await apiProvider
  //       .makeAPICall("POST", "api/verify-otp", creds)
  //       .then((value) {
  //     if (value.status == Status.COMPLETED) {
  //       User user = User.fromJson(value.data["user"]);
  //       user.token = value.data["token"];
  //       value.data = user;
  //     }
  //     return value;
  //   });
  // }

  // Future<ApiResponse> setPassword(String password) async {
  //   return await apiProvider.makeAPICall(
  //       "POST", "api/set-password", {"password": password}).then((value) {
  //     if (value.status == Status.COMPLETED) {
  //       // User user = User.fromJson(value.data["user"]);
  //       // user.token = value.data["token"];
  //       // value.data = user;
  //     }
  //     return value;
  //   });
  // }

  Future<ApiResponse> login(creds) async {
    var data = dio.FormData.fromMap(creds);
    return await apiProvider.makeAPICall("POST", "login", data).then((value) {
      if (value.status == Status.COMPLETED) {
        User user = User.fromJson(value.data["user"]);
        user.token = value.data["token"];
        value.data = user;
      }
      return value;
    });
  }

  Future<ApiResponse> forgotPassword(var data) async {
    var body = dio.FormData.fromMap(data);
    return await apiProvider
        .makeAPICall("POST", "forget-password", body)
        .then((value) {
      if (value.status == Status.COMPLETED) {
        // User user = User.fromJson(value.data["user"]);
        // user.token = value.data["token"];
        // value.data = user;
      }
      return value;
    });
  }

  Future<ApiResponse> fetchUserDetails() async {
    return await apiProvider.makeAPICall("GET", "profile", {}).then((value) {
      if (value.status == Status.COMPLETED) {
        User user = User.fromJson(value.data["user"]);
        value.data = user;
      }
      return value;
    });
  }

  Future<ApiResponse> logout() async {
    return await apiProvider.makeAPICall("GET", "logout", {}).then((value) {
      if (value.status == Status.COMPLETED) {
        User user = User.fromJson(value.data);
        value.data = user;
      }
      return value;
    });
  }

  Future<ApiResponse> register(creds) async {
    var data = dio.FormData.fromMap(creds);
    return await apiProvider
        .makeAPICall("POST", "register", data)
        .then((value) {
      if (value.status == Status.COMPLETED) {
        User user = User.fromJson(value.data["user"]);
        user.token = value.data["token"];
        value.data = user;
      }
      return value;
    });
  }

  Future<ApiResponse> fetchMyEnquires() async {
    return await apiProvider
        .makeAPICall("GET", "user_enquiry", {}).then((value) {
      if (value.status == Status.COMPLETED) {
        value.data = (value.data["enquiries"] as List)
            .map((e) => ContactedSeller.fromJson(e))
            .toList();
      } else {
        value.data = [];
      }

      return value;
    });
  }
}
