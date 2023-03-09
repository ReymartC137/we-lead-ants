import 'package:ants/tmbt-privacy-policy/core/constants/paddings.dart';
import 'package:ants/tmbt-privacy-policy/core/widgets/spacers/tmbt_spacer.dart';
import 'package:ants/tmbt-privacy-policy/sections/data_collection.dart';
import 'package:ants/tmbt-privacy-policy/sections/privacy_policy.dart';
import 'package:ants/tmbt-privacy-policy/sections/protection_and_security_measures.dart';
import 'package:ants/tmbt-privacy-policy/sections/retention.dart';
import 'package:ants/tmbt-privacy-policy/sections/sharing_and_disclosure.dart';
import 'package:ants/tmbt-privacy-policy/sections/update_of_personal_information.dart';
import 'package:flutter/material.dart';

class TMBTPrivacyPolicyScreen extends StatelessWidget {
  const TMBTPrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        fontFamily: 'Avenir',
        textTheme: const TextTheme(
          headline6: TextStyle(height: 1.25),
        ),
      ),
      child: Title(
        color: Theme.of(context).primaryColor,
        title: 'Privacy Policy - TMBP',
        child: Scaffold(
          body: SingleChildScrollView(
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: Paddings.large,
                  vertical: Paddings.xxLarge,
                ),
                constraints: const BoxConstraints(maxWidth: 1300),
                child: Column(
                  children: const [
                    PrivacyPolicy(),
                    VerticalSpacers.xxxxxLarge,
                    DataCollection(),
                    VerticalSpacers.xxxxxLarge,
                    SharingAndDisclosure(),
                    VerticalSpacers.xxxxxLarge,
                    Retention(),
                    VerticalSpacers.xxxxxLarge,
                    ProtectionAndSecurityMeasures(),
                    VerticalSpacers.xxxxxLarge,
                    UpdateOfPersonalInformations(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
