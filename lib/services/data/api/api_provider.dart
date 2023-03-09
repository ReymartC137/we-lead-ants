import 'package:ants/services/data/models/email_subscribed_response.dart';
import 'package:ants/services/data/models/registration_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'logging.dart';

class ApiProvider {
  final Dio _dio = Dio(
    BaseOptions(
        baseUrl: 'https://192.168.0.130:3000/',
        headers: {
          "Access-Control-Allow-Origin": "*",
          'Content-Type': 'application/json',
          'Accept': '*/*'
        },
        connectTimeout: const Duration(milliseconds: 50000),
        receiveTimeout: const Duration(milliseconds: 50000)),
  )..interceptors.add(Logging());

  Future<List<dynamic>> customersRequest() async {
    //print("initial membersRequest working");
    //CustomersModel? membersTableResponse;
    List<dynamic> customersResult;
    try {
      Response response = await _dio.get('crm/members/');
      print(response); // api response
      print("response working");
      print(response.data.runtimeType.toString());
      //membersTableResponse = MembersModel.fromJson(response.data);
      //membersResult = jsonDecode(response.data)['data'];
      customersResult = response.data;
      //membersResult =  response.data.;

      print(customersResult);
      print("customersResult working");
      return customersResult;
    } on DioError catch (e) {
      print("membersRequest not working 1");
      if (e.response != null) {
        print("membersRequest not working 2");
        // ErrorResponse(message: e.response?.data['message']);
        // debugPrint('Dio error!');
        // debugPrint('STATUS: ${e.response?.statusCode}');
        // debugPrint('DATA: ${e.response?.data['message']}');
        // debugPrint('HEADERS: ${e.response?.headers}');
      } else {
        print("membersRequest not working 3");
        // debugPrint('Error sending request!');
        // debugPrint(e.message);
      }
      rethrow;
    } catch (e) {
      rethrow;
    }
    //print(membersResult);
  }

  Future<List<dynamic>> fetchTableDataRequest(String id) async {
    List<dynamic> careerArticlesResult;
    try {
      Response response = await _dio.get('cms/collection/$id');
      print(response);
      print("Called");
      print(response.data.runtimeType.toString());

      careerArticlesResult = response.data;

      print(careerArticlesResult);
      print("leadResult working");
      return careerArticlesResult;
    } on DioError catch (e) {
      print("careerArticleResult not working 1");
      if (e.response != null) {
      } else {
        print("leadResult not working 3");
      }
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<dynamic>> fetchCollectionRequest() async {
    List<dynamic> colectionsResult;
    try {
      Response response = await _dio.get('cms/collections/');
      print(response);
      print("Called");
      print(response.data.runtimeType.toString());

      colectionsResult = response.data;

      print(colectionsResult);
      print("colectionsResult working");
      return colectionsResult;
    } on DioError catch (e) {
      print("colectionsResult not working 1");
      if (e.response != null) {
      } else {
        print("colectionsResult not working 3");
      }
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<dynamic>> newsArticleRequest() async {
    List<dynamic> newsArticleResult;
    try {
      Response response = await _dio.get('cms/collection/137');
      print(response); // api response
      print("Called");
      print(response.data.runtimeType.toString());
      //membersTableResponse = MembersModel.fromJson(response.data);
      //membersResult = jsonDecode(response.data)['data'];
      newsArticleResult = response.data;
      //membersResult =  response.data.;

      print(newsArticleResult);
      print("newsArticleResult working");
      return newsArticleResult;
    } on DioError catch (e) {
      print("newsArticleResult not working 1");
      if (e.response != null) {
        print("newsArticleResult not working 2");
      } else {
        print("newsArticleResult not working 3");
      }
      rethrow;
    } catch (e) {
      rethrow;
    }
    //print(membersResult);
  }

  Future<List<dynamic>> sustainabiltyRequest() async {
    List<dynamic> sustainabilityResult;
    try {
      Response response = await _dio.get('cms/collection/50');
      print(response); // api response
      print("Called");
      print(response.data.runtimeType.toString());
      //membersTableResponse = MembersModel.fromJson(response.data);
      //membersResult = jsonDecode(response.data)['data'];
      sustainabilityResult = response.data;
      //membersResult =  response.data.;

      print(sustainabilityResult);
      print("sustainabilityResult working");
      return sustainabilityResult;
    } on DioError catch (e) {
      print("sustainabilityResult not working 1");
      if (e.response != null) {
        print("sustainabilityResult not working 2");
      } else {
        print("sustainabilityResult not working 3");
      }
      rethrow;
    } catch (e) {
      rethrow;
    }
    //print(membersResult);
  }

  Future<List<dynamic>> profileRequest() async {
    List<dynamic> leadsResult;
    try {
      Response response = await _dio.post('api/profile/getprofile');
      print(response);
      print("Called");
      print("::::" + response.data.toString());
      print(response.data.runtimeType.toString());

      leadsResult = response.data;

      print("::::" + leadsResult.toString());
      print("leadResult working");
      return leadsResult;
    } on DioError catch (e) {
      print("leadResult not working 1");
      if (e.response != null) {
        print("leadResult not working 2");
      } else {
        print("leadResult not working 3");
      }
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future<EmailSubscribedResponse> subscribeEmail(String email) async {
    EmailSubscribedResponse? tableResponse;

    try {
      Response response = await _dio.post('cms/collection/148',
          options: Options(headers: {'x-rl-code': 'e5FfU86szNr3nRbmoyAnF4'}),
          data: {
            'subscribed_email': email,
          });
      print(response.data['message'].toString());

      tableResponse = EmailSubscribedResponse?.fromJson(response.data);
      print("apiprovider try works");
    } on DioError catch (e) {
      if (e.response != null) {
        debugPrint('Dio error!');
        debugPrint('STATUS: ${e.response?.statusCode}');
        debugPrint('DATA: ${e.response?.data['message']}');
        debugPrint('HEADERS: ${e.response?.headers}');
      } else {
        debugPrint('Error sending request!');
        debugPrint(e.message);
      }
    }
    return tableResponse!;
  }

  Future<RegistrationResponse> registerUser(String fname, String lname,
      String email, String number, String password) async {
    RegistrationResponse? registrationResponse;
    print(fname + " " + lname + " " + email + " " + number + " " + password);
    try {
      Response response = await _dio.post('api/auth/register',
          // options: Options(headers: {'x-rl-code': 'e5FfU86szNr3nRbmoyAnF4'}),
          data: {
            'firstName': 'nameko',
            'lastName': 'ito',
            'email': 'nameko@gmail.com',
            'mobileNumber': '09453126556',
            'password': 'welead123'
          });
      print(response.data['message'].toString());

      registrationResponse = RegistrationResponse?.fromJson(response.data);
      print("apiprovider try works");
    } on DioError catch (e) {
      if (e.response != null) {
        debugPrint('Dio error!');
        debugPrint('STATUS: ${e.response?.statusCode}');
        debugPrint('DATA: ${e.response?.data['message']}');
        debugPrint('HEADERS: ${e.response?.headers}');
      } else {
        debugPrint('Error sending request!');
        debugPrint(e.message);
      }
    }
    return registrationResponse!;
  }
}
