import 'package:ants/tmbt-privacy-policy/core/constants/name.dart';
import 'package:ants/tmbt-privacy-policy/core/widgets/spacers/tmbt_spacer.dart';
import 'package:flutter/material.dart';

class Retention extends StatelessWidget {
  const Retention({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'RETENTION',
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
                    ', shall keep a copy of your personal information for a maximum of two (2) years after completion of our transaction with our guests and clients, unless we believe that further  retention  of such personal information is necessary to any ongoing or prospective legal proceedings or as may be required to do so by law or any government agency.',
              ),
            ],
          ),
          style: Theme.of(context).textTheme.headline6,
        ),
      ],
    );
  }
}
