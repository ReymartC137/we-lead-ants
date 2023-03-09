import 'package:ants/widgets/constants/colors.dart';
import 'package:ants/widgets/constants/grid.dart';
import 'package:flutter/material.dart';

import '../../../widgets/web/asset_article_card.dart';
import '../../../widgets/widgets.dart';

class FoodBeveragesSection extends StatelessWidget {
  const FoodBeveragesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      width: size.width * .8,
      padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            child: Text(
              "FOOD & BEVERAGES",
              textAlign: TextAlign.center,
              style: CHTheme.lightTheme.textTheme.titleSmall?.copyWith(
                  fontFamily: 'Baskerville',
                  fontSize: size.width > 800
                      ? 48
                      : size.width > 450
                          ? 32
                          : 24,
                  color: CHColor.primaryColor),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          SizedBox(
            width: size.width > 1000 ? size.width * .85 : size.width * .82,
            child: Text(
              "Expanding its brands to include specialty food and beverage options, Azure was opened in 2016 while Firehouse and Baker J were introduced to the market in 2019.",
              style: size.width > 1000
                  ? CHTheme.lightTheme.textTheme.titleSmall
                      ?.copyWith(fontSize: 22)
                  : CHTheme.lightTheme.textTheme.titleSmall
                      ?.copyWith(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          size.width > 1000
              ? Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          children: [
                            const AssetArticleCard(
                              textAlign: TextAlign.left,
                              logoUrl: "images/firehouse-logo.webp",
                              thumbnailUrl: "images/food-beve-1.webp",
                              title: "Firehouse Pizza",
                              description:
                                  "From the moment you rang the alarm, we knew you wanted a pizza us. Tell us, when you think of...",
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            SizedBox(
                              height: 50,
                              width: 200,
                              child: CHButton(
                                  name: 'VISIT WEBSITE',
                                  type: CHButtonType.blue,
                                  onPressed: () {}),
                            ),
                          ],
                        ),
                        SizedBox(width: size.width > 1000 ? 50 : 35),
                        Column(
                          children: [
                            const AssetArticleCard(
                              textAlign: TextAlign.left,
                              logoUrl: "images/bakerj-logo.webp",
                              thumbnailUrl: "images/food-beve-2.webp",
                              title: "Baker J",
                              description:
                                  "Redefines the pastry and coffee shop experience by infusing delectable and creative flavors with Classic...",
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            SizedBox(
                              height: 50,
                              width: 200,
                              child: CHButton(
                                  name: 'VISIT WEBSITE',
                                  type: CHButtonType.blue,
                                  onPressed: () {}),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: CHGrid.xxxLarge,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const AssetArticleCard(
                          textAlign: TextAlign.left,
                          logoUrl: "images/Azure Beach Club Logo-05.webp",
                          thumbnailUrl: "images/azure_bg.webp",
                          title: "Azure Beach Club",
                          description:
                              "From the moment you rang the alarm, we knew you wanted a pizza us. Tell us, when you think of...",
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        SizedBox(
                          height: 50,
                          width: 200,
                          child: CHButton(
                              name: 'VISIT WEBSITE',
                              type: CHButtonType.blue,
                              onPressed: () {}),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: CHGrid.xxxLarge,
                    ),
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const AssetArticleCard(
                      textAlign: TextAlign.left,
                      logoUrl: "images/firehouse-logo.webp",
                      thumbnailUrl: "images/food-beve-1.webp",
                      title: "Firehouse Pizza",
                      description:
                          "From the moment you rang the alarm, we knew you wanted a pizza us. Tell us, when you think of...",
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      height: 50,
                      width: 200,
                      child: CHButton(
                          name: 'VISIT WEBSITE',
                          type: CHButtonType.blue,
                          onPressed: () {}),
                    ),
                    const SizedBox(height: 25),
                    const AssetArticleCard(
                      textAlign: TextAlign.left,
                      logoUrl: "images/bakerj-logo.webp",
                      thumbnailUrl: "images/food-beve-2.webp",
                      title: "Baker J",
                      description:
                          "Redefines the pastry and coffee shop experience by infusing delectable and creative flavors with Classic...",
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      height: 50,
                      width: 200,
                      child: CHButton(
                          name: 'VISIT WEBSITE',
                          type: CHButtonType.blue,
                          onPressed: () {}),
                    ),
                    const AssetArticleCard(
                      textAlign: TextAlign.left,
                      logoUrl: "images/Azure Beach Club Logo-05.webp",
                      thumbnailUrl: "images/azure_bg.webp",
                      title: "Azure Beach Club",
                      description:
                          "From the moment you rang the alarm, we knew you wanted a pizza us. Tell us, when you think of...",
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      height: 50,
                      width: 200,
                      child: CHButton(
                          name: 'VISIT WEBSITE',
                          type: CHButtonType.blue,
                          onPressed: () {}),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
