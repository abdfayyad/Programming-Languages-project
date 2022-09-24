import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:project/models/api_response.dart';
import 'package:project/models/constants.dart';
import 'package:project/models/user.dart';

Future<ApiResponse> login(String email, String password) async {
  ApiResponse apiResponse = ApiResponse();
  try {
    final response = await http.post(Uri.parse(loginURL),
        headers: {'Accept': 'application /json'},
        body: {'email': email, 'password': password});
    switch (response.statusCode) {
      case 200:
        apiResponse.data = User.fromJson(jsonDecode(response.body));
        break;

      case 422:
        final errors = jsonDecode(response.body)['errors'];
        apiResponse.error = errors[errors.keys.elementAt(0)][0];
        break;
      case 400:
        apiResponse.error = jsonDecode(response.body)['message'];
        break;
      default:
        apiResponse.error = smthWentWrong;
        break;
    }
  } catch (e) {
    apiResponse.error = serverError;
  }
  return apiResponse;
}

Future<ApiResponse> register(String name, String phoneNum,String email, String password) async {
  ApiResponse apiResponse = ApiResponse();
  try {
    final response = await http.post(Uri.parse(registerURL),
        headers: {'Accept': 'application /json'},
        body: {'name':name,'phoneNum':phoneNum,'email': email, 'password': password,'password_confirmation':password});
    switch (response.statusCode) {
      case 200:
        apiResponse.data = User.fromJson(jsonDecode(response.body));
        break;

      case 422:
        final errors = jsonDecode(response.body)['errors'];
        apiResponse.error = errors[errors.keys.elementAt(0)][0];
        break;
      case 400:
        apiResponse.error = jsonDecode(response.body)['message'];
        break;
      default:
        apiResponse.error = smthWentWrong;
        break;
    }
  } catch (e) {
    apiResponse.error = serverError;
  }
  return apiResponse;
}


// Future<ApiResponse> getUserDetails() async {
//   ApiResponse apiResponse = ApiResponse();
//   try {
//     String token=await getToken();
//     final response = await http.get(Uri.parse(userURL),
//         headers: {'Accept': 'application /json',
//         'Authorization':'Bearer $token'});
//     switch (response.statusCode) {
//       case 200:
//         apiResponse.data = User.fromJson(jsonDecode(response.body));
//         break;

//       case 422:
//         final errors = jsonDecode(response.body)['errors'];
//         apiResponse.error = errors[errors.keys.elementAt(0)][0];
//         break;
//       case 400:
//         apiResponse.error = jsonDecode(response.body)['message'];
//         break;
//       default:
//         apiResponse.error = smthWentWrong;
//         break;
//     }
//   } catch (e) {
//     apiResponse.error = serverError;
//   }
//   return apiResponse;
// }

// Future<String>getToken()async{
//   SharedPreferences pref
// }