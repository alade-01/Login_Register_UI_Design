import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Expanded(
            child: SvgPicture.asset(
              image!,
            )),
        Padding(
          padding: const EdgeInsets.only(top: 1, bottom: 20),
          child: Text(
            title!,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Color(0xFF252525), fontSize: 26, fontWeight: FontWeight.w700),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            text!,
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Color(0xFF252525), fontSize: 24, fontWeight: FontWeight.w700
            ),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}