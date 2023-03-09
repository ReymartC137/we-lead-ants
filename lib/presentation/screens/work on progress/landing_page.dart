import 'package:ants/presentation/screens/work%20on%20progress/body.dart';
import 'package:ants/presentation/screens/work%20on%20progress/navbar.dart';
import 'package:ants/widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'bottom.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    var height = size.height;
    var width = size.width;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(size.width, 100),
        child: const NavBar(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Body(),
            Bottom(),
          ],
        ),
      ),
    );
  }
}
