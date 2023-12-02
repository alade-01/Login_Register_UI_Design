import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_register_ui_design/components/shared/background.dart';

import '../../components/shared/app_button.dart';
import '../../core/utilis.dart';
import '../../core/constants.dart';
import '../core/router_generator.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
        child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: BUTTON_SEPARATION_SPACE * 9),
                  Text(
                    "Forgot Password",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: secondaryColor,
                        fontSize: 24,
                        fontWeight: FontWeight.w500),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Text(
                      "Enter your email to receive the code to \n change your password",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: secondaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w300),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: BUTTON_SEPARATION_SPACE * 4.5),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Container(
                          child: TextFormField(
                            controller: emailControler,
                            validator: (String? value) {
                              if (value != null && value.isEmpty) {
                                return "This field is required";
                              }
                              if (value != null &&
                                  value.isNotEmpty &&
                                  !StringUtil.isValidEmail(value)) {
                                return "The email is invalid";
                              }
                              return null;
                            },
                            style: textStyleInput,
                            decoration: const InputDecoration(
                              prefixIcon: Icon(CupertinoIcons.at),
                              hintText: "Email",
                            ),
                            keyboardType: TextInputType.text,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: BUTTON_SEPARATION_SPACE * 5),
                  AppButton(
                    callback: () {
                      if (formKey.currentState!.validate()) {
                        Navigator.pushNamed(context, RouterGenerator.otpRoute);
                      }
                    },
                    label: "Receive my code",
                    scrIcon: Icons.arrow_forward_ios_outlined,
                    buttonType: ButtonType.PRIMARY,
                    width: size.width,
                    horizontalPadding: 0,
                  ),
                  const SizedBox(height: BUTTON_SEPARATION_SPACE * 4),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () =>
                Navigator.pushNamed(context, RouterGenerator.loginRoute),
            child: RichText(
              text: TextSpan(
                text: 'To come back" ',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    fontSize: 13,
                    color: const Color(0xFF24282C),
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
