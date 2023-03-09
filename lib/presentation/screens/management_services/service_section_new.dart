import 'package:ants/core/slide_fade_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../widgets/constants/constants.dart';
import '../../../widgets/widgets.dart';

class ServiceSectionNew extends StatefulWidget {
  const ServiceSectionNew({
    super.key,
  });

  @override
  State<ServiceSectionNew> createState() => _ServiceSectionNewState();
}

class _ServiceSectionNewState extends State<ServiceSectionNew>
    with TickerProviderStateMixin {
  late final AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  double containerHeight = 400;
  int maxText = 4;
  late bool hovered = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return VisibilityDetector(
      key: const ValueKey('management'),
      onVisibilityChanged: (info) {
        double visibleFraction = info.visibleFraction;
        final widgetToScreenFraction =
            MediaQuery.of(context).size.height / info.size.height;

        if (visibleFraction >=
            (widgetToScreenFraction > 1 ? 1 : widgetToScreenFraction) * .2) {
          controller.forward();
        } else {
          controller.reverse();
        }
      },
      child: AnimatedSlideFade(
        slideInitialPos: const Offset(0, .05),
        controller: controller,
        child: SizedBox(
          width: size.width,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              alignment: WrapAlignment.center,
              children: kManagement
                  .map(
                    (e) => MouseRegion(
                      onEnter: (event) {
                        setState(() {
                          containerHeight = 450;
                          maxText = 8;
                          hovered = true;
                        });
                      },
                      onExit: (event) {
                        setState(() {
                          containerHeight = 400;
                          maxText = 4;
                          hovered = false;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.all(10),
                        // color: Colors.red,
                        height: hovered ? e.boxHeight : containerHeight,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                              e.imagePath,
                              height: size.width > 1325 ? 225 : 175,
                              width: size.width > 1325 ? 225 : 175,
                            ),
                            const SizedBox(
                              height: CHGrid.large,
                            ),
                            SizedBox(
                              width: 370,
                              child: Text(
                                e.title,
                                style: CHTheme.lightTheme.textTheme.titleSmall
                                    ?.copyWith(
                                        fontFamily: 'Avenir',
                                        fontSize: size.width > 800 ? 25 : 20,
                                        color: CHColor.primaryColor,
                                        fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(
                              height: CHGrid.large,
                            ),
                            SizedBox(
                              width: 360,
                              child: Text(
                                e.description,
                                maxLines: hovered ? e.maxText : maxText,
                                overflow: TextOverflow.ellipsis,
                                style: CHTheme.lightTheme.textTheme.titleSmall
                                    ?.copyWith(
                                        fontFamily: 'Avenir',
                                        fontSize: size.width > 800 ? 18 : 14,
                                        color: CHColor.black,
                                        fontWeight: FontWeight.normal),
                                textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}

class ManagementService {
  final String imagePath;
  final String title;
  final String description;
  final double boxHeight;
  final int maxText;

  const ManagementService(
      {required this.maxText,
      required this.boxHeight,
      required this.imagePath,
      required this.title,
      required this.description});
}

const kManagement = [
  ManagementService(
      maxText: 6,
      boxHeight: 600,
      imagePath: 'images/hotel_operations.svg',
      title: 'Hotel Operations',
      description:
          'We provide proper training for all operational functions and strategic direction while overseeing all aspects of hotel operations. This includes regular financial and operation reviews to gauge and adjust strategies as needed.'),
  ManagementService(
      maxText: 9,
      boxHeight: 600,
      imagePath: 'images/sales_marketing.svg',
      title: 'Sales & Marketing',
      description:
          'The award-winning sales and marketing team of Chroma Hospitality can assist in the building the full suite services needed by properties and brands. The full suite includes room sales, banquets sales, account management, brand positioning, building brand equity, marketing communications, digital marketing and public relations, to name a few.'),
  ManagementService(
      maxText: 10,
      boxHeight: 600,
      imagePath: 'images/e-commerce.svg',
      title: 'E-commerce',
      description:
          'The subject matter experts of our E-Commerce team can build your online presence and capitalize on this even before the property is open. We can strategize and build the online footprint through customized campaigns – from pay-per-click ads, SEO /SEM, programmatic ads, to building a rapport with online travel agents, we have got you covered. Included in the E-Commerce service suite is the'),
  ManagementService(
      maxText: 7,
      boxHeight: 600,
      imagePath: 'images/brand_repositioning.svg',
      title: 'Brand Repositioning',
      description:
          'Look no further if you need to revamp or rebrand your existing business. The team can readily study your requirements and provide efficient solutions in bringing a new life to your brand through in-depth studies, market research, financial audits, strategy building and execution.'),
  ManagementService(
      maxText: 6,
      boxHeight: 600,
      imagePath: 'images/human_resources_management.svg',
      title: 'Human Resources Management',
      description:
          'We provide support in building your human resource practices that will lead to efficiently build your team. These include workforce planning, labor and talent management, training programs and human resource audits.'),
  ManagementService(
      maxText: 6,
      boxHeight: 600,
      imagePath: 'images/technical_service.svg',
      title: 'Technical Services',
      description:
          'These services encompass business needs such as project inception and vendor selection, architectural and interior design evaluation, engineering review, development management, project close-out and transfer.'),
  ManagementService(
      maxText: 9,
      boxHeight: 700,
      imagePath: 'images/preopening.svg',
      title: 'Pre-opening',
      description:
          'With 7 properties successfully opened, Chroma takes pride in being able to provide a vital service in the hotel business which is to project and forecast revenues to ensure the profitability and feasibility of a property. We can guide your team in building these projections while creating promotional strategies in building the equity of your hotel and brand as we await its opening.')
];
