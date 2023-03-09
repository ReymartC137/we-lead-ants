import 'package:ants/presentation/screens/ourbrands/ourbrands.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import '../../../../widgets/theme.dart';
import '../../../../widgets/web/appbar.dart';
import '../../../../widgets/web/banner.dart';
import '../../../../widgets/web/custom_tabBar.dart';
import '../../../../widgets/web/drawer.dart';
import '../../../../widgets/web/footer_section.dart';

class OurBrandsGolfAndActiveLifestyle extends StatefulWidget {
  const OurBrandsGolfAndActiveLifestyle({super.key});

  @override
  State<OurBrandsGolfAndActiveLifestyle> createState() =>
      _OurBrandsGolfAndActiveLifestyleState();
}

class _OurBrandsGolfAndActiveLifestyleState
    extends State<OurBrandsGolfAndActiveLifestyle>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final TabController _tabController = TabController(length: 3, vsync: this);

    late int vh = 0;
    return Scaffold(
        drawerEnableOpenDragGesture: false,
        drawerEdgeDragWidth: 0,
        endDrawerEnableOpenDragGesture: false,
        appBar: PreferredSize(
            preferredSize: Size(size.width, 110), child: const CHAppBar()),
        endDrawer: const CHDrawer(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const CHBanner(
                imagePath: 'images/our-brands-banner.webp',
                title: 'OUR BRANDS',
                body:
                    'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lob.',
              ),
              SizedBox(
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(30),
                      width: 800,
                      child: TabBar(
                          onTap: (value) {
                            if (value == 0) {
                              context.go('/our-brands');
                            } else if (value == 1) {
                              context.go('food-and-beverages');
                            } else {
                              context.go('and-active-lifestyle');
                            }

                            vh = value;

                            print(vh);
                          },
                          padding: EdgeInsets.zero,
                          labelPadding: EdgeInsets.zero,
                          unselectedLabelColor: Colors.black,
                          unselectedLabelStyle:
                              CHTheme.lightTheme.textTheme.titleSmall,
                          labelColor: Colors.black,
                          labelStyle: CHTheme.lightTheme.textTheme.titleSmall,
                          controller: _tabController,
                          indicator: const BoxDecoration(),
                          tabs: [
                            CustomTabBar(
                              title: 'HOTELS',
                              action: () {
                                context.go('/our-brands');
                              },
                            ),
                            CustomTabBar(
                              title: 'FOOD & BEVERAGES',
                              action: () {
                                context.go('food-and-beverages');
                              },
                            ),
                            const Tab(text: 'GOLF & ACTIVE LIFESTYLE'),
                          ]),
                    ),
                    const GolfAndActiveLifeStyleSection(),
                  ],
                ),
              ),
              const FooterSection(),
            ],
          ),
        ));
  }
}
