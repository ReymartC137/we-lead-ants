import 'package:ants/tmbt-privacy-policy/core/constants/name.dart';
import 'package:ants/tmbt-privacy-policy/core/widgets/spacers/tmbt_spacer.dart';
import 'package:flutter/material.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'BIKE PARK PRIVACY POLICY',
          style: Theme.of(context).textTheme.headline4,
        ),
        VerticalSpacers.large,
        Text(
          'BIKE PARK PRIVACY POLICY:',
          style: Theme.of(context).textTheme.headline6,
        ),
        VerticalSpacers.large,
        Text.rich(
          const TextSpan(
            children: [
              TextSpan(
                text: tmbpName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text:
                    ', is committed in ensuring the protection and security of the personal information and sensitive personal information (collectively referred to herein as “personal information“) provided to us by our guests and clients. As part of our commitment,  we are dedicated in promoting the culture of privacy consistent with the Republic Act No. 10173 or the Data Privacy Act of 2012, its implementing rules and regulations, related administrative issuance and other applicable laws. We at ',
              ),
              TextSpan(
                text: tmbpName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text:
                    ', collect and process your personal information only in strict adherence to the principles of transparency, legitimate purpose and proportionality.',
              ),
            ],
          ),
          style: Theme.of(context).textTheme.headline6,
        ),
      ],
    );
  }
}
