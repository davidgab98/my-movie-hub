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
          style: AppTextStyle.titleLarge.copyWith(
            color: context.colors.onBackground,
          ),
        ),
        TextFormField(
          initialValue: widget.model.initialValue,
          onChanged: widget.onChanged,
          keyboardType: TextInputType.text,
          obscureText: passwordHidden,
          style: AppTextStyle.titleSmall.copyWith(
            color: context.colors.onBackground,
          ),
          cursorColor: context.colors.outline,
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
                color: context.colors.outline,
                size: 20,
              ),
              onPressed: () => setState(() {
                passwordHidden = !passwordHidden;
              }),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppBorderRadius.br8),
              borderSide: BorderSide(color: context.colors.onBackground),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppBorderRadius.br8),
              borderSide: BorderSide(
                color: context.colors.outline,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppBorderRadius.br8),
              borderSide: BorderSide(
                color: context.colors.outline,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppBorderRadius.br8),
              borderSide: BorderSide(
                color: context.colors.outline,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
