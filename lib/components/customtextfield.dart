import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:adwattask/config/colors.dart';

class CustomTextfield extends StatelessWidget {
  final String hint, label;
  final Widget suffix;
  final IconData priffix;
  final TextEditingController controller;
  final bool isobscure, borderd, enabled;
  final int validator;
  final Function customvalidator;

  CustomTextfield(
      {Key key,
      this.hint,
      this.label,
      this.priffix = null,
      this.suffix = null,
      this.controller,
      this.isobscure = false,
      this.validator = null,
      this.customvalidator = null,
      this.borderd = true,
      this.enabled = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<MultiValidator> validators = [
      MultiValidator([
        RequiredValidator(errorText: "this field is required"),
      ]),
      MultiValidator([
        RequiredValidator(errorText: "this field is required"),
        EmailValidator(errorText: "this email is not valid")
      ]),
      MultiValidator([
        RequiredValidator(errorText: "this field is required"),
        MinLengthValidator(8, errorText: ''),
        PatternValidator(r'(?=.*?[#?!@$%^&*-])',
            errorText:
                "the password should have at least one special charachter"),
      ]),
    ];
    return TextFormField(
        enabled: enabled,
        controller: controller,
        obscureText: isobscure,
        decoration: new InputDecoration(
            focusedBorder: borderd == true
                ? OutlineInputBorder(
                    borderSide: new BorderSide(color: accentcolor))
                : null,
            border: borderd == true
                ? OutlineInputBorder(
                    borderSide: new BorderSide(color: accentcolor))
                : null,
            hintText: hint,
            labelText: label,
            labelStyle: TextStyle(
              color: textcolor,
            ),
            prefixIcon: Icon(
              priffix,
              color: accentcolor,
            ),
            prefixText: ' ',
            suffix: suffix,
            suffixStyle: TextStyle(
              color: accentcolor,
            )),
        validator: validators[validator]);
  }
}
