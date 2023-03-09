import 'package:ants/presentation/routes/route_helper.dart';
import 'package:ants/presentation/routes/route_name.dart';
import 'package:ants/widgets/web/custom_tabBar.dart';
import 'package:ants/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import 'crimson_section.dart';
import 'ourbrands.dart';
import 'ourbrands_subsection/ourbrands_foodandbeverages.dart';
import 'ourbrands_subsection/ourbrands_golfandactivelifestyle.dart';

class OurBrandsTabBar extends StatefulWidget {
  const OurBrandsTabBar({super.key});

  @override
  State<OurBrandsTabBar> createState() => _OurBrandsTabBarState();
}

class _OurBrandsTabBarState extends State<OurBrandsTabBar>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final TabController _tabController = TabController(length: 3, vsync: this);
    double height = size.height * 3.7;
    late int vh = 0;

    return SizedBox(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(30),
            width: 800,
            child: TabBar(
                onTap: (value) {
                  if (value == 0) {
                    context.go('/our-brands');
                    setState(() {
                      vh = value;
                    });
                  } else if (value == 1) {
                    //context.go('food-and-beverages');
                    setState(() {
                      vh = value;
                    });
                    print(vh);
                  } else {
                    context.go('golf_and_active_lifestyle');
                  }
                },
                padding: EdgeInsets.zero,
                labelPadding: EdgeInsets.zero,
                labelColor: Colors.black,
                labelStyle: CHTheme.lightTheme.textTheme.titleSmall,
                controller: _tabController,
                unselectedLabelColor: Colors.black,
                unselectedLabelStyle: CHTheme.lightTheme.textTheme.titleSmall,
                indicator: BoxDecoration(),
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
                      context.goNamed(foodAndBev);
                    },
                  ),
                  const Tab(text: 'GOLF & ACTIVE LIFESTYLE'),
                ]),
          ),
          const CrimsonSection(),
        ],
      ),
    );
  }
}
