import 'package:ants/presentation/screens/home/home.dart';
import 'package:ants/widgets/constants/constants.dart';
import 'package:ants/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../widgets/web/launch_url.dart';

class FollowUsSection extends StatelessWidget {
  const FollowUsSection({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 0.0),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'FOLLOW US',
              style: CHTheme.lightTheme.textTheme.titleMedium?.copyWith(
                  color: CHColor.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  height: 1.5),
            ),
            const SizedBox(
              height: CHGrid.small,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  child: SvgPicture.asset(
                    "images/facebook.svg",
                    width: size.width > 1000 ? 70 : 32,
                  ),
                  onTap: () {
                    launchFBURL();
                  },
                ),
                const SizedBox(
                  width: CHGrid.medium,
                ),
                InkWell(
                  child: SvgPicture.asset(
                    "images/linkedIn.svg",
                    width: size.width > 1000 ? 70 : 32,
                  ),
                  onTap: () {
                    launchLinkedInURL();
                  },
                ),
              ],
            )
          ],
        ));
  }
}
