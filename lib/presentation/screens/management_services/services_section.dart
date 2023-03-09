import 'package:ants/core/slide_fade_widget.dart';
import 'package:ants/widgets/constants/constants.dart';
import 'package:ants/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ServicesSectionResponsive extends StatelessWidget {
  const ServicesSectionResponsive({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sz = MediaQuery.of(context).size;
    return LayoutBuilder(builder: ((context, constraints) {
      var size = MediaQuery.of(context).size;
      if (constraints.maxWidth <= 1324 && constraints.maxWidth >= 1301) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                services(
                    size,
                    'images/hotel_operations.svg',
                    'Hotel Operations',
                    'We provide proper training for all operational functions and strategic direction while overseeing all aspects of hotel operations. This includes regular financial and operation reviews to gauge and adjust strategies as needed.'),
                const SizedBox(
                  width: 50,
                ),
                services(
                    size,
                    'images/sales_marketing.svg',
                    'Sales & Marketing',
                    'The award-winning sales and marketing team of Chroma Hospitality can assist in the building the full suite services needed by properties and brands. The full suite includes room sales, banquets sales, account management, brand positioning, building brand equity, marketing communications, digital marketing and public relations, to name a few.'),
                const SizedBox(
                  width: 50,
                ),
                services(size, 'images/e-commerce.svg', 'E-commerce',
                    'The subject matter experts of our E-Commerce team can build your online presence and capitalize on this even before the property is open. We can strategize and build the online footprint through customized campaigns – from pay-per-click ads, SEO /SEM, programmatic ads, to building a rapport with online travel agents, we have got you covered. Included in the E-Commerce service suite is the'),
                const SizedBox(
                  width: 50,
                ),
                services(
                    size,
                    'images/brand_repositioning.svg',
                    'Brand Repositioning',
                    'Look no further if you need to revamp or rebrand your existing business. The team can readily study your requirements and provide efficient solutions in bringing a new life to your brand through in-depth studies, market research, financial audits, strategy building and execution.')
              ],
            ),
            const SizedBox(
              height: CHGrid.large,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                services(
                    size,
                    'images/human_resources_management.svg',
                    'Human Resources Management',
                    'We provide support in building your human resource practices that will lead to efficiently build your team. These include workforce planning, labor and talent management, training programs and human resource audits.'),
                const SizedBox(
                  width: 50,
                ),
                services(
                    size,
                    'images/technical_service.svg',
                    'Technical Services',
                    'These services encompass business needs such as project inception and vendor selection, architectural and interior design evaluation, engineering review, development management, project close-out and transfer.'),
                const SizedBox(
                  width: 50,
                ),
                services(size, 'images/preopening.svg', 'Pre-opening',
                    'With 7 properties successfully opened, Chroma takes pride in being able to provide a vital service in the hotel business which is to project and forecast revenues to ensure the profitability and feasibility of a property. We can guide your team in building these projections while creating promotional strategies in building the equity of your hotel and brand as we await its opening.'),
              ],
            ),
          ],
        );
      } else if (constraints.maxWidth <= 1200 && constraints.maxWidth >= 1000) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                services(
                    size,
                    'images/hotel_operations.svg',
                    'Hotel Operations',
                    'We provide proper training for all operational functions and strategic direction while overseeing all aspects of hotel operations. This includes regular financial and operation reviews to gauge and adjust strategies as needed.'),
                SizedBox(
                  width: size.width > 1120 ? 20 : 0,
                ),
                services(
                    size,
                    'images/sales_marketing.svg',
                    'Sales & Marketing',
                    'The award-winning sales and marketing team of Chroma Hospitality can assist in the building the full suite services needed by properties and brands. The full suite includes room sales, banquets sales, account management, brand positioning, building brand equity, marketing communications, digital marketing and public relations, to name a few.'),
                SizedBox(
                  width: size.width > 1120 ? 20 : 0,
                ),
                services(size, 'images/e-commerce.svg', 'E-commerce',
                    'The subject matter experts of our E-Commerce team can build your online presence and capitalize on this even before the property is open. We can strategize and build the online footprint through customized campaigns – from pay-per-click ads, SEO /SEM, programmatic ads, to building a rapport with online travel agents, we have got you covered. Included in the E-Commerce service suite is the'),
              ],
            ),
            const SizedBox(
              height: CHGrid.large,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                services(
                    size,
                    'images/brand_repositioning.svg',
                    'Brand Repositioning',
                    'Look no further if you need to revamp or rebrand your existing business. The team can readily study your requirements and provide efficient solutions in bringing a new life to your brand through in-depth studies, market research, financial audits, strategy building and execution.'),
                SizedBox(
                  width: size.width > 1120 ? 20 : 0,
                ),
                services(
                    size,
                    'images/human_resources_management.svg',
                    'Human Resources Management',
                    'We provide support in building your human resource practices that will lead to efficiently build your team. These include workforce planning, labor and talent management, training programs and human resource audits.'),
                SizedBox(
                  width: size.width > 1120 ? 20 : 0,
                ),
                services(
                    size,
                    'images/technical_service.svg',
                    'Technical Services',
                    'These services encompass business needs such as project inception and vendor selection, architectural and interior design evaluation, engineering review, development management, project close-out and transfer.'),
              ],
            ),
            const SizedBox(
              height: CHGrid.large,
            ),
            services(size, 'images/preopening.svg', 'Pre-opening',
                'With 7 properties successfully opened, Chroma takes pride in being able to provide a vital service in the hotel business which is to project and forecast revenues to ensure the profitability and feasibility of a property. We can guide your team in building these projections while creating promotional strategies in building the equity of your hotel and brand as we await its opening.'),
          ],
        );
      } else if (constraints.maxWidth <= 999 && constraints.maxWidth >= 685) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                services(
                    size,
                    'images/hotel_operations.svg',
                    'Hotel Operations',
                    'We provide proper training for all operational functions and strategic direction while overseeing all aspects of hotel operations. This includes regular financial and operation reviews to gauge and adjust strategies as needed.'),
                const SizedBox(
                  width: 30,
                ),
                services(
                    size,
                    'images/sales_marketing.svg',
                    'Sales & Marketing',
                    'The award-winning sales and marketing team of Chroma Hospitality can assist in the building the full suite services needed by properties and brands. The full suite includes room sales, banquets sales, account management, brand positioning, building brand equity, marketing communications, digital marketing and public relations, to name a few.'),
              ],
            ),
            const SizedBox(
              height: CHGrid.large,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                services(size, 'images/e-commerce.svg', 'E-commerce',
                    'The subject matter experts of our E-Commerce team can build your online presence and capitalize on this even before the property is open. We can strategize and build the online footprint through customized campaigns – from pay-per-click ads, SEO /SEM, programmatic ads, to building a rapport with online travel agents, we have got you covered. Included in the E-Commerce service suite is the'),
                const SizedBox(
                  width: 30,
                ),
                services(
                    size,
                    'images/brand_repositioning.svg',
                    'Brand Repositioning',
                    'Look no further if you need to revamp or rebrand your existing business. The team can readily study your requirements and provide efficient solutions in bringing a new life to your brand through in-depth studies, market research, financial audits, strategy building and execution.'),
              ],
            ),
            const SizedBox(
              height: CHGrid.large,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                services(
                    size,
                    'images/human_resources_management.svg',
                    'Human Resources Management',
                    'We provide support in building your human resource practices that will lead to efficiently build your team. These include workforce planning, labor and talent management, training programs and human resource audits.'),
                const SizedBox(
                  width: 30,
                ),
                services(
                    size,
                    'images/technical_service.svg',
                    'Technical Services',
                    'These services encompass business needs such as project inception and vendor selection, architectural and interior design evaluation, engineering review, development management, project close-out and transfer.'),
              ],
            ),
            const SizedBox(
              height: CHGrid.large,
            ),
            services(size, 'images/preopening.svg', 'Pre-opening',
                'With 7 properties successfully opened, Chroma takes pride in being able to provide a vital service in the hotel business which is to project and forecast revenues to ensure the profitability and feasibility of a property. We can guide your team in building these projections while creating promotional strategies in building the equity of your hotel and brand as we await its opening.'),
          ],
        );
        //  && constraints.maxWidth >= 450
      } else if (constraints.maxWidth <= 684) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            services(size, 'images/hotel_operations.svg', 'Hotel Operations',
                'We provide proper training for all operational functions and strategic direction while overseeing all aspects of hotel operations. This includes regular financial and operation reviews to gauge and adjust strategies as needed.'),
            const SizedBox(
              height: 75,
            ),
            services(size, 'images/sales_marketing.svg', 'Sales & Marketing',
                'The award-winning sales and marketing team of Chroma Hospitality can assist in the building the full suite services needed by properties and brands. The full suite includes room sales, banquets sales, account management, brand positioning, building brand equity, marketing communications, digital marketing and public relations, to name a few.'),
            const SizedBox(
              height: 75,
            ),
            services(size, 'images/e-commerce.svg', 'E-commerce',
                'The subject matter experts of our E-Commerce team can build your online presence and capitalize on this even before the property is open. We can strategize and build the online footprint through customized campaigns – from pay-per-click ads, SEO /SEM, programmatic ads, to building a rapport with online travel agents, we have got you covered. Included in the E-Commerce service suite is the'),
            const SizedBox(
              height: 75,
            ),
            services(
                size,
                'images/brand_repositioning.svg',
                'Brand Repositioning',
                'Look no further if you need to revamp or rebrand your existing business. The team can readily study your requirements and provide efficient solutions in bringing a new life to your brand through in-depth studies, market research, financial audits, strategy building and execution.'),
            const SizedBox(
              height: 75,
            ),
            services(
                size,
                'images/human_resources_management.svg',
                'Human Resources Management',
                'We provide support in building your human resource practices that will lead to efficiently build your team. These include workforce planning, labor and talent management, training programs and human resource audits.'),
            SizedBox(
              height: 75,
            ),
            services(size, 'images/technical_service.svg', 'Technical Services',
                'These services encompass business needs such as project inception and vendor selection, architectural and interior design evaluation, engineering review, development management, project close-out and transfer.'),
            SizedBox(
              height: 75,
            ),
            services(size, 'images/preopening.svg', 'Pre-opening',
                'With 7 properties successfully opened, Chroma takes pride in being able to provide a vital service in the hotel business which is to project and forecast revenues to ensure the profitability and feasibility of a property. We can guide your team in building these projections while creating promotional strategies in building the equity of your hotel and brand as we await its opening.'),
          ],
        );
      } else {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                services(
                    size,
                    'images/hotel_operations.svg',
                    'Hotel Operations',
                    'We provide proper training for all operational functions and strategic direction while overseeing all aspects of hotel operations. This includes regular financial and operation reviews to gauge and adjust strategies as needed.'),
                services(
                    size,
                    'images/sales_marketing.svg',
                    'Sales & Marketing',
                    'The award-winning sales and marketing team of Chroma Hospitality can assist in the building the full suite services needed by properties and brands. The full suite includes room sales, banquets sales, account management, brand positioning, building brand equity, marketing communications, digital marketing and public relations, to name a few.'),
                services(size, 'images/e-commerce.svg', 'E-commerce',
                    'The subject matter experts of our E-Commerce team can build your online presence and capitalize on this even before the property is open. We can strategize and build the online footprint through customized campaigns – from pay-per-click ads, SEO /SEM, programmatic ads, to building a rapport with online travel agents, we have got you covered. Included in the E-Commerce service suite is the'),
                services(
                    size,
                    'images/brand_repositioning.svg',
                    'Brand Repositioning',
                    'Look no further if you need to revamp or rebrand your existing business. The team can readily study your requirements and provide efficient solutions in bringing a new life to your brand through in-depth studies, market research, financial audits, strategy building and execution.')
              ],
            ),
            const SizedBox(
              height: CHGrid.xLarge,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                services(
                    size,
                    'images/human_resources_management.svg',
                    'Human Resources Management',
                    'We provide support in building your human resource practices that will lead to efficiently build your team. These include workforce planning, labor and talent management, training programs and human resource audits.'),
                const SizedBox(
                  width: 50,
                ),
                services(
                    size,
                    'images/technical_service.svg',
                    'Technical Services',
                    'These services encompass business needs such as project inception and vendor selection, architectural and interior design evaluation, engineering review, development management, project close-out and transfer.'),
                const SizedBox(
                  width: 50,
                ),
                services(size, 'images/preopening.svg', 'Pre-opening',
                    'With 7 properties successfully opened, Chroma takes pride in being able to provide a vital service in the hotel business which is to project and forecast revenues to ensure the profitability and feasibility of a property. We can guide your team in building these projections while creating promotional strategies in building the equity of your hotel and brand as we await its opening.'),
              ],
            ),
          ],
        );
      }
    }));
  }
}

class ServicesSection extends StatefulWidget {
  const ServicesSection({Key? key}) : super(key: key);

  @override
  State<ServicesSection> createState() => _ServicesSectionState();
}

class _ServicesSectionState extends State<ServicesSection>
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
          //controller.reverse();
        }
      },
      child: Container(
          width: double.infinity,
          color: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 100),
          child: AnimatedSlideFade(
              slideInitialPos: const Offset(0, .05),
              controller: controller,
              child: const ServicesSectionResponsive())),
    );
  }
}

Widget services(Size size, String imagePath, String title, String description) {
  return Container(
    child: Column(
      children: [
        SvgPicture.asset(
          imagePath,
          height: size.width > 1325 ? 200 : 160,
          width: size.width > 1325 ? 215 : 165,
        ),
        const SizedBox(
          height: CHGrid.large,
        ),
        SizedBox(
          width: 360,
          child: Text(
            title,
            style: CHTheme.lightTheme.textTheme.titleSmall?.copyWith(
                fontFamily: 'Avenir',
                fontSize: size.width > 800 ? 23 : 20,
                color: CHColor.primaryColor,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: CHGrid.large,
        ),
        SizedBox(
          width: 300,
          child: Text(
            description,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style: CHTheme.lightTheme.textTheme.titleSmall?.copyWith(
                fontFamily: 'Avenir',
                fontSize: size.width > 800 ? 18 : 14,
                color: CHColor.black,
                fontWeight: FontWeight.normal),
            textAlign: TextAlign.center,
          ),
        )
      ],
    ),
  );
}
