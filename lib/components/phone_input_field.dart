import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../core/design_system.dart';

class PhoneInputField extends StatelessWidget {
  final String countryCodeInitialValue;
  final List<String> countryCodeFavorite;
  final bool enabled;
  final bool isCountryCodeEnabled;
  final String label;
  final String placeholder;
  final Function onCountryChange;
  final VoidCallback? onPressed;
  final String? Function(String?) validator;
  final TextEditingController phoneTextFieldController;

  const PhoneInputField({
    Key? key,
    required this.countryCodeInitialValue,
    required this.countryCodeFavorite,
    this.enabled = true,
    required this.isCountryCodeEnabled,
    this.label = '',
    this.placeholder = '',
    required this.onCountryChange,
    this.onPressed,
    required this.validator,
    required this.phoneTextFieldController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          child: label == ''
              ? null
              : Column(
                  children: <Widget>[
                    Text(
                      label,
                      style: DSType.subtitle1(
                        textColor: DSColors.bodyDark,
                      ),
                    ),
                    const SizedBox(height: DSSizes.sm),
                  ],
                ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            // Container(
            //   color: Colors.white,
            //   height: 53,
            //   child: CountryCodePicker(
            //     showFlag: false,
            //     // padding: const EdgeInsets.all(0),
            //     onChanged: (CountryCode countryCode) =>
            //         onCountryChange(countryCode),
            //     showDropDownButton: true,
            //     enabled: isCountryCodeEnabled,
            //     initialSelection: countryCodeInitialValue,
            //     favorite: countryCodeFavorite,
            //     textStyle: const TextStyle(
            //       color: DSColors.bodyDark,
            //       fontSize: 16,
            //     ),
            //   ),
            // ),
            Expanded(
              // flex: 7,
              child: TextFormField(
                controller: phoneTextFieldController,
                cursorColor: DSColors.headingDark,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: onPressed,
                    icon: const Icon(Icons.contacts_rounded,
                        color: DSColors.bodyDark),
                  ),
                  contentPadding: const EdgeInsets.only(
                    top: 15,
                    right: DSSizes.md,
                    bottom: 15,
                    left: DSSizes.md,
                  ),
                  isCollapsed: true,
                  hintText: placeholder,
                  hintStyle: DSType.subtitle2(
                    textColor: DSColors.placeHolderLight,
                  ),
                  filled: true,
                  fillColor: DSColors.headingLight,
                ),
                enabled: enabled,
                style: DSType.subtitle1(
                  textColor: DSColors.bodyDark,
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(10),
                ],
                validator: validator,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
