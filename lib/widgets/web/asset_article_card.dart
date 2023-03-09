import 'package:ants/widgets/constants/colors.dart';
import 'package:ants/widgets/theme.dart';
import 'package:flutter/material.dart';

class AssetArticleCard extends StatelessWidget {
  const AssetArticleCard({
    Key? key,
    this.logoUrl,
    required this.thumbnailUrl,
    this.isOpening = false,
    this.title,
    this.titleColor,
    this.textAlign,
    required this.description,
  }) : super(key: key);

  final String? logoUrl;
  final String thumbnailUrl;
  final bool isOpening;
  final String? title;
  final Color? titleColor;
  final String description;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    String descriptionSubstring;

    if (size.width > 1366) {
      descriptionSubstring = description.length >= 100
          ? description.substring(0, 100)
          : description;
    } else {
      descriptionSubstring =
          description.length >= 90 ? description.substring(0, 90) : description;
    }

    List<Widget> _titleComponent() {
      var tC = titleColor ?? Colors.black;

      return [
        Text(
          title!,
          style: size.width > 1366
              ? CHTheme.lightTheme.textTheme.titleMedium
                  ?.copyWith(color: tC, fontSize: 20)
              : CHTheme.lightTheme.textTheme.titleSmall
                  ?.copyWith(color: tC, fontWeight: FontWeight.bold),
          textAlign: textAlign ?? TextAlign.center,
        ),
        const SizedBox(
          height: 10,
        ),
      ];
    }

    List<Widget> _logoComponent() {
      return [
        Image.asset(
          logoUrl!,
          filterQuality: FilterQuality.high,
          isAntiAlias: false,
          //width: 625,
          fit: BoxFit.cover,
        ),
        const SizedBox(
          height: 20,
        ),
      ];
    }

    Widget _thumbnail() {
      return Stack(
        clipBehavior: Clip.none,
        children: [
          SizedBox(
            height: 270,
            child: Image.asset(
              thumbnailUrl,
              fit: BoxFit.cover,
            ),
          ),
          if (isOpening)
            Positioned(
              right: -50,
              top: -50,
              child: CircleAvatar(
                radius: 50,
                backgroundColor: const Color(0xFFB8D8EB),
                child: Container(
                  padding: const EdgeInsets.only(top: 10),
                  alignment: Alignment.center,
                  child: Text(
                    "OPENING SOON",
                    style: CHTheme.lightTheme.textTheme.titleLarge?.copyWith(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: CHColor.primaryColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
        ],
      );
    }

    return SizedBox(
      width: size.width > 1366 ? 400 : 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          if (logoUrl != null) ..._logoComponent(),
          _thumbnail(),
          const SizedBox(
            height: 20,
          ),
          if (title != null) ..._titleComponent(),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            //color: Colors.red,
            height: size.width > 1000 ? 100 : 67,
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: descriptionSubstring,
                    style: size.width > 1366
                        ? CHTheme.lightTheme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w500,
                            height: 1.5,
                          )
                        : CHTheme.lightTheme.textTheme.titleSmall?.copyWith(
                            height: 1.5,
                          ),
                  ),
                  TextSpan(
                    text: "...",
                    style: size.width > 1366
                        ? CHTheme.lightTheme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w500,
                            height: 1.5,
                          )
                        : CHTheme.lightTheme.textTheme.titleSmall?.copyWith(
                            height: 1.5,
                          ),
                  ),
                  // TextSpan(
                  //   text: "READ MORE",
                  //   style: CHTheme.lightTheme.textTheme.titleSmall?.copyWith(
                  //     fontSize: size.width > 1000 ? 16 : 12,
                  //     color: Color(0xFF00A8E1),
                  //     decoration: TextDecoration.underline,
                  //   ),
                  //   recognizer: TapGestureRecognizer()
                  //     ..onTap = () {
                  //       Get.toNamed(RouteHelper.articlePage(thumbnailUrl));
                  //     },
                  // ),
                ],
              ),
              textAlign: textAlign ?? TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
