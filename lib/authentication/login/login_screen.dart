import 'package:flutter/material.dart';

import '../../../widgets/web/web.dart';
import 'registration_section.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      //backgroundColor: Colors.white,
      drawerEnableOpenDragGesture: false,
      drawerEdgeDragWidth: 0,
      endDrawerEnableOpenDragGesture: false,
      appBar: PreferredSize(
          preferredSize: Size(size.width, 70), child: const CHAppBar()),
      endDrawer: const CHDrawer(),
      body: SingleChildScrollView(
        child: SizedBox(
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Column(
                    children: const [
                      RegistrationSection(),
                      FooterSection(),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
