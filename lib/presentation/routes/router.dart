import 'package:ants/authentication/login/login_screen.dart';
import 'package:ants/authentication/login/registration_section.dart';
import 'package:ants/presentation/routes/route_name.dart';
import 'package:ants/presentation/screens/careers/careers_screen.dart';
import 'package:ants/presentation/screens/home/home_screen.dart';
import 'package:ants/presentation/screens/management_services/management_services_screen.dart';
import 'package:ants/presentation/screens/news/news_screen.dart';
import 'package:ants/presentation/screens/ourbrands/ourbrands_screen.dart';
import 'package:ants/presentation/screens/sustainability/sustainability_screen.dart';
import 'package:ants/presentation/screens/sustainability/sustainabilty_articles/sustainability_article_screen.dart';
import 'package:ants/presentation/screens/whoweare/whoweare_screen.dart';
import 'package:ants/tmbt-privacy-policy/tmbt_privacy_policy.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../services/data/repositories/repositories.dart';
import '../screens/ourbrands/ourbrands_subsection/ourbrands_foodandbeverages.dart';
import '../screens/ourbrands/ourbrands_subsection/ourbrands_golfandactivelifestyle.dart';

final router = GoRouter(
  //This remove the hashtags of the URL, However i can't find the solution for refreshing the screen
  // urlPathStrategy: UrlPathStrategy.path,
  initialLocation: '/',
  routes: <GoRoute>[
    GoRoute(
        path: '/',
        pageBuilder: (context, state) {
          return NoTransitionPage(
            key: state.pageKey,
            child: RepositoryProvider(
              create: (context) => ChromaRepository(),
              child: const CHHomePage(),
            ),
          );
        }),
    GoRoute(
        path: '/who-we-are',
        pageBuilder: (context, state) {
          return NoTransitionPage(
            key: state.pageKey,
            child: const CHWhoWeArePage(),
          );
        }),
    GoRoute(
        name: foodAndBev,
        path: '/food-and-beverages',
        pageBuilder: (context, state) {
          return NoTransitionPage(
            key: state.pageKey,
            child: const OurBrandsFoodBeverages(),
          );
        }),
    GoRoute(
        // name: foodAndBev,
        path: '/registration',
        pageBuilder: (context, state) {
          return NoTransitionPage(
            key: state.pageKey,
            child: const LoginScreen(),
          );
        }),
    GoRoute(
        path: '/our-brands',
        pageBuilder: (context, state) {
          return NoTransitionPage(
            key: state.pageKey,
            child: const CHOurBrands(),
          );
        },
        routes: [
          GoRoute(
              path: 'golf_and_active_lifestyle',
              pageBuilder: (context, state) {
                return NoTransitionPage(
                  key: state.pageKey,
                  child: const OurBrandsGolfAndActiveLifestyle(),
                );
              }),
        ]),
    GoRoute(
        path: '/management-services',
        pageBuilder: (context, state) {
          return NoTransitionPage(
            key: state.pageKey,
            child: const CHManagementPage(),
          );
        }),
    GoRoute(
        path: '/sustainability',
        pageBuilder: (context, state) {
          return NoTransitionPage(
            key: state.pageKey,
            child: RepositoryProvider(
              create: (context) => ChromaRepository(),
              child: const CHSustainabilityPage(),
            ),
          );
        },
        routes: [
          GoRoute(
              name: sustainabilityArticle,
              path: 'sustainability-article/:path',
              pageBuilder: (context, state) {
                //print("id::" + state.params['path'].toString());
                return NoTransitionPage(
                  key: state.pageKey,
                  child: RepositoryProvider(
                    create: (context) => ChromaRepository(),
                    child: SustainabilityArticleScreen(
                        id: (state.params['path']!)),
                  ),
                );
              }),
        ]),
    GoRoute(
        path: '/news',
        pageBuilder: (context, state) {
          return NoTransitionPage(
            key: state.pageKey,
            child: RepositoryProvider(
              create: (context) => ChromaRepository(),
              child: const CHNewsPage(),
            ),
          );
        }),
    GoRoute(
        path: '/careers',
        pageBuilder: (context, state) {
          return NoTransitionPage(
            key: state.pageKey,
            child: const CHCareersPage(),
          );
        }),
    GoRoute(
        path: '/tmbp-privacy-policy',
        pageBuilder: (context, state) {
          return NoTransitionPage(
            key: state.pageKey,
            child: const TMBTPrivacyPolicyScreen(),
          );
        }),
  ],
);
