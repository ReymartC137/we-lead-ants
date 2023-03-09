import 'package:ants/presentation/routes/route_helper.dart';

import 'package:ants/widgets/button.dart';
import 'package:ants/widgets/theme.dart';
import 'package:ants/widgets/web/launch_url.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../services/bloc/collections_bloc/collections_bloc.dart';
import '../../services/bloc/tab_bloc/tab_bloc.dart';

class CHAppBar extends StatelessWidget {
  const CHAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: ((context, constraints) {
        if (constraints.maxWidth > 1200) {
          return const CHAppBar1();
        } else {
          return const CHAppBar2();
        }
      }),
    );
  }
}

class CHAppBar2 extends StatelessWidget {
  const CHAppBar2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double boxHeight = 20;
    return BlocProvider(
      create: (context) =>
          TabBloc()..add(Tab1Event(tab: size.width > 1000 ? 3.3 : 5)),
      child: Material(
        elevation: 10,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  context.go('/');
                },
                child: SizedBox(
                  //margin: const EdgeInsets.only(left: 25),
                  height: 200,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/icons/ants-finalfinal-logo.png',
                      width: 40,
                      height: 60,
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 0),
                child: InkWell(
                  onTap: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 8.0,
                    ),
                    child: Icon(Icons.menu),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CHAppBar1 extends StatelessWidget {
  const CHAppBar1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double boxHeight = 50;
    return Material(
      elevation: 10,
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        margin: size.width > 1525
            ? const EdgeInsets.symmetric(horizontal: 50)
            : const EdgeInsets.symmetric(horizontal: 20),
        child: SizedBox(
          width: 1600,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  context.go('/');
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: Image.asset(
                    'assets/icons/ants-finalfinal-logo.png',
                    height: 30,
                  ),
                ),
              ),
              Row(
                children: [
                  InkWell(
                      child: SizedBox(
                        height: boxHeight,
                        width: size.width > 1500 ? 110 : 80,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              'HOME',
                              maxLines: 1,
                              style: CHTheme.lightTheme.textTheme.titleSmall
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        //Get.toNamed(RouteHelper.initial);
                        context.go('/');
                        context
                            .read<CollectionsBloc>()
                            .add(LoadCollectionsEvent());
                      }),
                  // InkWell(
                  //   child: SizedBox(
                  //     height: boxHeight,
                  //     width: size.width > 1500 ? 150 : 120,
                  //     child: Padding(
                  //       padding: const EdgeInsets.all(8.0),
                  //       child: Center(
                  //         child: Text(
                  //           'WHO WE ARE',
                  //           style: CHTheme.lightTheme.textTheme.titleSmall
                  //               ?.copyWith(fontWeight: FontWeight.bold),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  //   onTap: () {
                  //     context.go('/who-we-are');
                  //     //Get.toNamed(RouteHelper.whoWeAre);
                  //   },
                  // ),
                  // InkWell(
                  //   child: SizedBox(
                  //     height: boxHeight,
                  //     width: size.width > 1500 ? 150 : 120,
                  //     child: Padding(
                  //       padding: const EdgeInsets.all(8.0),
                  //       child: Center(
                  //         child: Text(
                  //           'OUR BRANDS',
                  //           style: CHTheme.lightTheme.textTheme.titleSmall
                  //               ?.copyWith(fontWeight: FontWeight.bold),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  //   onTap: () {
                  //     //Get.toNamed(RouteHelper.ourBrands);
                  //     context.go('/our-brands');
                  //   },
                  // ),
                  // InkWell(
                  //   child: SizedBox(
                  //     height: boxHeight,
                  //     width: size.width > 1500 ? 250 : 140,
                  //     child: Padding(
                  //       padding: const EdgeInsets.all(8.0),
                  //       child: Center(
                  //         child: Text(
                  //           'MANAGEMENT SERVICES',
                  //           textAlign: TextAlign.center,
                  //           maxLines: 2,
                  //           style: CHTheme.lightTheme.textTheme.titleSmall
                  //               ?.copyWith(fontWeight: FontWeight.bold),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  //   onTap: () {
                  //     //Get.toNamed(RouteHelper.managementServices);
                  //     context.go('/management-services');
                  //   },
                  // ),
                  // InkWell(
                  //   child: SizedBox(
                  //     height: boxHeight,
                  //     width: 140,
                  //     child: Padding(
                  //       padding: const EdgeInsets.all(8.0),
                  //       child: Center(
                  //         child: Text('SUSTAINABILITY',
                  //             style: CHTheme.lightTheme.textTheme.titleSmall
                  //                 ?.copyWith(fontWeight: FontWeight.bold)),
                  //       ),
                  //     ),
                  //   ),
                  //   onTap: () {
                  //     context.go('/sustainability');
                  //     //Get.toNamed(RouteHelper.sustainability);
                  //   },
                  // ),
                  // InkWell(
                  //   child: SizedBox(
                  //     height: boxHeight,
                  //     width: size.width > 1500 ? 110 : 80,
                  //     child: Padding(
                  //       padding: const EdgeInsets.all(8.0),
                  //       child: Center(
                  //         child: Text(
                  //           'NEWS',
                  //           style: CHTheme.lightTheme.textTheme.titleSmall
                  //               ?.copyWith(fontWeight: FontWeight.bold),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  //   onTap: () {
                  //     context.go('/news');
                  //     //Get.toNamed(RouteHelper.news);
                  //   },
                  // ),
                  // InkWell(
                  //   child: SizedBox(
                  //     height: boxHeight,
                  //     width: size.width > 1500 ? 110 : 90,
                  //     child: Padding(
                  //       padding: const EdgeInsets.all(8.0),
                  //       child: Center(
                  //         child: Text(
                  //           'CAREERS',
                  //           style: CHTheme.lightTheme.textTheme.titleSmall
                  //               ?.copyWith(fontWeight: FontWeight.bold),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  //   onTap: () {
                  //     context.go('/careers');
                  //     //Get.toNamed(RouteHelper.careers);
                  //   },
                  // ),
                  // SizedBox(width: size.width > 1500 ? 10 : 5),
                  Container(
                    height: 48,
                    width: 170,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0)),
                    clipBehavior: Clip.antiAlias,
                    child: CHButton(
                      name: 'JOIN US',
                      type: CHButtonType.blue,
                      fontFamily: 'Avenir',
                      onPressed: () {
                        //launchURL();
                        //context.go('/registration');
                      },
                    ),
                  ),
                  //Image.asset('images/phone.png')
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
