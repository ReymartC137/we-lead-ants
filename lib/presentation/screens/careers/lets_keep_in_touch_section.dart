import 'package:ants/widgets/constants/constants.dart';
import 'package:ants/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../services/bloc/subscribed_email_bloc/subscribe_email_bloc.dart';

class LetsKeepInTouchSection extends StatelessWidget {
  const LetsKeepInTouchSection({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: Center(
        child: SizedBox(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(
                    left: 25, right: 25, top: 60, bottom: 25),
                width: size.width > 1570 ? 1320 : size.width * .92,
                height: size.height * 0.35,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/Gallery - Lobby (6) 1.webp'),
                      fit: BoxFit.cover),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                    left: 25, right: 25, top: 60, bottom: 25),
                width: size.width > 1570 ? 1320 : size.width * .92,
                height: size.height * 0.35,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    stops: [0.3, 0.75, 1],
                    colors: [
                      const Color(0xFFD4C9C5).withOpacity(1),
                      const Color(0xFFE9E9E9).withOpacity(0.5),
                      const Color(0xFFFFFFFF).withOpacity(0),
                    ],
                  ),
                ),
                child: Row(
                  mainAxisAlignment: size.width > 1000
                      ? MainAxisAlignment.start
                      : MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 48),
                      width: size.width > 1570 ? 1320 : size.width * .9,
                      child: Column(
                        crossAxisAlignment: size.width > 1000
                            ? CrossAxisAlignment.start
                            : CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Let\'s Keep in Touch!',
                            style: CHTheme.lightTheme.textTheme.titleSmall
                                ?.copyWith(
                              fontFamily: 'Baskerville',
                              color: CHColor.primaryColor,
                              fontSize: size.width > 1920
                                  ? 50
                                  : size.width > 1366
                                      ? 60
                                      : size.width > 800
                                          ? 48
                                          : 32,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            width: size.width > 1570
                                ? 1320
                                : size.width > 500
                                    ? size.width
                                    : size.width * .89,
                            child: Text(
                              'Subscribe to the latest news and opportunities at Chroma by leaving your email address below.',
                              style: CHTheme.lightTheme.textTheme.titleSmall
                                  ?.copyWith(color: Colors.black, height: 1.5),
                              textAlign: size.width > 1000
                                  ? TextAlign.start
                                  : TextAlign.center,
                              maxLines: 4,
                            ),
                          ),
                          const SizedBox(
                            height: CHGrid.large,
                          ),
                          Row(
                            mainAxisAlignment: size.width > 1000
                                ? MainAxisAlignment.start
                                : MainAxisAlignment.center,
                            children: [
                              Flexible(
                                flex: size.width > 1920
                                    ? 2
                                    : size.width > 1000
                                        ? 3
                                        : size.width > 800
                                            ? 6
                                            : 9,
                                // height: 50,
                                child: TextField(
                                  decoration: InputDecoration(
                                      hintStyle: CHTheme
                                          .lightTheme.textTheme.titleMedium
                                          ?.copyWith(
                                              fontStyle: FontStyle.italic),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      filled: true,
                                      fillColor: Colors.white,
                                      hintText: 'Your email here...'),
                                ),
                              ),
                              const SizedBox(
                                width: CHGrid.small,
                              ),
                              Flexible(
                                flex: size.width > 1920
                                    ? 2
                                    : size.width > 1000
                                        ? 3
                                        : size.width > 800
                                            ? 8
                                            : 9,
                                // height: 50,
                                // width: 175,
                                child: BlocBuilder<SubscribeEmailBloc,
                                    SubscribeEmailState>(
                                  builder: (context, state) {
                                    return CHButton(
                                        height: 50,
                                        name: 'Subscribe',
                                        type: CHButtonType.blue,
                                        onPressed: () {
                                          context
                                              .read<SubscribeEmailBloc>()
                                              .add(SubscribeNewEmailEvent(
                                                  email: emailController.text));
                                          showDialog(
                                              barrierDismissible: true,
                                              context: context,
                                              builder: (BuildContext context) {
                                                Future.delayed(
                                                    const Duration(
                                                        milliseconds: 2000),
                                                    () {
                                                  Navigator.of(context)
                                                      .pop(true);
                                                  emailController.clear();
                                                });
                                                return Dialog(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  child: SizedBox(
                                                    width: 100,
                                                    height: 100,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: const [
                                                        Text('Success')
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              });
                                        });
                                  },
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
