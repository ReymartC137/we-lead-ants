import 'package:ants/widgets/button.dart';
import 'package:ants/widgets/constants/colors.dart';
import 'package:ants/widgets/theme.dart';
import 'package:flutter/material.dart';

class JobsNearYouSection extends StatelessWidget {
  const JobsNearYouSection({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    var layoutColumn = Column(
      children: [
        Text(
          "JOBS VACANCIES",
          style: CHTheme.lightTheme.textTheme.titleSmall?.copyWith(
              fontFamily: 'Baskerville',
              fontSize: size.width > 800 ? 48 : 32,
              color: CHColor.primaryColor),
        ),
        const SizedBox(height: 50),
      ],
    );
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: Container(
        margin: size.width > 1366
            ? const EdgeInsets.symmetric(vertical: 50, horizontal: 0)
            : const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        child: layoutColumn,
      ),
    );
  }
}

class JobPost extends StatelessWidget {
  const JobPost(
      {Key? key,
      required this.size,
      required this.jobTitle,
      required this.jobDescriptionList,
      required this.jobInformation,
      required this.div})
      : super(key: key);

  final Size size;
  final String jobTitle;
  final List<String> jobDescriptionList;
  final String jobInformation;
  final bool div;

  @override
  Widget build(BuildContext context) {
    List<Widget> _descriptionRow = [];

    for (int i = 0; i < jobDescriptionList.length; i++) {
      if (i != jobDescriptionList.length - 1) {
        _descriptionRow.add(Text(
          '${jobDescriptionList[i]} | ',
          style: size.width > 1000
              ? CHTheme.lightTheme.textTheme.titleSmall
              : CHTheme.lightTheme.textTheme.titleSmall?.copyWith(fontSize: 12),
        ));
      } else {
        _descriptionRow.add(Text(
          '${jobDescriptionList[i]}',
          style: size.width > 1000
              ? CHTheme.lightTheme.textTheme.titleSmall
              : CHTheme.lightTheme.textTheme.titleSmall?.copyWith(fontSize: 12),
        ));
      }
    }

    var layoutRow = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                jobTitle,
                style: CHTheme.lightTheme.textTheme.titleSmall?.copyWith(
                    fontFamily: 'Baskerville',
                    fontSize: size.width > 800 ? 48 : 32,
                    color: CHColor.primaryColor),
              ),
              const SizedBox(height: 15),
              Row(
                children: [..._descriptionRow],
              ),
              const SizedBox(height: 10),
              Text(
                jobInformation,
                style: size.width > 1000
                    ? CHTheme.lightTheme.textTheme.titleSmall
                    : CHTheme.lightTheme.textTheme.titleSmall
                        ?.copyWith(fontSize: 12),
              ),
            ],
          ),
        ),
        const SizedBox(width: 50),
        Expanded(
          flex: 1,
          child: SizedBox(
            height: 50,
            width: 200,
            child: CHButton(
              name: 'APPLY NOW',
              type: CHButtonType.lightBlue,
              onPressed: () {},
            ),
          ),
        )
      ],
    );

    var layoutColumn = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          jobTitle,
          style: CHTheme.lightTheme.textTheme.titleSmall?.copyWith(
              fontFamily: 'Baskerville',
              fontSize: size.width > 800 ? 48 : 32,
              color: CHColor.primaryColor),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [..._descriptionRow],
        ),
        const SizedBox(height: 10),
        Text(
          jobInformation,
          style: size.width > 1000
              ? CHTheme.lightTheme.textTheme.titleSmall
              : CHTheme.lightTheme.textTheme.titleSmall?.copyWith(fontSize: 12),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 50),
        SizedBox(
          height: 50,
          width: 200,
          child: CHButton(
            name: 'APPLY NOW',
            type: CHButtonType.lightBlue,
            onPressed: () {},
          ),
        ),
        const SizedBox(height: 50),
      ],
    );

    return div
        ? Container(
            padding: const EdgeInsets.only(bottom: 50),
            margin: const EdgeInsets.only(bottom: 50),
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(
              color: Colors.black,
              width: 1,
            ))),
            width: 1300,
            child: size.width > 1000 ? layoutRow : layoutColumn,
          )
        : Container(
            padding: const EdgeInsets.only(bottom: 30),
            margin: const EdgeInsets.only(left: 30, right: 30),
            width: 1300,
            child: size.width > 1000 ? layoutRow : layoutColumn,
          );
  }
}
