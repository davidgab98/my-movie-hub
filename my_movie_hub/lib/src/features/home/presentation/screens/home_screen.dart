import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_movie_hub/src/core/di/service_locator.dart';
import 'package:my_movie_hub/src/core/network/network_service.dart';
import 'package:my_movie_hub/src/core/routing/app_router.dart';
import 'package:ui_kit/ui_kit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('appTitle'.tr()),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'homeTitle'.tr(),
            ),
          ),
          ElevatedButton(
            onPressed: () => context.goNamed(AppRoute.a.name),
            child: const Text('Go to App'),
          ),
          AppSpaces.gapH16,
          TextButton(
            onPressed: () async {
              final response = await locator<NetworkService>().get(
                '/authentication/token/new',
              );

              print(response);
            },
            child: const Text('Generar token de solicitud'),
          ),
          TextButton(
            onPressed: () async {
              try {
                final response = await locator<NetworkService>().post(
                  '/authentication/token/validate_with_login',
                  queryParameters: {
                    'username': 'marinamolamucho',
                    'password': 'Gg..24689./Tmdb',
                    'request_token': '204c57657890a4877fe259fc44bfabb82c0bbabc',
                  },
                );
                print(response);
              } catch (e) {
                print(e);
              }
            },
            child: const Text('Validar token con login'),
          ),
          TextButton(
            onPressed: () async {
              try {
                final response = await locator<NetworkService>().post(
                  '/authentication/session/new',
                  queryParameters: {
                    'request_token': '204c57657890a4877fe259fc44bfabb82c0bbabc',
                  },
                );
                print(response);
              } catch (e) {
                print(e);
              }
            },
            child: const Text('Crear session_id'),
          ),
          TextButton(
            onPressed: () async {
              try {
                final response = await locator<NetworkService>().get(
                  '/account',
                  queryParameters: {
                    'session_id': 'a1e394a14afd249ac0aca20cae1e6b0d483dbd54',
                  },
                );
                print(response);
              } catch (e) {
                print(e);
              }
            },
            child: const Text('Obtener datos de la cuenta (y el account_id)'),
          ),
          TextButton(
            onPressed: () async {
              try {
                final response = await locator<NetworkService>().get(
                  '/account/20875012/favorite/movies',
                  queryParameters: {
                    'session_id': 'a1e394a14afd249ac0aca20cae1e6b0d483dbd54',
                  },
                );
                print(response);
              } catch (e) {
                print(e);
              }
            },
            child: const Text('Obtener los favoritos'),
          ),
          AppSpaces.gapH16,
          // gravatar
          Image.network(
            'https://www.gravatar.com/avatar/14a0a59419634b4b588b8fb8b73eddad',
          ),
          AppSpaces.gapH16,
          // avatar tmdbs
          Image.network(
            'https://image.tmdb.org/t/p/original/2c5fJ7HIO9g8Enk8LgGtjwMcXmt.png',
          ),
        ],
      ),
    );
  }
}
