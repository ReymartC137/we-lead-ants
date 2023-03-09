import 'package:ants/services/data/models/collections_model.dart';
import 'package:ants/services/data/models/email_subscribed_response.dart';
import 'package:ants/services/data/models/registration_response.dart';
import 'package:ants/services/data/models/sustainability_model.dart';

import '../api/api_provider.dart';
import '../models/NewsArticleModel.dart';

class CollectionsRepository {
  final provider = ApiProvider();
  Future<List<CollectionsModel>> getCollection() async {
    try {
      final List collectionResult = await provider.fetchCollectionRequest();
      print('????/' + collectionResult.toString());
      return collectionResult.map((e) => CollectionsModel.fromJson(e)).toList();
    } catch (e) {
      print(e.toString());
      throw Exception("Failed to load collections");
    }
  }
}

class ChromaRepository {
  final provider = ApiProvider();
  Future<List<NewsArticleModel>> getNewsArticle() async {
    try {
      final List newsArticleResult = await provider.newsArticleRequest();
      print('????/' + newsArticleResult.toString());
      return newsArticleResult
          .map((e) => NewsArticleModel.fromJson(e))
          .toList();
    } catch (e) {
      print(e.toString());
      throw Exception("Failed to load news Article");
    }
  }

  Future<List<SustainabilityModel>> getSustainabilityArticle() async {
    try {
      final List sustainabilityResult = await provider.sustainabiltyRequest();
      print('????/' + sustainabilityResult.toString());
      return sustainabilityResult
          .map((e) => SustainabilityModel.fromJson(e))
          .toList();
    } catch (e) {
      print(e.toString());
      throw Exception("Failed to load Sustainability");
    }
  }

  Future<EmailSubscribedResponse> subscribeEmail(String email) async {
    try {
      final emailSubsribedResult = await provider.subscribeEmail(email);
      print('????/' + emailSubsribedResult.toString());
      return EmailSubscribedResponse.fromJson(emailSubsribedResult.toJson());
      ;
    } catch (e) {
      print(e.toString());
      throw Exception("Failed to load email sub");
    }
  }

  Future<RegistrationResponse> register(String fname, String lname,
      String email, String number, String password) async {
    try {
      final registerResponse =
          await provider.registerUser(fname, lname, email, number, password);
      print('????/' + registerResponse.toString());
      return RegistrationResponse.fromJson(registerResponse.toJson());
      ;
    } catch (e) {
      print(e.toString());
      throw Exception("Failed to load email sub");
    }
  }
}
