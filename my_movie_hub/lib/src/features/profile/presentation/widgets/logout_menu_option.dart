import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_movie_hub/src/core-ui/modals/actions_modal_bottom_sheet.dart';
import 'package:my_movie_hub/src/core/di/service_locator.dart';
import 'package:my_movie_hub/src/core/events/event_bus.dart';
import 'package:my_movie_hub/src/core/events/events.dart';
import 'package:my_movie_hub/src/core/routing/app_router.dart';
import 'package:ui_kit/ui_kit.dart';

class LogOutMenuOption extends StatelessWidget {
  const LogOutMenuOption({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => showActionsModalBottomSheet(
        context: context,
        title: '¿Seguro que deseas salir?',
        modalActions: [
          ModalActionModel(title: 'Cancelar', action: () {}),
          ModalActionModel(
            title: 'Cerrar sesión',
            titleColor: AppColors.red,
            action: () {
              locator<IEventBus>().emitEvent(LogOutEvent());
              context.goNamed(AppRoute.signIn.name);
            },
          )
        ],
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppBorderRadius.br40,
      ),
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: context.colors.secondary.withOpacity(0.1),
        ),
        child: Icon(
          Icons.logout_rounded,
          color: context.colors.tertiary,
        ),
      ),
      title: Text(
        'Cerrar sesión',
        style: AppTextStyle.headlineSmall.copyWith(
          color: AppColors.red,
        ),
      ),
    );
  }
}
