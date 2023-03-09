import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class SustainabilityB extends StatelessWidget {
  const SustainabilityB({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      width: size.width > 1000 ? 1000 : 500,
      height: size.width > 1000 ? 2950 : 1600,
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              SizedBox(
                height: size.height * .4,
                child: Markdown(
                    shrinkWrap: true,
                    styleSheet: MarkdownStyleSheet.fromTheme(ThemeData(
                        textTheme: TextTheme(
                            bodyText2: TextStyle(
                                fontSize: size.width > 1000 ? 18 : 14,
                                color: Colors.black)))),
                    data:
                        '''Our hospitality business thrives in providing warm and authentic Filipino Hospitality-inspired guest experiences. We have a dream for our unique brand of Filipino hospitality to be recognized around the world and hopefully translate into our guests returning to our destinations and through word of mouth enticing first time travelers to share in the same experiences. A continuing virtuous cycle of well-delivered experiences and positive feedback will attract more guests to our properties and hopefully not just grow the business but impart positive benefits to the stakeholders who surround us.



Our team takes pride in our accomplishments these past years in delivering memorable guest experiences as evidenced by consistently positive reviews on social media, even during challenging times such as natural disasters when our team members had to step up and make the best of the situation while keeping our guests protected and safe.

Currently running 3 hotel brands spread across 7 properties, the Filinvest Hospitality Group is the highest ranking locally owned and managed hotel group based on TripAdvisor. In 2021, we had an average score of _(XX)_, ranking (1st?) among the Filipino-run hospitality groups in the country.'''),
              ),
              SizedBox(
                height:
                    size.width > 1000 ? size.height * .35 : size.height * .4,
                child: Markdown(
                    styleSheet: MarkdownStyleSheet.fromTheme(ThemeData(
                        textTheme: TextTheme(
                            bodyText2: TextStyle(
                                fontSize: size.width > 1000 ? 18 : 14,
                                color: Colors.black)))),
                    data: '''**Sustaining the High Level of Service Quality**

We do not rest on our laurels and we always strive to take our products and services to the next level.

We want to achieve operational excellence better than the high average rating of 90% in TrustYou for 2021, a customer satisfaction tool that we employ. This will be achieved through the continuous improvement and development of our people by providing cutting edge trainings and industry leading workshops.

We want to maintain our top ranking in Trip Advisor among locally managed group of hotels. But our long term aspiration is to be in the Top 3 of Trip Advisor global rankings. We will achieve this sustainaining our high level of customer service and working on a number of impactful initiatives that will provide our guests with more value for money and more meaningful experiences.'''),
              ),
              SizedBox(
                  width: size.width * .8,
                  child: Image.asset(
                    'images/Table 3.png',
                    fit: BoxFit.contain,
                  )),
              SizedBox(
                  width: size.width * .8,
                  child: Image.asset('images/Picture3.webp')),
            ],
          )),
    );
  }
}
