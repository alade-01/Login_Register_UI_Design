import 'dart:math';

import 'package:flutter/material.dart';

import '../../../core/constants.dart';

class AppButton extends StatelessWidget {
  final Function? callback;
  final String label;
  ButtonType? buttonType;
  double? width;
  bool loading;
  bool solid;
  bool showBorder;
  double horizontalPadding;
  IconData? scrIcon;

  AppButton({
    super.key,
    this.callback,
    required this.label,
    this.buttonType = ButtonType.PRIMARY,
    this.width,
    this.scrIcon,
    this.loading = false,
    this.solid = true,
    this.horizontalPadding = 0,
    this.showBorder = true,
  });

  @override
  Widget build(BuildContext context) {
    ButtonStyle styleButton = getButtonStyle(context);

    double width = this.width ?? MediaQuery.of(context).size.width * .7;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding)
          .copyWith(bottom: 0),
      margin: const EdgeInsets.symmetric(horizontal: 0),
      width: width,
      height: min(width / 1, 55),
      child: loading
          ? Center(
              child: CircularProgressIndicator(
                  strokeWidth: 4, color: primaryColor),
            )
          : TextButton(
              onPressed: callback != null
                  ? () {
                      callback!();
                    }
                  : null,
              style: styleButton.copyWith(
                side: showBorder
                    ? null
                    : const MaterialStatePropertyAll(
                        BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                backgroundColor: solid
                    ? null
                    : const MaterialStatePropertyAll(
                        Colors.white,
                      ),
                foregroundColor: buttonType == ButtonType.TEXT
                    ? MaterialStatePropertyAll(secondaryColor)
                    : solid
                        ? null
                        : MaterialStatePropertyAll(
                            buttonType == ButtonType.PRIMARY
                                ? primaryColor
                                : buttonType == ButtonType.SECONDARY
                                    ? secondaryColor
                                    : Colors.black,
                          ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: Text(
                      label,
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Icon(scrIcon ,color: Colors.white,),
                ],
              ),
            ),
    );
  }

  ButtonStyle getButtonStyle(BuildContext context) {
    switch (buttonType) {
      case ButtonType.PRIMARY:
        return Theme.of(context).textButtonTheme.style!.copyWith(
              backgroundColor: callback == null
                  ? MaterialStatePropertyAll(Colors.grey.shade400)
                  : MaterialStatePropertyAll(primaryColor),
              foregroundColor: const MaterialStatePropertyAll(Colors.white),
              side: MaterialStatePropertyAll(
                BorderSide(
                  color: callback == null ? Colors.grey.shade500 : color0[900]!,
                  width: 1.5,
                ),
              ),
            );
        break;
      case ButtonType.SECONDARY:
        return Theme.of(context).textButtonTheme.style!.copyWith(
              backgroundColor: callback == null
                  ? MaterialStatePropertyAll(Colors.grey.shade400)
                  : MaterialStatePropertyAll(secondaryColor),
              foregroundColor: const MaterialStatePropertyAll(Colors.white),
              side: MaterialStatePropertyAll(
                BorderSide(
                  color: callback == null ? Colors.grey.shade500 : color1[900]!,
                  width: 1.5,
                ),
              ),
            );
        break;
      case ButtonType.TEXT:
        return Theme.of(context).textButtonTheme.style!.copyWith(
              backgroundColor: callback == null
                  ? MaterialStatePropertyAll(Colors.grey.shade400)
                  : const MaterialStatePropertyAll(Colors.black12),
              side: const MaterialStatePropertyAll(
                BorderSide.none,
              ),
            );
      default:
        return Theme.of(context).textButtonTheme.style!.copyWith(
              backgroundColor: callback == null
                  ? MaterialStatePropertyAll(Colors.grey.shade400)
                  : const MaterialStatePropertyAll(Colors.black12),
              side: MaterialStatePropertyAll(
                BorderSide(
                  color: callback == null ? Colors.grey.shade500 : color1[900]!,
                  width: 1.5,
                ),
              ),
            );
    }
  }
}