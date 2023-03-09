// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:ants/widgets/constants/constants.dart';
import 'package:ants/widgets/widgets.dart';
import 'package:go_router/go_router.dart';

class ArticleRightLeftSection extends StatelessWidget {
  const ArticleRightLeftSection({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.id,
    this.div,
  }) : super(key: key);

  final String imageUrl;
  final String title;
  final String description;
  final String id;
  final double? div;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    String rootPath = '/sustainability/';
    Widget _websiteView() {
      return Container(
        width: size.width > 1366 ? 1300 : 1000,
        padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 0),
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(
              color: Colors.black,
              width: 0.5,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: size.width > 1366 ? 625 : 400,
                  child: Text(
                    title,
                    style: CHTheme.lightTheme.textTheme.titleSmall?.copyWith(
                      fontFamily: 'Baskerville',
                      fontSize: size.width > 1366 ? 50 : 48,
                      color: CHColor.primaryColor,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                SizedBox(
                  width: size.width > 1550
                      ? 500
                      : size.width > 1366
                          ? 610
                          : 400,
                  child: Text(
                    description,
                    style: size.width > 1366
                        ? CHTheme.lightTheme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w500,
                            height: 1.5,
                          )
                        : CHTheme.lightTheme.textTheme.titleSmall?.copyWith(
                            height: 1.5,
                          ),
                    maxLines: 3,
                    textAlign: TextAlign.justify,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                SizedBox(
                  height: 50,
                  width: 180,
                  child: CHButton(
                    name: 'READ MORE',
                    type: CHButtonType.blue,
                    onPressed: () {
                      String path = id;
                      print(path);
                      context
                          .go(rootPath + 'sustainability-article' + '/$path');
                    },
                  ),
                )
              ],
            ),
            Container(
              height: size.width > 1366 ? 450 : 300,
              width: size.width > 1366 ? 625 : 400,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(imageUrl), fit: BoxFit.fitHeight),
              ),
            ),
          ],
        ),
      );
    }

    Widget _mobileView() {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 500,
              child: AspectRatio(
                aspectRatio: 500 / 400,
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  height: double.infinity,
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: size.width > 1366 ? 600 : 500,
                  child: Text(
                    title,
                    style: CHTheme.lightTheme.textTheme.titleSmall?.copyWith(
                        fontFamily: 'Baskerville',
                        fontSize: size.width > 1366
                            ? 60
                            : size.width > 800
                                ? 48
                                : 32,
                        color: CHColor.primaryColor),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                SizedBox(
                  width: 500,
                  child: Text(
                    description,
                    style: CHTheme.lightTheme.textTheme.titleSmall
                        ?.copyWith(height: 1.5),
                    maxLines: 3,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                SizedBox(
                  height: 50,
                  width: 180,
                  child: CHButton(
                    name: 'READ MORE',
                    type: CHButtonType.blue,
                    onPressed: () {
                      String path = id;
                      print(path);
                      context
                          .go(rootPath + 'sustainability-article' + '/$path');
                    },
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  width: size.width / 1.3,
                  child: div == 0
                      ? Container()
                      : const Divider(
                          color: Colors.black,
                          thickness: .5,
                        ),
                )
              ],
            ),
          ],
        ),
      );
    }

    return Container(
      width: double.infinity,
      color: Colors.white,
      alignment: Alignment.center,
      child: size.width > 1000 ? _websiteView() : _mobileView(),
    );
  }
}
