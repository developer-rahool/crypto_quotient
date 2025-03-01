import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:crypto_quotient/const.dart';

// ignore: must_be_immutable
class AppTextFormField extends StatelessWidget {
  Widget? suffixIcon;
  Widget? prefixIcon;
  TextEditingController? ctrl;
  TextInputAction? textInputAction;
  String? hintText;
  double? hintsize;
  double? radius;
  EdgeInsetsGeometry? contentPadding;
  TextStyle? style;
  FloatingLabelBehavior? floatingLabelBehavior;
  //final bool floatingLabelBehavior;
  bool? obscureText;
  Color? labelColor;
  Color? greyEnable;
  String? labelText;
  double? labelsize;
  double? width;
  double? height;
  int? maxLength;
  bool? autofocus;
  int? maxLengthLine;
  BoxConstraints? suffixIconConstraints;
  Iterable<String>? autofillHints;
  TextInputType? keyboardType;
  Function()? onEditingComplete;
  String? Function(String?)? validator;
  String? Function(String?)? onChanged;
  FocusNode? focusNode;
  Function? onFieldSubmitted;
  TextEditingController appController;
  bool readOnlyColor;
  bool? readOnlyField;
  void Function()? onTap;
  List<TextInputFormatter>? inputFormatterText;
  bool? enabled;
  bool isRequiredTextField;

  AppTextFormField({
    super.key,
    this.radius,
    this.suffixIcon,
    this.prefixIcon,
    this.labelColor,
    this.style,
    this.isRequiredTextField = false,
    this.greyEnable,
    this.maxLengthLine,
    this.contentPadding,
    this.readOnlyField,
    this.floatingLabelBehavior,
    this.textInputAction,
    this.suffixIconConstraints,
    this.ctrl,
    //this.floatingLabelBehavior = false,
    this.onEditingComplete,
    this.autofocus,
    this.width,
    this.height,
    this.maxLength,
    this.autofillHints,
    this.hintText,
    this.hintsize,
    this.keyboardType,
    this.onFieldSubmitted,
    this.focusNode,
    this.validator,
    this.obscureText,
    required this.appController,
    this.readOnlyColor = false,
    this.onTap,
    this.onChanged,
    this.inputFormatterText,
    this.labelText,
    this.labelsize,
    this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextFormField(
        maxLines: maxLengthLine,
        style: style ??
            TextStyle(
              color: readOnlyColor ? midBlackColor : darkBlackColor,
              fontWeight: FontWeight.w400,
              fontSize: MediaQuery.of(context).size.height * 0.025,
            ),
        enabled: enabled ?? true,
        autofillHints: autofillHints,
        onTap: onTap,
        onChanged: onChanged,
        inputFormatters: inputFormatterText,
        readOnly: readOnlyField ?? false,
        controller: appController,
        maxLength: maxLength,
        keyboardType: keyboardType,
        obscureText: obscureText ?? false,
        focusNode: focusNode,
        //style: TextStyle(fontWeight: FontWeight.bold),
        onFieldSubmitted: (value) => onFieldSubmitted!(value),
        onEditingComplete: onEditingComplete,
        validator: validator,

        decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            floatingLabelBehavior:
                floatingLabelBehavior ?? FloatingLabelBehavior.always,
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            contentPadding: contentPadding ??
                const EdgeInsets.symmetric(vertical: 19, horizontal: 10),
            hintText: hintText,
            labelText: isRequiredTextField ? "$labelText *" : labelText,

            //label: Text(hintText.toString()),
            suffixIconConstraints: suffixIconConstraints,
            hintStyle: TextStyle(
                color: readOnlyColor ? Colors.black45 : mainBlueColor,
                fontSize:
                    hintsize ?? MediaQuery.of(context).size.height * 0.025,
                fontWeight: FontWeight.w400),
            labelStyle: TextStyle(
                color: readOnlyColor
                    ? Colors.black45
                    : labelColor ?? Colors.black45,
                fontSize:
                    labelsize ?? MediaQuery.of(context).size.height * 0.025,
                fontWeight: FontWeight.w600),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius ?? 10),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius ?? 10),
              borderSide: const BorderSide(color: Colors.transparent),
            ),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius ?? 10),
                borderSide: const BorderSide(color: Colors.transparent)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius ?? 10),
                borderSide: const BorderSide(color: Colors.transparent))),
      ),
    );
  }
}
