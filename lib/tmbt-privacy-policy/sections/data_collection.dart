import 'package:ants/tmbt-privacy-policy/core/constants/name.dart';
import 'package:ants/tmbt-privacy-policy/core/constants/paddings.dart';
import 'package:ants/tmbt-privacy-policy/core/widgets/spacers/tmbt_spacer.dart';
import 'package:flutter/material.dart';

const _dataCollected = [
  'Full name',
  'Email address',
  'Special occasion being celebrated (e.g. birthday)',
  'Gender',
  'Blood type',
  'Profession',
  'Photo/Selfie',
  'Bike details',
  'Contact information (e.g. mobile number)',
  'Residential and/or mailing address',
  'Payment information (e.g. credit cards, debit cards)',
  'Other information necessary to provide you personalized products and services'
];

const _dataCollectionUses = [
  'Process your bookings, payments and transactions with us.',
  'To identify you and your party during the duration of your stay with us.',
  'To ensure your safety and security during the duration of your stay with us',
  'Promotional and customer management purposes, including sending you promotional communications (including without limitation emails and push notifications)'
];

class DataCollection extends StatelessWidget {
  const DataCollection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'DATA COLLECTION',
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
                    ', collects your personal information from various channels. By voluntarily providing your personal information, you confirm your understanding of and agreement with  the collection  and processing of your personal information in accordance with this Privacy Policy Statement.',
              ),
            ],
          ),
          style: Theme.of(context).textTheme.headline6,
        ),
        VerticalSpacers.xxxxxLarge,
        Text(
          'From our online bookings and reservations channels, to our sales representatives, to our registration forms all of which are designed to collect only the necessary information we need for us to provide the best and most personalized products and services for our guests and clients.',
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
          'Aside from the general purpose for the collection of personal information mentioned above. Your personal information is likewise collected and processed for the following related purpose:',
          style: Theme.of(context).textTheme.headline6,
        ),
        VerticalSpacers.large,
        Padding(
          padding: const EdgeInsets.only(left: Paddings.xxLarge),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...List.generate(
                _dataCollectionUses.length,
                (index) => Text(
                  '${index + 1}. ${_dataCollectionUses[index]}',
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
