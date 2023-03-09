import 'package:ants/widgets/constants/constants.dart';
import 'package:ants/widgets/theme.dart';
import 'package:ants/widgets/web/launch_url.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    var firstColumn = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
            width: 200, child: Image.asset('assets/icons/ants-finalfinal.png')),
        // Text("Ants",
        //     textAlign: TextAlign.left,
        //     style: CHTheme.lightTheme.textTheme.titleMedium
        //         ?.copyWith(color: Color(0xFF00A8E1))),
        SizedBox(
          height: size.width > 1000 ? 20 : 10,
        ),
        Text(
          "Unit 2102 Robinson's Galleria,\nCorporate Center, Edsa Corner Ortigas Avenue, \nQuezon City 1110 Philippines",
          style: size.width > 1000
              ? CHTheme.lightTheme.textTheme.titleSmall
              : CHTheme.lightTheme.textTheme.titleSmall?.copyWith(fontSize: 12),
        ),
        SizedBox(
          height: size.width > 1000 ? 20 : 10,
        ),
        Text(
          "© 2022 Ants. All Rights Reserved",
          style: size.width > 1000
              ? CHTheme.lightTheme.textTheme.titleSmall
              : CHTheme.lightTheme.textTheme.titleSmall?.copyWith(fontSize: 12),
        ),
      ],
    );

    var secondColumn = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: size.width > 1000 ? 20 : 10),
        InkWell(
          child: Text(
            "About Us",
            style: size.width > 1000
                ? CHTheme.lightTheme.textTheme.titleSmall
                : CHTheme.lightTheme.textTheme.titleSmall
                    ?.copyWith(fontSize: 12),
          ),
          onTap: () {
            ///context.go('/who-we-are');
          },
        ),
        const SizedBox(
          height: 5,
        ),
        InkWell(
          child: Text(
            "Our Brands",
            style: size.width > 1000
                ? CHTheme.lightTheme.textTheme.titleSmall
                : CHTheme.lightTheme.textTheme.titleSmall
                    ?.copyWith(fontSize: 12),
          ),
          onTap: () {
            //context.go('/our-brands');
          },
        ),
        const SizedBox(
          height: 5,
        ),
        InkWell(
          child: Text(
            "Offers",
            style: size.width > 1000
                ? CHTheme.lightTheme.textTheme.titleSmall
                : CHTheme.lightTheme.textTheme.titleSmall
                    ?.copyWith(fontSize: 12),
          ),
          onTap: () {},
        ),
        const SizedBox(
          height: 5,
        ),
        InkWell(
          child: Text(
            "Sustainability",
            style: size.width > 1000
                ? CHTheme.lightTheme.textTheme.titleSmall
                : CHTheme.lightTheme.textTheme.titleSmall
                    ?.copyWith(fontSize: 12),
          ),
          onTap: () {
            // context.go('/sustainability');
          },
        ),
        const SizedBox(
          height: 5,
        ),
        InkWell(
          child: Text(
            "News",
            style: size.width > 1000
                ? CHTheme.lightTheme.textTheme.titleSmall
                : CHTheme.lightTheme.textTheme.titleSmall
                    ?.copyWith(fontSize: 12),
          ),
          onTap: () {
            // context.go('/news');
          },
        ),
      ],
    );

    var thirdColumn = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: size.width > 1000 ? 20 : 10),
        InkWell(
          child: Text(
            "Meetings & Events",
            style: size.width > 1000
                ? CHTheme.lightTheme.textTheme.titleSmall
                : CHTheme.lightTheme.textTheme.titleSmall
                    ?.copyWith(fontSize: 12),
          ),
          onTap: () {},
        ),
        const SizedBox(
          height: 5,
        ),
        InkWell(
          child: Text(
            "Dining",
            style: size.width > 1000
                ? CHTheme.lightTheme.textTheme.titleSmall
                : CHTheme.lightTheme.textTheme.titleSmall
                    ?.copyWith(fontSize: 12),
          ),
          onTap: () {},
        ),
        const SizedBox(
          height: 5,
        ),
        InkWell(
          child: Text(
            "Business Development",
            style: size.width > 1000
                ? CHTheme.lightTheme.textTheme.titleSmall
                : CHTheme.lightTheme.textTheme.titleSmall
                    ?.copyWith(fontSize: 12),
          ),
          onTap: () {},
        ),
        const SizedBox(
          height: 5,
        ),
        InkWell(
          child: Text(
            "Careers",
            style: size.width > 1000
                ? CHTheme.lightTheme.textTheme.titleSmall
                : CHTheme.lightTheme.textTheme.titleSmall
                    ?.copyWith(fontSize: 12),
          ),
          onTap: () {
            // context.go('/careers');
          },
        ),
        const SizedBox(
          height: 5,
        ),
        InkWell(
          child: Text(
            "Privacy Policy & Website Terms",
            style: size.width > 1000
                ? CHTheme.lightTheme.textTheme.titleSmall
                : CHTheme.lightTheme.textTheme.titleSmall
                    ?.copyWith(fontSize: 12),
          ),
          onTap: () {},
        ),
      ],
    );

    var fourthColumn = Column(
      crossAxisAlignment: size.width > 800
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        SizedBox(height: size.width > 1000 ? 50 : 35),
        Text(
          "FOLLOW US",
          style: CHTheme.lightTheme.textTheme.titleMedium
              ?.copyWith(color: Color(0xFF00A8E1)),
        ),
        SizedBox(
          height: size.width > 1000 ? 20 : 10,
        ),
        Row(
          children: [
            InkWell(
              child: SvgPicture.asset(
                "images/facebook.svg",
                width: size.width > 1000 ? 48 : 32,
              ),
              onTap: () {
                launchFBURL();
              },
            ),
            const SizedBox(
              width: 5,
            ),
            InkWell(
              child: SvgPicture.asset(
                "images/instagram.svg",
                width: size.width > 1000 ? 48 : 32,
              ),
              onTap: () {
                /// launchIGURL();
              },
            ),
            const SizedBox(
              width: 5,
            ),
            InkWell(
              child: SvgPicture.asset(
                "images/linkedIn.svg",
                width: size.width > 1000 ? 48 : 32,
              ),
              onTap: () {
                //  launchLinkedInURL();
              },
            ),
          ],
        )
      ],
    );

    return Container(
      width: double.infinity,
      color: const Color(0xFFD9D9D9),
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 50),
      child: size.width > 800
          ? Row(
              mainAxisAlignment: size.width > 1000
                  ? MainAxisAlignment.spaceEvenly
                  : MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [firstColumn, secondColumn, thirdColumn, fourthColumn],
            )
          : size.width > 500
              ? Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        thirdColumn,
                        secondColumn,
                      ],
                    ),
                    const SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        firstColumn,
                        fourthColumn,
                      ],
                    )
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    thirdColumn,
                    const SizedBox(height: 50),
                    secondColumn,
                    const SizedBox(height: 50),
                    firstColumn,
                    const SizedBox(height: 50),
                    fourthColumn,
                    const SizedBox(height: 50),
                  ],
                ),
    );
  }
}
