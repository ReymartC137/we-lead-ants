import 'package:ants/presentation/routes/router.dart';
import 'package:ants/services/bloc/news_article_bloc/news_article_bloc.dart';
import 'package:ants/services/bloc/subscribed_email_bloc/subscribe_email_bloc.dart';
import 'package:ants/services/data/repositories/repositories.dart';
import 'package:ants/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_strategy/url_strategy.dart';

import 'services/bloc/tab_bloc/tab_bloc.dart';

void main() {
  runApp(const MyApp());
  setPathUrlStrategy();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SubscribeEmailBloc()),
        BlocProvider(
          create: (context) => TabBloc()..add(Tab1Event(tab: 3.3)),
        ),
        BlocProvider(
            create: ((context) => NewsArticleBloc(
                RepositoryProvider.of<ChromaRepository>(context))
              ..add(LoadNewsArticleEvent())))
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerDelegate: router.routerDelegate,
        routeInformationParser: router.routeInformationParser,
        routeInformationProvider: router.routeInformationProvider,
        title: 'Ants',
        theme: CHTheme.lightTheme,
      ),
    );
  }
}
