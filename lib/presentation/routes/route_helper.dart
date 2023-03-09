import 'package:ants/presentation/screens/ourbrands/golf_and_active_lifestyle_%20section.dart';
import 'package:ants/presentation/screens/ourbrands/ourbrands_subsection/ourbrands_foodandbeverages.dart';
import 'package:ants/presentation/screens/sustainability/sustainabilty_articles/sustainability_article_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../services/data/repositories/repositories.dart';
import '../screens/careers/careers_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/management_services/management_services_screen.dart';
import '../screens/news/news_article_screen.dart';
import '../screens/news/news_screen.dart';
import '../screens/ourbrands/ourbrands_screen.dart';
import '../screens/ourbrands/ourbrands_subsection/ourbrands_golfandactivelifestyle.dart';
import '../screens/sustainability/sustainability_screen.dart';
import '../screens/whoweare/whoweare_screen.dart';

class RouteHelper {
  static const String initial = "/";
  static const String whoWeAre = "/who-we-are";
  static const String ourBrands = "/our-brands";
  static const String managementServices = "/management-services";
  static const String sustainability = "/sustainability";
  static const String sustainabilityArticleScreen =
      "/sustainability-article-screen";
  static const String news = "/news";
  static const String careers = "/careeers";
  static const String newsArticle = "/news-article";
  static const String ourBrandsFoodBev = "/our-brands/food-and-beverages";
  static const String ourBrandsGolfActiv =
      "/our-brands/golf_and_active_lifestyle";
  static String articlePage(String imagePath) =>
      '$newsArticle?imagePath=$imagePath';

  static List<GetPage> routes = [
    GetPage(
        name: initial,
        page: () => RepositoryProvider(
              create: (context) => CollectionsRepository(),
              child: CHHomePage(),
            )),
    GetPage(
        //transition: Transition.noTransition,
        name: whoWeAre,
        page: () => CHWhoWeArePage()),
    GetPage(
        //transition: Transition.noTransition,
        name: ourBrands,
        page: () => CHOurBrands()),
    GetPage(
        //transition: Transition.noTransition,
        name: ourBrandsFoodBev,
        page: () => OurBrandsFoodBeverages()),
    GetPage(
        //transition: Transition.noTransition,
        name: ourBrandsGolfActiv,
        page: () => OurBrandsGolfAndActiveLifestyle()),
    GetPage(
        //transition: Transition.noTransition,
        name: managementServices,
        page: () => CHManagementPage()),
    GetPage(
        //transition: Transition.noTransition,
        name: sustainability,
        page: () => CHSustainabilityPage()),
    GetPage(
        //transition: Transition.noTransition,
        name: news,
        page: () => CHNewsPage()),
    GetPage(
        //transition: Transition.noTransition,
        name: careers,
        page: () => CHCareersPage()),
    GetPage(
        // transition: Transition.noTransition,
        name: newsArticle,
        page: () {
          var image = Get.parameters['imagePath'];

          return NewsArticleScreen(
            imagePath: image!,
          );
        }),
    // GetPage(
    //     //transition: Transition.noTransition,
    //     name: sustainabilityArticleScreen,
    //     page: () => SustainabilityArticleScreen()),
  ];
}
