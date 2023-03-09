import 'package:ants/tmbt-privacy-policy/core/constants/name.dart';
import 'package:ants/tmbt-privacy-policy/core/constants/paddings.dart';
import 'package:ants/tmbt-privacy-policy/core/widgets/spacers/tmbt_spacer.dart';
import 'package:flutter/material.dart';

const _securityMeasures = [
  'Storing physical documents containing your personal information, in a secure storage facility equipped with security tools',
  'Storing and processing your personal and sensitive personal information in secure operating environments  that are not accessible to the public and is only accessible by authorized personnel',
  'Disposing documents containing personal and sensitive personal information through shredding or other similar methods of disposal that would ensure the impossibility of further processing, unauthorized access or disclosure of your personal information'
];

class ProtectionAndSecurityMeasures extends StatelessWidget {
  const ProtectionAndSecurityMeasures({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'PROTECTION AND SECURITY MEASURES',
          style: Theme.of(context).textTheme.headline4,
        ),
        VerticalSpacers.large,
        Text(
          '$tmbpName, is fully committed in protecting your personal information and sensitive personal information. As such, we have taken all the necessary technical, organizational and physical measures to protect the confidentiality and security of your personal information and sensitive personal information against accidental loss or destruction, and human dangers such as misuse, unlawful access, fraudulent misuse, unlawful destruction, alteration and contamination. Towards this end, we have put in place the following safeguards',
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
                _securityMeasures.length,
                (index) => Text(
                  '${index + 1}. ${_securityMeasures[index]}',
                  style: Theme.of(context).textTheme.headline6,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
