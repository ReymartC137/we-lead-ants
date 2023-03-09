import 'package:ants/widgets/web/launch_url.dart';
import 'package:ants/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:go_router/go_router.dart';

import '../../services/bloc/tab_bloc/tab_bloc.dart';

class CHDrawer extends StatelessWidget {
  const CHDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => TabBloc()..add(Tab1Event(tab: 7)),
      child: SizedBox(
        width: 250,
        child: Drawer(
          child: SafeArea(
            right: false,
            child: ListView(
              padding: EdgeInsets.zero,
              controller: ScrollController(),
              children: [
                Container(
                  padding: EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 50,
                        child: Image.asset(
                          'assets/icons/ants-finalfinal-black.png',
                          alignment: Alignment.centerLeft,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ListTile(
                  title: Text(
                    'HOME',
                    maxLines: 1,
                    style: CHTheme.lightTheme.textTheme.titleSmall
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    context.go('/');
                  },
                ),
                // ListTile(
                //   title: Text(
                //     'WHO WE ARE',
                //     style: CHTheme.lightTheme.textTheme.titleSmall
                //         ?.copyWith(fontWeight: FontWeight.bold),
                //   ),
                //   onTap: () {
                //     context.go('/who-we-are');
                //   },
                // ),
                // ListTile(
                //   title: Text(
                //     'OUR BRANDS',
                //     style: CHTheme.lightTheme.textTheme.titleSmall
                //         ?.copyWith(fontWeight: FontWeight.bold),
                //   ),
                //   onTap: () {
                //     context.go('/our-brands');
                //   },
                // ),
                // ListTile(
                //   title: Text(
                //     'MANAGEMENT SERVICES',
                //     style: CHTheme.lightTheme.textTheme.titleSmall
                //         ?.copyWith(fontWeight: FontWeight.bold),
                //   ),
                //   onTap: () {
                //     context.go('/management-services');
                //   },
                // ),
                // ListTile(
                //   title: Text(
                //     'SUSTAINABILITY',
                //     style: CHTheme.lightTheme.textTheme.titleSmall
                //         ?.copyWith(fontWeight: FontWeight.bold),
                //   ),
                //   onTap: () {
                //     context.go('/sustainability');
                //   },
                // ),
                // ListTile(
                //   title: Text(
                //     'NEWS',
                //     style: CHTheme.lightTheme.textTheme.titleSmall
                //         ?.copyWith(fontWeight: FontWeight.bold),
                //   ),
                //   onTap: () {
                //     context.go('/news');
                //   },
                // ),
                // ListTile(
                //   title: Text(
                //     'CAREERS',
                //     style: CHTheme.lightTheme.textTheme.titleSmall
                //         ?.copyWith(fontWeight: FontWeight.bold),
                //   ),
                //   onTap: () {
                //     context.go('/careers');
                //   },
                // ),
                // ListTile(
                //   title: Text(
                //     'BOOK NOW',
                //     style: CHTheme.lightTheme.textTheme.titleSmall
                //         ?.copyWith(fontWeight: FontWeight.bold),
                //   ),
                //   onTap: () {
                //     launchURL();
                //   },
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
