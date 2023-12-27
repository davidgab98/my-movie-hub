import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_movie_hub/src/core/routing/app_router.dart';

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(
          16,
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Vaya, parece que has encontrado una página oculta, no deberías estar aquí, vuelve a casa',
                textAlign: TextAlign.center,
              ),
              ElevatedButton(
                onPressed: () => context.goNamed(AppRoute.home.name),
                child: const Text('Go Home'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
