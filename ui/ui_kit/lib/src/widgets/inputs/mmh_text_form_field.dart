import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui_kit/ui_kit.dart';

enum MMHTextFormFieldType {
  text,
  number,
  phone,
  email,
}

class MMHTextFormFieldModel {
  final MMHTextFormFieldType type;
  final String? initialValue;
  final String? value;
  final String? labelText;
  final String? hintText;
  final String? errorText;
  final String? helperText;
  final IconData? trailingIcon;
  final TextEditingController? controller;
  final bool showIsValidated;

  MMHTextFormFieldModel({
    required this.type,
    this.initialValue,
    this.value,
    this.labelText,
    this.hintText,
    this.errorText,
    this.helperText,
    this.trailingIcon,
    this.controller,
    this.showIsValidated = false,
  });
}

class MMHTextFormField extends StatelessWidget {
  final MMHTextFormFieldModel model;
  final void Function(String)? onChanged;
  final void Function()? trailingIconOnPressed;

  const MMHTextFormField({
    super.key,
    required this.model,
    this.onChanged,
    this.trailingIconOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          model.labelText ?? '',
          style: AppTextStyle.titleLarge.copyWith(
            color: context.colors.onBackground,
          ),
        ),
        Stack(
          alignment: Alignment.centerRight,
          children: [
            TextFormField(
              inputFormatters: [
                FilteringTextInputFormatter.deny('  '),
                _NoLeadingSpaceFormatter(),
              ],
              initialValue: model.initialValue,
              controller: model.value != null
                  ? TextEditingController(text: model.value)
                  : model.controller,
              style: AppTextStyle.titleSmall
                  .copyWith(color: context.colors.onBackground),
              onChanged: onChanged,
              keyboardType: _getKeyboardTypeByType(),
              enabled: onChanged != null,
              cursorColor: context.colors.outline,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(AppSpaces.s8),
                hintText: model.hintText,
                helperText: model.helperText,
                errorText: model.errorText,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppBorderRadius.br8),
                  borderSide: BorderSide(color: context.colors.onBackground),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppBorderRadius.br8),
                  borderSide: BorderSide(
                    color: context.colors.outline,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
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
                fillColor: context.colors.surface,
                filled: onChanged == null,
                suffixIcon: model.showIsValidated
                    ? Icon(
                        Icons.check_rounded,
                        color: context.colors.secondary,
                      )
                    : null,
              ),
            ),
            if (model.trailingIcon != null)
              IconButton(
                onPressed: trailingIconOnPressed,
                icon: Icon(model.trailingIcon),
              ),
          ],
        ),
      ],
    );
  }

  TextInputType? _getKeyboardTypeByType() {
    switch (model.type) {
      case MMHTextFormFieldType.text:
        return TextInputType.name;
      case MMHTextFormFieldType.number:
        return TextInputType.number;
      case MMHTextFormFieldType.phone:
        return TextInputType.phone;
      case MMHTextFormFieldType.email:
        return TextInputType.emailAddress;
    }
  }
}

class _NoLeadingSpaceFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.startsWith(' ')) {
      final String trimedText = newValue.text.trimLeft();

      return TextEditingValue(
        text: trimedText,
        selection: TextSelection(
          baseOffset: trimedText.length,
          extentOffset: trimedText.length,
        ),
      );
    }

    return newValue;
  }
}
