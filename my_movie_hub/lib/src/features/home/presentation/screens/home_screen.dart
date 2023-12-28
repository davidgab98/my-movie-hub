import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_movie_hub/src/core/di/service_locator.dart';
import 'package:my_movie_hub/src/core/network/network_service.dart';
import 'package:my_movie_hub/src/core/routing/app_router.dart';

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
          TextButton(
            onPressed: () async {
              final response =
                  await locator<NetworkService>().get('/authentication');
              print(response);
            },
            child: const Text('Authentication'),
          ),
          TextButton(
            onPressed: () async {
              final response =
                  await locator<NetworkService>().get('/account/20843239');
              print(response);
            },
            child: const Text('Account Details'),
          ),
        ],
      ),
    );
  }
}
