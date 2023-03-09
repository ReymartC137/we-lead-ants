import 'package:ants/tmbt-privacy-policy/core/constants/name.dart';
import 'package:ants/tmbt-privacy-policy/core/constants/paddings.dart';
import 'package:ants/tmbt-privacy-policy/core/widgets/spacers/tmbt_spacer.dart';
import 'package:flutter/material.dart';

const _thirdPartyPartners = [
  'Subsidiaries and/or affiliates of $tmbpName, within the Filinvest Group',
  'Other hotels operated under the Chroma Hospitality portfolio',
  '''
Third party service providers such as but not limited to:
        a. Manpower services/agencies
        b. Information Systems providers
        c. Security Agencies;
        d. Information systems providers/vendors and''',
  'Contractors and Sub-contractors.'
];

class SharingAndDisclosure extends StatelessWidget {
  const SharingAndDisclosure({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'SHARING AND DISCLOSURE',
          style: Theme.of(context).textTheme.headline4,
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
                    ', shall hold your personal information in strict confidence. However, ',
              ),
              TextSpan(
                text: tmbpName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text:
                    ' may disclose and share your personal information as may be reasonably necessary and only for the purposes set out in this Policy to the following third-party partners',
              ),
            ],
          ),
          style: Theme.of(context).textTheme.headline6,
        ),
        VerticalSpacers.xxxxxLarge,
        Padding(
          padding: const EdgeInsets.only(left: Paddings.xxLarge),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...List.generate(
                _thirdPartyPartners.length,
                (index) => Text(
                  '${index + 1}. ${_thirdPartyPartners[index]}',
                  style: Theme.of(context).textTheme.headline6,
                ),
              )
            ],
          ),
        ),
        VerticalSpacers.xxxxxLarge,
        Text.rich(
          const TextSpan(
            children: [
              TextSpan(
                  text:
                      'To further protect and secure all personal information, '),
              TextSpan(
                text: tmbpName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text:
                    ' only shares and discloses personal information to entities that observe a high standard of confidentiality and data privacy protection, in compliance with the Data Privacy Act of 2012 and such other applicable laws.',
              ),
            ],
          ),
          style: Theme.of(context).textTheme.headline6,
        ),
      ],
    );
  }
}
