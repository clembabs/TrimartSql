import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sql_app/src/core/constants/app_colors.dart';
import 'package:sql_app/src/core/constants/app_text_styles.dart';

final outlineBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(6.0),
  borderSide: const BorderSide(
    color: AppColors.grey,
  ),
);

final focusedBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(6.0),
  borderSide: const BorderSide(
    color: AppColors.primaryColor,
  ),
);

class BoxFormField extends StatefulWidget {
  final String? formLabel;
  final TextStyle? labelStyle;
  final String? hintText;
  final TextStyle? hintStyle;
  final String? errorText;
  final ValueChanged<String>? onChanged;
  final GestureTapCallback? onTap;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final int? minLines;
  final int? maxLines;
  final Widget? suffixIcon;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final TextCapitalization? textCapitalization;
  final AutovalidateMode? autovalidateMode;
  final TextEditingController? controller;
  final bool readOnly;
  final String? initialValue;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final InputBorder? border;
  final EdgeInsetsGeometry? contentPadding;
  final BoxConstraints? suffixIconConstraints;
  final BoxConstraints? prefixIconConstraints;
  final double? cursorHeight;
  final Widget? prefixIcon;
  final FocusNode? focusNode;
  final void Function(String)? onSubmitted;

  const BoxFormField({
    Key? key,
    this.hintText,
    this.hintStyle,
    this.errorText,
    this.onChanged,
    this.onTap,
    this.onSaved,
    this.validator,
    this.controller,
    this.minLines,
    this.maxLines,
    this.prefixIcon,
    this.suffixIcon,
    this.textInputAction,
    this.inputFormatters,
    this.keyboardType,
    this.textCapitalization,
    this.autovalidateMode,
    this.readOnly = false,
    this.initialValue,
    this.focusedBorder,
    this.enabledBorder,
    this.border,
    this.contentPadding,
    this.suffixIconConstraints,
    this.prefixIconConstraints,
    this.formLabel,
    this.labelStyle,
    this.cursorHeight,
    this.focusNode,
    this.onSubmitted,
  }) : super(key: key);

  @override
  State<BoxFormField> createState() => _BoxFormFieldState();
}

class _BoxFormFieldState extends State<BoxFormField> {
  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.formLabel != null)
            Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(bottom: 8),
              child: Text(
                widget.formLabel!,
                style: widget.labelStyle ??
                    AppTextStyles.bodySmall.copyWith(
                      fontSize: 15.sp,
                    ),
              ),
            ),
          Flexible(
            child: GestureDetector(
              onTap: widget.onTap,
              child: TextFormField(
                cursorColor: AppColors.primaryColor,
                initialValue: widget.initialValue,
                focusNode: widget.focusNode,
                onFieldSubmitted: widget.onSubmitted,
                textCapitalization:
                    widget.textCapitalization ?? TextCapitalization.none,
                enabled: widget.onTap == null,
                keyboardType: widget.keyboardType,
                inputFormatters: widget.inputFormatters,
                validator: widget.validator,
                autovalidateMode: widget.autovalidateMode,
                onChanged: widget.onChanged,
                controller: widget.controller,
                onSaved: widget.onSaved,
                minLines: widget.minLines,
                maxLines: widget.maxLines ?? 1,
                readOnly: widget.readOnly,
                cursorHeight: widget.cursorHeight,
                style: AppTextStyles.mainCaption,
                textInputAction: widget.textInputAction,
                decoration: InputDecoration(
                  filled: true,
                  contentPadding: widget.contentPadding ??
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  errorText: widget.errorText,
                  hintText: widget.hintText,
                  hintStyle: AppTextStyles.regular.copyWith(
                    color: AppColors.black.withOpacity(.5),
                  ),
                  border: widget.border ?? outlineBorder,
                  enabledBorder: widget.enabledBorder ?? outlineBorder,
                  focusedBorder: widget.focusedBorder ?? focusedBorder,
                  suffixIcon: widget.suffixIcon,
                  prefixIcon: widget.prefixIcon,
                  prefixIconConstraints: widget.prefixIconConstraints,
                  suffixIconConstraints: widget.suffixIconConstraints,
                ),
              ),
            ),
          ),
        ],
      );
}
