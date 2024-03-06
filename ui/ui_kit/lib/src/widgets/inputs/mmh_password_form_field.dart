import 'package:flutter/material.dart';
import 'package:ui_kit/src/styles/app_styles.dart';

class MMHPasswordFormFieldModel {
  final String? initialValue;
  final String? labelText;
  final String? hintText;
  final String? errorText;
  final String? helperText;

  MMHPasswordFormFieldModel({
    this.initialValue,
    this.labelText,
    this.hintText,
    this.errorText,
    this.helperText,
  });
}

class MMHPasswordFormField extends StatefulWidget {
  final MMHPasswordFormFieldModel model;
  final void Function(String) onChanged;

  const MMHPasswordFormField({
    super.key,
    required this.model,
    required this.onChanged,
  });

  @override
  State<MMHPasswordFormField> createState() => _MMHPasswordFormFieldState();
}

class _MMHPasswordFormFieldState extends State<MMHPasswordFormField> {
  bool passwordHidden = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.model.labelText ?? '',
          style: AppTextStyle.titleLarge.copyWith(color: AppColors.overlayDark),
        ),
        TextFormField(
          initialValue: widget.model.initialValue,
          onChanged: widget.onChanged,
          keyboardType: TextInputType.text,
          obscureText: passwordHidden,
          style: AppTextStyle.titleSmall.copyWith(color: AppColors.overlayDark),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(AppSpaces.s8),
            hintText: widget.model.hintText,
            helperText: widget.model.helperText,
            errorText: widget.model.errorText,
            suffixIcon: IconButton(
              icon: Icon(
                passwordHidden
                    ? Icons.visibility_rounded
                    : Icons.visibility_off_rounded,
                color: AppColors.primary,
                size: 20,
              ),
              onPressed: () => setState(() {
                passwordHidden = !passwordHidden;
              }),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppBorderRadius.br8),
              borderSide: const BorderSide(color: AppColors.primary),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppBorderRadius.br8),
              borderSide: const BorderSide(color: AppColors.black2),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppBorderRadius.br8),
              borderSide: const BorderSide(color: AppColors.black2),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppBorderRadius.br8),
              borderSide: const BorderSide(color: AppColors.black2),
            ),
          ),
        ),
      ],
    );
  }
}
