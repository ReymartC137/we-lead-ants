import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class SustainabilityC extends StatelessWidget {
  const SustainabilityC({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      width: size.width > 1000 ? 1000 : 500,
      height: size.width > 1000 ? 2800 : 1500,
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
                    data: '''**Environmental Responsibility**

The Philippines is located in the Ring of Fire and is tagged as a highly vulnerable country to climate change. We want our hotel assets to be resilient against natural calamities such as geological events (volcanoes, earthquakes) and extreme weather events (typhoons, floods, storm surges, droughts) because they pose a threat to our continued ability to serve our guests.

Having green designs incorporated into our buildings allow us to help mitigate climate change by reducing our carbon footprint, and preserve natural resources by optimizing our material inputs in day-to-day operations.

Green Features



Invested in Sustainable Technologies to reduce environmental impact and energy and potable water consumption.'''),
              ),
              SizedBox(
                  width: size.width * .8,
                  child: Image.asset('images/Table 1.png')),
              SizedBox(
                height: size.height * .15,
                child: Markdown(
                    styleSheet: MarkdownStyleSheet.fromTheme(ThemeData(
                        textTheme: TextTheme(
                            bodyText2: TextStyle(
                                fontSize: size.width > 1000 ? 18 : 14,
                                color: Colors.black)))),
                    data:
                        '''**FHC Hotels will undergo Green Building Certification (EDGE) and aspire to reach 20% ----**

Check with Gilbert – IFC requirement on Physical Disruption'''),
              ),
              SizedBox(
                  width: size.width * .8,
                  child: Image.asset(
                    'images/Table 2.webp',
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
                    data: '''**Pre-Design**

Project conception start with the site selection. FHC is adamant in selecting site – the team is particular with the following requirements: 1. Flood-prone areas, 2. Brownfield, 3. ----

For resorts located in areas rich with biodiversity implement risk mitigating measures in the design and construction.  
'''),
              ),
            ],
          )),
    );
  }
}
