// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ants/core/theme/xtendly_colors.dart';
import 'package:ants/core/theme/xtendly_fonts.dart';
import 'package:flutter/material.dart';

class BookingInput extends StatelessWidget {
  final String? inputDate;
  final String text;
  final String hint;
  final IconData? icon;
  final double? width;
  final bool isRequired;
  final TextEditingController? textEditingController;

  const BookingInput({
    Key? key,
    this.inputDate,
    required this.text,
    required this.hint,
    this.icon,
    this.width,
    required this.isRequired,
    this.textEditingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: hint != '' ? 80 : 60,
          width: width ?? size.width * .3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Text(inputDate ?? ''),
              textEditingController != null
                  ? TextField(
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(
                              left: 10, top: 25, right: 10),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.black),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.black),
                          ),
                          hintText: inputDate ?? text,
                          hintStyle: WeLeadTextStyles.interMedium.copyWith(
                              fontSize: 14, color: WeLeadColors.background),
                          suffixIcon: Icon(
                            icon,
                            color: WeLeadColors.background,
                          )),
                      controller: textEditingController,
                    )
                  : Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              inputDate ?? '',
                              style: WeLeadTextStyles.interMedium.copyWith(
                                  fontSize: 14, color: WeLeadColors.background),
                            ),
                            Icon(icon)
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Divider(
                          height: 2,
                          color: WeLeadColors.background,
                        )
                      ],
                    ),

              hint == ''
                  ? const SizedBox(
                      height: 11.5,
                    )
                  : const SizedBox(),
              hint != ''
                  ? Row(
                      children: [
                        RichText(
                            text: TextSpan(children: <TextSpan>[
                          TextSpan(
                              text: hint,
                              style: WeLeadTextStyles.interSmall.copyWith(
                                  color: WeLeadColors.background,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: isRequired ? '*' : '',
                              style: WeLeadTextStyles.interSmall.copyWith(
                                  color: WeLeadColors.redPaint, fontSize: 7))
                        ]))
                      ],
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ],
    );
  }
}
