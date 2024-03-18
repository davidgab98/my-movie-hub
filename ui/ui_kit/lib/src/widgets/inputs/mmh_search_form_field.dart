import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

class MMHSearchField extends StatefulWidget {
  const MMHSearchField({
    super.key,
    required this.onChanged,
  });

  final void Function(String value) onChanged;

  @override
  State<MMHSearchField> createState() => _MMHSearchFieldState();
}

class _MMHSearchFieldState extends State<MMHSearchField> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.colors.surface,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: context.colors.outline.withOpacity(0.25)),
        borderRadius: BorderRadius.circular(AppBorderRadius.br12),
      ),
      child: TextFormField(
        controller: _controller,
        style: AppTextStyle.titleSmall,
        cursorColor: context.colors.onBackground,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            splashRadius: AppBorderRadius.br20,
            icon: Icon(
              Icons.close_rounded,
              color: context.colors.outline,
              size: 20,
            ),
            onPressed: () {
              _controller.clear();
              widget.onChanged('');
            },
          ),
          icon: Padding(
            padding: const EdgeInsets.only(left: AppSpaces.s10),
            child: Icon(
              Icons.search_rounded,
              color: context.colors.onBackground,
            ),
          ),
          hintText: 'Buscar...',
          hintStyle: AppTextStyle.titleSmall.copyWith(
            color: context.colors.outline,
          ),
          border: InputBorder.none,
        ),
        onChanged: (value) {
          widget.onChanged(value);
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
