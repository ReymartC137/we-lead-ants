import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          return const DesktopBody();
        } else {
          return const MobileBody();
        }
      },
    );
  }
}

class DesktopBody extends StatelessWidget {
  const DesktopBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 700,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/coming_soon.png'), fit: BoxFit.fill),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/Group 151.png'),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'COMING SOON',
              style: TextStyle(
                fontSize: 80,
                fontWeight: FontWeight.w600,
                color: Color(0xFF06A7E2),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Image.asset('images/Group 150.png'),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Our website is currently undergoing upgrades.',
              style: TextStyle(
                  fontFamily: 'Open Sans',
                  fontSize: 27,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF383838)),
            ),
          ],
        ),
      ),
    );
  }
}

class MobileBody extends StatelessWidget {
  const MobileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    var height = size.height;
    return Container(
      width: double.infinity,
      height: height * 0.5,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/coming_soon.png'), fit: BoxFit.fill),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/Group 151.png', scale: 2),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'COMING SOON',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Color(0xFF06A7E2),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Image.asset('images/Group 150.png'),
            const SizedBox(
              height: 20,
            ),
            const AutoSizeText(
              'Our website is currently undergoing upgrades.',
              style: TextStyle(
                  fontFamily: 'Open Sans',
                  // fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF383838)),
            ),
          ],
        ),
      ),
    );
  }
}
