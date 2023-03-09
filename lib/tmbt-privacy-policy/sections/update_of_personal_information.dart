// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ants/tmbt-privacy-policy/core/constants/paddings.dart';
import 'package:ants/tmbt-privacy-policy/core/widgets/spacers/tmbt_spacer.dart';
import 'package:ants/widgets/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

const _dataCollected = [
  'Travel history with inclusive dates, such as country of origin and arrival dates here in the PHILIPPINES',
  'Contact or interaction with people from their originating country/ies',
  'Arrival date/time here in the PHILIPPINES (with supporting document/s)',
  '''Contact or interaction with people who were PUls, PUMs and/or confirmed COVID-19 cases.
        a. IF YES, contact tracing information is also mandatory.''',
  'Pre-existing  medical  conditions, signs and/or  symptoms relating  to COVID-19',
  'Medication/s taken for those declared above.',
];

class UpdateOfPersonalInformations extends StatelessWidget {
  const UpdateOfPersonalInformations({super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle? emailTextStyle = Theme.of(context).textTheme.headline6;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'REQUESTS FOR CORRECTION AND DELETION OF YOUR PERSONAL OR SENSITIVE PERSONAL INFORMATION',
          style: Theme.of(context).textTheme.headline4,
        ),
        VerticalSpacers.large,
        Text(
          'Additional Measures added to ensure the safety and security of our quests and staff:',
          style: Theme.of(context).textTheme.headline6,
        ),
        VerticalSpacers.large,
        Text(
          'As of March 2020, the ownership and management companies of Entrata Services Inc., have implemented additional measures to ensure the health and safety of our staff and guests. A part of these additional measures is having our guests sign a "HEALTH AND TRAVEL DECLARATION SURVEILLANCE FORM". This form requires our guests to provide us the necessary information that allows us to ensure the health and safety of our guests and staff. The information are but not limited to:',
          style: Theme.of(context).textTheme.headline6,
        ),
        VerticalSpacers.xxxxxLarge,
        Text(
          'The personal information we collect, includes but are not limited to:',
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
                _dataCollected.length,
                (index) => Text(
                  '${index + 1}. ${_dataCollected[index]}',
                  style: Theme.of(context).textTheme.headline6,
                ),
              )
            ],
          ),
        ),
        VerticalSpacers.xxxxxLarge,
        Text(
          'All information collected through these forms will only be for the use of ensuring the health and safety of our guests and staff. The information will only be shared to those government agencies identified by the DEPARTMENT OF HEALTH to handle any COVID-19 related incidents.\n\nYou may also refer to the joint memorandum circular (DOH and NPC) for the guidelines for the processing and disclosure of COVID-19 related data:',
          style: Theme.of(context).textTheme.headline6,
        ),
        VerticalSpacers.large,
        const TextLink(
          text:
              'https://www.doh.gov.ph/sites/default/files/health-update/jmc2020-0002.pdf',
        ),
        VerticalSpacers.xxxxLarge,
        Text(
          'Requests for Correction and Deletion of your Personal or Sensitive Personal Information:',
          style: Theme.of(context).textTheme.headline6,
        ),
        VerticalSpacers.large,
        Text(
          'DATA PRIVACY MANAGER',
          style: Theme.of(context).textTheme.headline6,
        ),
        VerticalSpacers.large,
        Text(
          'CHROMA HOSPITALITY INC.,',
          style: Theme.of(context).textTheme.headline6,
        ),
        VerticalSpacers.large,
        StatefulBuilder(
          builder: (context, setState) {
            return TextLink(
              text: 'DPO@CHROMAHOSPITALITY.COM',
              prefix: 'mailto:',
              style: emailTextStyle,
              onEnter: () {
                setState(
                  () {
                    emailTextStyle =
                        Theme.of(context).textTheme.headline6?.copyWith(
                              color: CHColor.primaryColor,
                            );
                  },
                );
              },
              onExit: () {
                setState(() {
                  emailTextStyle =
                      Theme.of(context).textTheme.headline6?.copyWith(
                            color: null,
                          );
                });
              },
            );
          },
        ),
        VerticalSpacers.xxxxLarge,
        Text(
          'DATA PROTECTION OFFICER',
          style: Theme.of(context).textTheme.headline6,
        ),
        VerticalSpacers.large,
        Text(
          'FILINVEST GROUP',
          style: Theme.of(context).textTheme.headline6,
        ),
        VerticalSpacers.large,
        StatefulBuilder(
          builder: (context, setState) {
            return TextLink(
              text: 'DPO.ALABANG@CRIMSONHOTEL.COM',
              prefix: 'mailto:',
              style: emailTextStyle,
              onEnter: () {
                setState(
                  () {
                    emailTextStyle = Theme.of(context)
                        .textTheme
                        .headline6
                        ?.copyWith(color: CHColor.primaryColor);
                  },
                );
              },
              onExit: () {
                setState(() {
                  emailTextStyle =
                      Theme.of(context).textTheme.headline6?.copyWith(
                            color: null,
                          );
                });
              },
            );
          },
        ),
      ],
    );
  }
}

class TextLink extends StatefulWidget {
  const TextLink({
    Key? key,
    required this.text,
    this.prefix = '',
    this.style,
    this.onEnter,
    this.onExit,
  }) : super(key: key);
  final String text;
  final String prefix;
  final TextStyle? style;
  final VoidCallback? onEnter;
  final VoidCallback? onExit;

  @override
  State<TextLink> createState() => _TextLinkState();
}

class _TextLinkState extends State<TextLink> {
  bool hoverActive = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (event) {
        if (widget.onEnter == null) return;
        if (!hoverActive) {
          hoverActive = true;
          widget.onEnter!();
        }
      },
      onExit: (event) {
        if (widget.onExit == null) return;
        if (hoverActive) {
          hoverActive = false;
          widget.onExit!();
        }
      },
      child: GestureDetector(
        onTap: () {
          launchUrl(Uri.parse(widget.prefix + widget.text));
        },
        child: Text(
          widget.text,
          style: widget.style ??
              Theme.of(context).textTheme.titleMedium?.copyWith(
                    decoration: TextDecoration.underline,
                    fontStyle: FontStyle.italic,
                    color: CHColor.primaryColor,
                  ),
        ),
      ),
    );
  }
}
