// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ants/core/theme/xtendly_colors.dart';
import 'package:ants/core/theme/xtendly_fonts.dart';

import 'package:ants/widgets/web/booking_input_widget.dart';
import 'package:flutter/material.dart';

import 'package:ants/widgets/icon_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widgets/widgets.dart';
import '../../services/bloc/registration_bloc/registration_bloc.dart';

class RegistrationSection extends StatelessWidget {
  const RegistrationSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    String? prefDate;

    return BlocProvider(
      create: (context) => RegistrationBloc(),
      child: Container(
        width: double.infinity,
        color: Colors.white,
        child: size.width > 1230
            ? WebsiteView(
                size: size,
              )
            : MobileView(size: size, prefDate: prefDate),
      ),
    );
  }
}

class MobileView extends StatefulWidget {
  const MobileView({
    Key? key,
    required this.size,
    required this.prefDate,
  }) : super(key: key);

  final Size size;
  final String? prefDate;

  @override
  State<MobileView> createState() => _MobileViewState();
}

class _MobileViewState extends State<MobileView> {
  String? prefDate;
  String? prefTime;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      height: 150,
                      child: Image.asset('assets/icons/polyEndA.png')),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    height: 2,
                  ),
                  SizedBox(
                      height: 150,
                      child: Image.asset('assets/icons/polyEndB.png')),
                ],
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: widget.size.width * .9,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(.5),
                        spreadRadius: .5,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(15),
                    color: WeLeadColors.foreground),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(
                        top: 15.0,
                        left: 15,
                        right: 15,
                      ),
                      child: Text(
                        'BOOK A VISIT',
                        style: TextStyle(fontFamily: 'Avenir', fontSize: 25),
                      ),
                    ),
                    const Divider(),
                    Container(
                      padding: const EdgeInsets.all(15.0),
                      child: const Text(
                        'All fields required',
                        style: TextStyle(
                            fontFamily: 'Avenir', fontStyle: FontStyle.italic),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            CustomInput(
                              width: widget.size.width * .8,
                              hint: 'First Name',
                            ),
                            CustomInput(
                              width: widget.size.width * .8,
                              hint: 'Email Address',
                            ),
                            // GestureDetector(
                            //   onTap: () {
                            //     showDatePicker(
                            //       context: context,
                            //       initialDate: DateTime.now(),
                            //       firstDate: DateTime(2000),
                            //       lastDate: DateTime(2100),
                            //     ).then((value) {
                            //       setState(() {
                            //         prefDate = value.toString();
                            //       });
                            //     });
                            //   },
                            //   child: BookingInput(
                            //       width: widget.size.width * .8,
                            //       inputDate:
                            //           prefDate ?? 'Preferred Viewing Date',
                            //       text: 'Preferred Viewing Date',
                            //       hint: '',
                            //       icon: Icons.calendar_month,
                            //       isRequired: false),
                            // )
                          ],
                        ),
                        Column(
                          children: [
                            CustomInput(
                              width: widget.size.width * .8,
                              hint: 'Last Name',
                            ),
                            CustomInput(
                              width: widget.size.width * .8,
                              hint: 'Contact No.',
                            ),
                            // GestureDetector(
                            //   onTap: () {
                            //     showTimePicker(
                            //             context: context,
                            //             initialTime: TimeOfDay.now())
                            //         .then((value) {
                            //       setState(() {
                            //         prefTime = value.toString();
                            //       });
                            //     });

                            //   },
                            //   child: BookingInput(
                            //       width: widget.size.width * .8,
                            //       inputDate: prefTime ?? 'Preferred Time',
                            //       text: 'Preferred Time',
                            //       hint: '',
                            //       icon: Icons.lock_clock,
                            //       isRequired: false),
                            // )
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Checkbox(value: false, onChanged: (v) {}),
                          SizedBox(
                            height: 100,
                            width: widget.size.width * .6,
                            child: const Text(
                              'I have read and understand the Privacy\n Policy and Terms and Condition of The Crib',
                              maxLines: 5,
                              style: TextStyle(fontSize: 18),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 50,
                            width: 120,
                            child: CHButton(
                              name: 'SUBMIT',
                              type: CHButtonType.blue,
                              onPressed: () {},
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                height: 500,
                width: widget.size.width * .9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Text(
                      'You are just a few clicks away from the best co-living experience here with us at The Crib.',
                      style: WeLeadTextStyles.interSmall.copyWith(
                          fontSize: 18, color: WeLeadColors.background),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'The Crib Clark',
                          style: WeLeadTextStyles.interSmall.copyWith(
                              fontSize: 18, color: WeLeadColors.background),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const IconText(
                            maxLines: 3,
                            color: WeLeadColors.background,
                            width: 300,
                            iconPath: 'loc.png',
                            text:
                                'Narra Loop, Filinvest Mimosa+, Clark Freeport Zone, Pampanga'),
                        const SizedBox(
                          height: 10,
                        ),
                        const IconText(
                            maxLines: 1,
                            color: WeLeadColors.background,
                            width: 300,
                            iconPath: 'phone.png',
                            text: '0960 – 229 7560​'),
                        const SizedBox(
                          height: 10,
                        ),
                        const IconText(
                            maxLines: 2,
                            color: WeLeadColors.background,
                            width: 300,
                            iconPath: 'envelope.png',
                            text: 'clark.leasing@thecribcoliving.com')
                      ],
                    ),

                    // Text('The Crib Alabang'),
                    // Text('The Crib Mandaluyong'),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class WebsiteView extends StatefulWidget {
  const WebsiteView({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<WebsiteView> createState() => _WebsiteViewState();
}

class _WebsiteViewState extends State<WebsiteView> {
  String? prefDate;
  String? prefTime;
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController contactNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController prefDateNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistrationBloc, RegistrationState>(
      builder: (context, state) {
        return Stack(
          children: [
            SizedBox(
              height: 500,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          height: 150,
                          child: Image.asset('assets/icons/polyEndA.png')),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                          height: 150,
                          child: Image.asset('assets/icons/polyEndB.png')),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 500,
                    width: widget.size.width * .45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'You are just a few clicks away from the best co-living experience here with us at The Crib.',
                          style: WeLeadTextStyles.interSmall.copyWith(
                              fontSize: 18, color: WeLeadColors.background),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'The Crib Clark',
                              style: WeLeadTextStyles.interSmall.copyWith(
                                  fontSize: 18, color: WeLeadColors.background),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const IconText(
                                maxLines: 3,
                                color: WeLeadColors.background,
                                width: 300,
                                iconPath: 'loc.png',
                                text:
                                    'Narra Loop, Filinvest Mimosa+, Clark Freeport Zone, Pampanga'),
                            const SizedBox(
                              height: 10,
                            ),
                            const IconText(
                                maxLines: 1,
                                color: WeLeadColors.background,
                                width: 300,
                                iconPath: 'phone.png',
                                text: '0960 – 229 7560​'),
                            const SizedBox(
                              height: 10,
                            ),
                            const IconText(
                                maxLines: 2,
                                color: WeLeadColors.background,
                                width: 300,
                                iconPath: 'envelope.png',
                                text: 'clark.leasing@thecribcoliving.com')
                          ],
                        ),
                        Row(
                          children: const [],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 500,
                    width: widget.size.width * .4,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(.5),
                            spreadRadius: .5,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.circular(15),
                        color: WeLeadColors.foreground),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Padding(
                          padding:
                              EdgeInsets.only(top: 15.0, left: 15, right: 15),
                          child: Text(
                            'Create Account',
                            style:
                                TextStyle(fontFamily: 'Avenir', fontSize: 25),
                          ),
                        ),
                        const Divider(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                BookingInput(
                                    textEditingController: firstNameController,
                                    width: widget.size.width * .35,
                                    text: 'First Name',
                                    hint: '',
                                    isRequired: true),
                                BookingInput(
                                    textEditingController: lastNameController,
                                    width: widget.size.width * .35,
                                    text: 'Last Name',
                                    hint: '',
                                    isRequired: true),
                                BookingInput(
                                    textEditingController: emailController,
                                    width: widget.size.width * .35,
                                    text: 'Email Address',
                                    hint: '',
                                    isRequired: true),
                                BookingInput(
                                    textEditingController:
                                        contactNumberController,
                                    width: widget.size.width * .35,
                                    text: 'Contact no.',
                                    hint: '',
                                    isRequired: true),
                                BookingInput(
                                    textEditingController: passwordController,
                                    width: widget.size.width * .35,
                                    text: 'Password',
                                    hint: '',
                                    isRequired: true),
                                // GestureDetector(
                                //   onTap: () {
                                //     showDatePicker(
                                //       context: context,
                                //       initialDate: DateTime.now(),
                                //       firstDate: DateTime(2000),
                                //       lastDate: DateTime(2100),
                                //     ).then((value) {
                                //       setState(() {
                                //         prefDate = value.toString();
                                //       });
                                //     });
                                //   },
                                //   child: BookingInput(
                                //       width: widget.size.width * .15,
                                //       inputDate: prefDate ??
                                //           'Preferred Viewing Date',
                                //       text: 'Preferred Viewing Date',
                                //       hint: '',
                                //       icon: Icons.calendar_month,
                                //       isRequired: false),
                                // )
                              ],
                            ),
                            const SizedBox(
                              width: 70,
                            ),
                            // Column(
                            //   crossAxisAlignment: CrossAxisAlignment.start,
                            //   children: [
                            //     BookingInput(
                            //         textEditingController:
                            //             contactNumberController,
                            //         width: widget.size.width * .15,
                            //         text: 'Contact no.',
                            //         hint: '',
                            //         isRequired: false),
                            //     // GestureDetector(
                            //     //   onTap: () {
                            //     //     showTimePicker(
                            //     //             context: context,
                            //     //             initialTime: TimeOfDay.now())
                            //     //         .then((value) {
                            //     //       setState(() {
                            //     //         prefTime = value!
                            //     //             .format(context)
                            //     //             .toString();
                            //     //       });
                            //     //     });
                            //     //   },
                            //     //   child: BookingInput(
                            //     //       width: widget.size.width * .15,
                            //     //       inputDate:
                            //     //           prefTime ?? 'Preferred Time',
                            //     //       text: 'Preferred Time',
                            //     //       hint: '',
                            //     //       icon: Icons.lock_clock,
                            //     //       isRequired: false),
                            //     // )
                            //   ],
                            // ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          height: 30,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Checkbox(value: true, onChanged: (v) {}),
                              const SizedBox(
                                height: 15,
                                child: Text(
                                  'I have read and understand the Privacy Policy and Terms and Condition of Ants',
                                  maxLines: 2,
                                  style: TextStyle(fontSize: 14),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              //Image.asset('assets/images/reCaptcha.png'),
                              const SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                height: 50,
                                width: 120,
                                child: CHButton(
                                  name: 'SUBMIT',
                                  type: CHButtonType.blue,
                                  onPressed: () {
                                    context.read<RegistrationBloc>().add(
                                        RegistrationLoadEvent(
                                            fname: firstNameController.text,
                                            lname: lastNameController.text,
                                            email: emailController.text,
                                            contact:
                                                contactNumberController.text,
                                            password: passwordController.text));
                                  },
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}

class CustomInput extends StatelessWidget {
  final String hint;
  final double? width;
  const CustomInput({
    Key? key,
    required this.hint,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 200,
      child: TextField(
        decoration: InputDecoration(
            hintText: hint,
            hintStyle: WeLeadTextStyles.interMedium
                .copyWith(fontSize: 14, color: WeLeadColors.background)),
      ),
    );
  }
}
