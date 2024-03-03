import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

class ErrorDataReloadPlaceholder extends StatelessWidget {
  const ErrorDataReloadPlaceholder({super.key, this.message, this.onReload});

  final String? message;
  final VoidCallback? onReload;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppSpaces.gapH20,
          Text(
            message ??
                'No se han podido cargar los datos, comprueba la conexión a internet',
            style: AppTextStyle.bodySmall,
            textAlign: TextAlign.center,
          ),
          AppSpaces.gapH20,
          ElevatedButton(
            onPressed: onReload,
            child: const Text('Recargar'),
          ),
        ],
      ),
    );
  }
}
