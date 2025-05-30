import 'package:flutter/material.dart';
import 'package:ui_kit/src/styles/app_styles.dart';

class MMHDropdownButton<T> extends StatelessWidget {
  const MMHDropdownButton({
    super.key,
    required this.values,
    required this.currentValue,
    required this.onChange,
  });

  final List<T> values;
  final T currentValue;
  final Function(T?) onChange;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.colors.surface,
      borderRadius: BorderRadius.circular(AppBorderRadius.br12),
      child: DropdownButtonFormField<T>(
        elevation: 1,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(AppSpaces.s8),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: context.colors.outline.withValues(alpha: 0.25),
            ),
            borderRadius: BorderRadius.circular(AppBorderRadius.br12),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: context.colors.outline.withValues(alpha: 0.25),
            ),
            borderRadius: BorderRadius.circular(AppBorderRadius.br12),
          ),
        ),
        dropdownColor: context.colors.surface,
        menuMaxHeight: MediaQuery.of(context).size.height / 2,
        icon: Icon(
          Icons.arrow_drop_down_rounded,
          color: context.colors.outline,
        ),
        value: currentValue,
        onChanged: onChange,
        items: values.map((T? value) {
          return DropdownMenuItem<T>(
            value: value,
            child: Text(
              value.toString(),
              style: AppTextStyle.titleSmall.copyWith(
                color: context.colors.onSurface,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
