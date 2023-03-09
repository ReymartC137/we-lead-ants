import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class SustainabilityA extends StatelessWidget {
  const SustainabilityA({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      width: size.width > 1000 ? 1000 : 500,
      height: size.width > 1000 ? 7750 : 4500,
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              SizedBox(
                height: size.height,
                child: Markdown(
                    shrinkWrap: true,
                    styleSheet: MarkdownStyleSheet.fromTheme(ThemeData(
                        textTheme: TextTheme(
                            bodyText2: TextStyle(
                                fontSize: size.width > 1000 ? 18 : 14,
                                color: Colors.black)))),
                    data: '''**Scope**

The Filinvest Hospitality Group (FHG) is composed of Filinvest Hospitality Corporation (FHC), an asset development company, and Chroma Hospitality Inc (CHI), the operator of the hotel and F&B assets.

The scope of this report covers the non-financial or EESG performance of the head offices of the two companies as well as the hotel and restaurant operations of seven properties of Filinvest Hospitality, including the Mimosa golf course:

· Crimson Filinvest City Manila (CFCM)

· Crimson Resort and Spa Boracay (CRSB)

· Crimson Resort and Spa Mactan (CRSM)

· Quest Hotel Cebu City (QHCC)

· Quest Hotel Tagaytay City (QHTC)

· Quest Plus Conference Center Clark (QPCC) and Mimosa Golf

· Timberland Highlands Resort (THR)

The sustainability data index at the end of this report presents the EESG metrics for the Clark properties in a consolidated form.

While there may be mention of the activities in properties currently under development and construction (e.g. Grafik Baguio), most of the disclosures cover the operating assets.


**Materiality**

The disclosures in this report are informed by the principles of materiality and focuses on the economic, environmental, social and governance (EESG) impacts of the operations and activities of FHG, as well as the management approach to the material topics listed.

Starting in late 2021, the FHG’s EESG team undertook an initial assessment of organizational processes, procedures, and policies to better understand how they relate to EESG issues. Given the inability to undertake face to face meetings with stakeholders due to the continuing Covid-19 pandemic, the validation stage of the materiality assessment was done through online surveys and soliciting feedback from employees of FHG who were the key contacts of our various stakeholders, thus acting as proxies.

It is expected that a full-blown materiality assessment with external stakeholders can be undertaken in 2023, consisting of various focus group discussions that will seek feedback and suggestions from the attendees.

Material Topics which have an impact on both stakeholders and FHG'''),
              ),
              SizedBox(
                  width: size.width * .8,
                  child: Image.asset('images/Table 4.png')),
              SizedBox(
                height: size.width > 1000 ? size.height * .3 : size.height * .4,
                child: Markdown(
                    styleSheet: MarkdownStyleSheet.fromTheme(ThemeData(
                        textTheme: TextTheme(
                            bodyText2: TextStyle(
                                fontSize: size.width > 1000 ? 18 : 14,
                                color: Colors.black)))),
                    data:
                        '''The insights from the materiality assessment were discussed by the FHG leaders leading to the formulation of the group’s Sustainability Framework which identifies the sustainability focus areas.

Incidentally, the Filinvest Hospitality Group signed up as a supporter to the Hotel Sustainability Basics (HSB) launched during the World Travel and Tourism Convention held in Manila in February 2022. The HSB is a globally recognized and coordinated set of sustainability indicators that all hotels should implement as a minimum. Developed by the industry for the industry, they represent twelve actions that are fundamental to hotel sustainability, covering aspects related to efficiency, planet and people. The Filinvest Hospitality Group’s sustainability commitments completely align with the actions proposed under the HSB.'''),
              ),
              SizedBox(
                  height: 200,
                  width: size.width * .8,
                  child: Image.asset(
                    'images/Picture2.png',
                    fit: BoxFit.contain,
                  )),
              SizedBox(
                  height: 400,
                  width: size.width * .8,
                  child: Image.asset(
                    'images/Picture1.png',
                    fit: BoxFit.contain,
                  )),
              SizedBox(
                height: size.height * .2,
                child: Markdown(
                    styleSheet: MarkdownStyleSheet.fromTheme(ThemeData(
                        textTheme: TextTheme(
                            bodyText2: TextStyle(
                                fontSize: size.width > 1000 ? 18 : 14,
                                color: Colors.black)))),
                    data: '''**Stakeholder Engagement** 


In the pursuit of realizing shared goals with stakeholders, the Filinvest Hospitality Group identified its key stakeholders, took note of their concerns and established channels of engagement and initiatives that aim to either enhance the positive impacts and mitigate the negative impacts on both parties.  
'''),
              ),
              SizedBox(
                  width: size.width * .8,
                  child: Image.asset('images/Table 5.webp')),
            ],
          )),
    );
  }
}
