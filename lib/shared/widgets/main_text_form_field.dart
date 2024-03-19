import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_btsid/config/themes/app_colors.dart';
import 'package:test_btsid/config/themes/app_fonts.dart';

import '../models/regex_validations.dart';

class MainTextFormFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String? initialValue;
  final Function(String)? onChanged;
  final FocusNode? focusNode;
  final Function()? onTap;
  final TextCapitalization textCapitalization;
  final TextAlignVertical textAlignVertical;
  final List<RegexValidation> validation;
  final bool readOnly;
  final bool isOutline;
  final bool enabled;
  final bool obscureText;
  final bool isDense;
  final int? maxLines;
  final TextInputType? textInputType;
  final String? labelText;
  final String? helperText;
  final String? hintText;
  final String? errorText;
  final Widget? suffixIcon;
  final Widget? suffix;
  final Widget? prefix;
  final Widget? prefixIcon;
  final String? prefixText;
  final TextStyle? hintStyle;
  final TextStyle? style;
  final TextStyle? labelStyle;
  final TextStyle? errorStyle;
  final int? maxLength;
  final double? borderWidth;
  final Color? borderColor;
  final TextInputAction? textInputAction;
  final FormFieldValidator<String>? validator;
  final AutovalidateMode autovalidateMode;
  final EdgeInsets? contentPadding;
  final Function(String value)? onSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final InputDecoration? decoration;
  final bool rupiahStyleSameAsInput;
  final bool showCounterText;
  final BorderRadius? borderRadius;

  const MainTextFormFieldWidget({
    super.key,
    this.controller,
    this.onTap,
    this.hintText,
    this.validation = const [],
    this.initialValue,
    this.errorText,
    this.prefix,
    this.labelStyle,
    this.prefixIcon,
    this.errorStyle,
    this.onChanged,
    this.contentPadding,
    this.focusNode,
    this.borderColor,
    this.textCapitalization = TextCapitalization.none,
    this.textAlignVertical = TextAlignVertical.bottom,
    this.readOnly = false,
    this.enabled = true,
    this.obscureText = false,
    this.isDense = true,
    this.textInputType,
    this.maxLines = 1,
    this.labelText,
    this.suffixIcon,
    this.suffix,
    this.helperText,
    this.maxLength,
    this.textInputAction,
    this.borderWidth,
    this.validator,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.inputFormatters,
    this.hintStyle,
    this.prefixText,
    this.style,
    this.decoration,
    this.onSubmitted,
    this.showCounterText = false,
    this.borderRadius,
  })  : isOutline = false,
        rupiahStyleSameAsInput = false;

  const MainTextFormFieldWidget.outline({
    super.key,
    this.controller,
    this.onTap,
    this.hintText,
    this.borderColor,
    this.validation = const [],
    this.initialValue,
    this.errorText,
    this.prefix,
    this.labelStyle,
    this.prefixIcon,
    this.borderWidth,
    this.helperText,
    this.errorStyle,
    this.onChanged,
    this.contentPadding,
    this.focusNode,
    this.textCapitalization = TextCapitalization.none,
    this.textAlignVertical = TextAlignVertical.bottom,
    this.readOnly = false,
    this.enabled = true,
    this.obscureText = false,
    this.isDense = true,
    this.textInputType,
    this.maxLines = 1,
    this.labelText,
    this.suffixIcon,
    this.suffix,
    this.maxLength,
    this.textInputAction,
    this.validator,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.inputFormatters,
    this.hintStyle,
    this.prefixText,
    this.style,
    this.decoration,
    this.onSubmitted,
    this.showCounterText = false,
    this.borderRadius,
  })  : isOutline = true,
        rupiahStyleSameAsInput = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlignVertical: textAlignVertical,
      onTap: onTap,
      // initialValue: initialValue,
      controller: controller,
      onChanged: onChanged,
      focusNode: focusNode,
      textCapitalization: textCapitalization,
      readOnly: readOnly,
      enabled: enabled,
      obscureText: obscureText,
      keyboardType: textInputType,
      inputFormatters: inputFormatters,
      maxLength: maxLength,
      maxLines: maxLines,
      validator: validator ??
          ((validation.isEmpty)
              ? (value) {
                  if (value == null) return 'Wajib terisi';
                  if (value.isEmpty) return 'Wajib terisi';
                  return null;
                }
              : (String? value) {
                  String? error;
                  for (var element in validation) {
                    RegExp regExp = RegExp(element.regex);
                    if (!regExp.hasMatch(value!)) {
                      error = element.errorMessage;
                    }
                  }
                  return error;
                }),
      onFieldSubmitted: onSubmitted ??
          (value) {
            FocusScope.of(context).unfocus();
          },
      autovalidateMode: autovalidateMode,
      decoration: decoration ??
          InputDecoration(
            filled: true,
            fillColor: Colors.white,
            prefix: prefix,
            prefixIcon: prefixIcon,
            helperText: helperText,
            labelText: labelText,
            prefixText: prefixText,
            labelStyle: labelStyle,
            helperStyle: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: Colors.red,
            ),
            prefixStyle: style ??
                TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
            // labelStyle: TextUI.placeHolderBlack,
            errorText: errorText,
            errorStyle: errorStyle ??
                TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.red,
                ),
            floatingLabelStyle: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w300,
              color: Colors.black,
            ),
            hintText: hintText,
            hintStyle: hintStyle ??
                TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.greyNeutral40,
                ),

            counterText: showCounterText ? null : '',
            suffixIcon: suffixIcon,
            contentPadding: contentPadding,
            suffixIconConstraints: BoxConstraints(
              minWidth: 24.w,
              // maxHeight: 24.w,
            ),
            suffix: suffix,
            isDense: isDense,
            border: isOutline
                ? OutlineInputBorder(
                    borderRadius:
                        borderRadius ?? BorderRadius.all(Radius.circular(16.r)),
                    borderSide: BorderSide(
                      width: borderWidth ?? 1,
                      color: borderWidth == 0
                          ? Colors.transparent
                          : borderColor ?? AppColors.greyNeutral40,
                    ),
                  )
                : UnderlineInputBorder(
                    borderRadius:
                        borderRadius ?? BorderRadius.all(Radius.circular(16.r)),
                    borderSide: BorderSide(
                      width: borderWidth ?? 1,
                      color: borderWidth == 0
                          ? Colors.transparent
                          : borderColor ?? AppColors.greyNeutral40,
                    ),
                  ),
            focusedBorder: isOutline
                ? OutlineInputBorder(
                    borderRadius:
                        borderRadius ?? BorderRadius.all(Radius.circular(16.r)),
                    borderSide: BorderSide(
                      width: borderWidth ?? 1,
                      color: borderWidth == 0
                          ? Colors.transparent
                          : borderColor ?? AppColors.greyNeutral40,
                    ),
                  )
                : UnderlineInputBorder(
                    borderRadius:
                        borderRadius ?? BorderRadius.all(Radius.circular(16.r)),
                    borderSide: BorderSide(
                      width: borderWidth ?? 1,
                      color: borderWidth == 0
                          ? Colors.transparent
                          : borderColor ?? AppColors.greyNeutral40,
                    ),
                  ),
            disabledBorder: isOutline
                ? OutlineInputBorder(
                    borderRadius:
                        borderRadius ?? BorderRadius.all(Radius.circular(16.r)),
                    borderSide: BorderSide(
                      width: borderWidth ?? 1,
                      color: borderWidth == 0
                          ? Colors.transparent
                          : borderColor ?? AppColors.greyNeutral40,
                    ),
                  )
                : UnderlineInputBorder(
                    borderRadius:
                        borderRadius ?? BorderRadius.all(Radius.circular(16.r)),
                    borderSide: BorderSide(
                      width: borderWidth ?? 1,
                      color: borderWidth == 0
                          ? Colors.transparent
                          : borderColor ?? AppColors.greyNeutral40,
                    ),
                  ),
            errorBorder: isOutline
                ? OutlineInputBorder(
                    borderRadius:
                        borderRadius ?? BorderRadius.all(Radius.circular(16.r)),
                    borderSide: BorderSide(
                      width: borderWidth ?? 1,
                      color: borderWidth == 0
                          ? Colors.transparent
                          : borderColor ?? Colors.red,
                    ),
                  )
                : UnderlineInputBorder(
                    borderRadius:
                        borderRadius ?? BorderRadius.all(Radius.circular(16.r)),
                    borderSide: BorderSide(
                      width: borderWidth ?? 1,
                      color: borderWidth == 0
                          ? Colors.transparent
                          : borderColor ?? Colors.red,
                    ),
                  ),
            enabledBorder: isOutline
                ? OutlineInputBorder(
                    borderRadius:
                        borderRadius ?? BorderRadius.all(Radius.circular(16.r)),
                    borderSide: BorderSide(
                      width: borderWidth ?? 1,
                      color: borderWidth == 0
                          ? Colors.transparent
                          : borderColor ?? AppColors.greyNeutral40,
                    ),
                  )
                : UnderlineInputBorder(
                    borderRadius:
                        borderRadius ?? BorderRadius.all(Radius.circular(16.r)),
                    borderSide: BorderSide(
                      width: borderWidth ?? 1,
                      color: borderWidth == 0
                          ? Colors.transparent
                          : borderColor ?? AppColors.greyNeutral40,
                    ),
                  ),
            focusedErrorBorder: isOutline
                ? OutlineInputBorder(
                    borderRadius:
                        borderRadius ?? BorderRadius.all(Radius.circular(16.r)),
                    borderSide: BorderSide(
                      width: borderWidth ?? 1,
                      color: borderWidth == 0
                          ? Colors.transparent
                          : borderColor ?? Colors.red,
                    ),
                  )
                : UnderlineInputBorder(
                    borderRadius:
                        borderRadius ?? BorderRadius.all(Radius.circular(16.r)),
                    borderSide: BorderSide(
                      width: borderWidth ?? 1,
                      color: borderWidth == 0
                          ? Colors.transparent
                          : borderColor ?? Colors.red,
                    ),
                  ),
          ),
      style: style ??
          TextStyle(
            color: enabled ? Colors.black : AppColors.greyNeutral40,
            fontSize: 14.sp,
            fontFamily: AppFonts.roboto,
            fontWeight: FontWeight.w400,
          ),
      textInputAction: textInputAction ?? TextInputAction.done,
    );
  }
}
