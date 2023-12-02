import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_register_ui_design/components/shared/background.dart';

import '../../components/shared/app_button.dart';
import '../../core/constants.dart';
import '../core/router_generator.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({Key? key}) : super(key: key);

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  //Initially password is obscure
  bool _obscureTextFieldOne = true,
      _obscureTextFieldTwo = true,
      loading = false;

  final TextEditingController _passwordController = TextEditingController(),
      _passwordControllerConfirm = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
        child: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: BUTTON_SEPARATION_SPACE * 9),
                  Text(
                    "Create new password",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: secondaryColor,
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Text(
                      "Your new password must be unique from those previously used.",
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
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 17),
                          child: TextFormField(
                            validator: (String? value) {
                              if (value != null && value.isEmpty) {
                                return "This field is required";
                              }
                              return null;
                            },
                            style: textStyleInput,
                            controller: _passwordController,
                            obscureText: _obscureTextFieldOne,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(
                                CupertinoIcons.lock,
                              ),
                              hintText: "New Password",
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _obscureTextFieldOne =
                                        !_obscureTextFieldOne;
                                  });
                                },
                                child: Icon(
                                  _obscureTextFieldOne
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                              ),
                            ),
                            keyboardType: TextInputType.text,
                          ),
                        ),
                        Container(
                          child: TextFormField(
                            validator: (String? value) {
                              if (value != null && value.isEmpty) {
                                return "This field is required";
                              }
                              if (value != _passwordController.text) {
                                return "Different password";
                              }
                              return null;
                            },
                            style: textStyleInput,
                            controller: _passwordControllerConfirm,
                            obscureText: _obscureTextFieldTwo,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(
                                CupertinoIcons.lock,
                              ),
                              hintText: "Confirm Password",
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _obscureTextFieldTwo =
                                        !_obscureTextFieldTwo;
                                  });
                                },
                                child: Icon(
                                  _obscureTextFieldTwo
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                              ),
                            ),
                            keyboardType: TextInputType.text,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: BUTTON_SEPARATION_SPACE * 4),
                  AppButton(
                    callback: () {
                      if (formKey.currentState!.validate()) {
                        Navigator.pushNamed(
                            context, RouterGenerator.passwordChangedRoute);
                      }
                    },
                    label: "Reset Password",
                    scrIcon: Icons.arrow_forward_ios_outlined,
                    buttonType: ButtonType.PRIMARY,
                    width: size.width,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
