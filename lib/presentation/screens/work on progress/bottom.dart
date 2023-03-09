import 'package:flutter/material.dart';

class Bottom extends StatelessWidget {
  const Bottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          return const DesktopBottom();
        } else {
          return const MobileBottom();
        }
      },
    );
  }
}

class DesktopBottom extends StatelessWidget {
  const DesktopBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      color: const Color(0xFFD9D9D9),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('images/chroma png 2.png'),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('images/Vector.png'),
                const SizedBox(
                  width: 10,
                ),
                const Flexible(
                  child: Text(
                    '8F Vector Two Building, Northgate, Cyberzone, Filinvest Corporate City, Alabang, Muntinlupa, Philippines',
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.copyright_outlined,
                ),
                SizedBox(
                  width: 2,
                ),
                Flexible(
                    child:
                        Text('2022 Chroma Hospitality. All Rigths Reserved.')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MobileBottom extends StatelessWidget {
  const MobileBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    var height = size.height;
    return Container(
      width: double.infinity,
      height: height / 2,
      color: const Color(0xFFD9D9D9),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('images/chroma png 2.png'),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('images/Vector.png'),
                const SizedBox(
                  width: 10,
                ),
                const Flexible(
                  child: Text(
                    '8F Vector Two Building, Northgate, Cyberzone, Filinvest Corporate City, Alabang, Muntinlupa, Philippines',
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.copyright_outlined,
                ),
                SizedBox(
                  width: 2,
                ),
                Flexible(
                    child:
                        Text('2022 Chroma Hospitality. All Rigths Reserved.')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
