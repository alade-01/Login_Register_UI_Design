import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../components/shared/app_button.dart';
import '../core/constants.dart';
import '../core/router_generator.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "Welcome To Home ",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: secondaryColor,
                    fontSize: 24,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: BUTTON_SEPARATION_SPACE * 1.5),
              SvgPicture.asset(
                "res/images/welcomeImage.svg",
                // width: 100,
                //  height: 100,
              ),
              const SizedBox(height: BUTTON_SEPARATION_SPACE * 4),
              Text(
                "Currently The Next Part of Home"
                " Activity & Fragementation is under development. The upcoming Part 2 is coming Soon........",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: secondaryColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: BUTTON_SEPARATION_SPACE * 3.5),
              AppButton(
                callback: () =>
                    Navigator.pushNamed(context, RouterGenerator.loginRoute),
                label: "Logout",
                scrIcon: Icons.logout,
                buttonType: ButtonType.PRIMARY,
                width: size.width * 0.9,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
