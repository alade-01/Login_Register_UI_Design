import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login_register_ui_design/core/constants.dart';

class OnboardingItem extends StatelessWidget {
  final String? title, text, image;

  const OnboardingItem({
    Key? key,
    this.title,
    this.text,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
            child: Center(
              child: SvgPicture.asset(
                image!,
              ),
            )),
        Padding(
          padding: const EdgeInsets.only(top: 1, bottom: 5),
          child: Text(
            title!,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: secondaryColor, fontSize: 36, fontWeight: FontWeight.w700),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Text(
            text!,
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: secondaryColor, fontSize: 24, fontWeight: FontWeight.w300
            ),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}