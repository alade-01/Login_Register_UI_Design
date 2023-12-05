import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../components/shared/app_button.dart';
import '../components/shared/background.dart';
import '../core/constants.dart';
import '../core/router_generator.dart';

class OtpsScreen extends StatefulWidget {
  const OtpsScreen({super.key});

  @override
  State<OtpsScreen> createState() => _OtpsScreenState();
}

class _OtpsScreenState extends State<OtpsScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
        child: Padding(
      padding: const EdgeInsets.all(20),
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
                    "OTP Verification",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: secondaryColor,
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Text(
                      "Please enter the 4-digit code sent to your "
                          "email hemmyhtec@gmail.com for verification.",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: secondaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w300),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: BUTTON_SEPARATION_SPACE * 2),
                  Form(
                    key: formKey,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ...List.generate(
                          4,
                          (index) => SizedBox(
                            // height: 64,
                            width: 75,
                            child: TextFormField(
                              validator: (String? value) {
                                if (value != null && value.isEmpty) {
                                   return "*";
                                }
                                return null;
                              },
                              onChanged: (value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              decoration: const InputDecoration(hintText: "0"),
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: BUTTON_SEPARATION_SPACE * 4),
                  AppButton(
                    callback: () {
                       if (formKey.currentState!.validate()) {
                         Navigator.pushNamed(context, RouterGenerator.newPasswordRoute);
                       }
                    },
                    label: "Verify",
                    scrIcon: Icons.arrow_forward_ios_outlined,
                    buttonType: ButtonType.PRIMARY,
                    width: size.width,
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: RichText(
              text: TextSpan(
                text: 'Didn’t received code? ',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    fontSize: 15,
                    color: const Color(0xFF24282C),
                    fontWeight: FontWeight.w500),
                children: <TextSpan>[
                  TextSpan(
                      text: 'Resend',
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          fontSize: 15,
                          color: primaryColor,
                          fontWeight: FontWeight.w700))
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
