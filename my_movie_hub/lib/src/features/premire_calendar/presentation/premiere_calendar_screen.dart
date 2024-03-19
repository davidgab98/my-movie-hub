import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_movie_hub/src/core/di/service_locator.dart';
import 'package:my_movie_hub/src/core/routing/app_router.dart';
import 'package:my_movie_hub/src/features/premire_calendar/application/premiere_calendar_cubit.dart';
import 'package:my_movie_hub/src/features/premire_calendar/domain/repositories/premieres_repository.dart';
import 'package:ui_kit/ui_kit.dart';

class PremiereCalendarScreen extends StatelessWidget {
  const PremiereCalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: 'Premiere Calendar',
        leadingIconAction: () => context.pushNamed(AppRoute.profile.name),
      ),
      body: BlocProvider<PremiereCalendarCubit>(
        create: (context) => PremiereCalendarCubit(
          premieresRepository: locator<PremieresRepository>(),
        )..getPremieres(),
        child: SafeArea(
          bottom: false,
          child: Container(),
        ),
      ),
    );
  }
}
