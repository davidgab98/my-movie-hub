import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_movie_hub/src/core/di/service_locator.dart';
import 'package:my_movie_hub/src/core/routing/app_router.dart';
import 'package:my_movie_hub/src/features/search/application/search_cubit.dart';
import 'package:my_movie_hub/src/features/search/domain/repositories/search_repository.dart';
import 'package:my_movie_hub/src/features/search/presentation/widgets/complex_movie_search_list.dart';
import 'package:ui_kit/ui_kit.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: 'search.mainTitle'.tr(),
        leadingIconAction: () => context.pushNamed(AppRoute.profile.name),
      ),
      body: BlocProvider<SearchCubit>(
        create: (context) => SearchCubit(
          searchRepository: locator<SearchRepository>(),
        ),
        child: const SafeArea(
          bottom: false,
          child: ComplexMovieSearchList(),
        ),
      ),
    );
  }
}
