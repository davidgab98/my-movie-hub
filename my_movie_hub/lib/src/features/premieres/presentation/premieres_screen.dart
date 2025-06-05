import 'package:country_code_picker/country_code_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_movie_hub/src/core-ui/common_widgets/main_app_bar.dart';
import 'package:my_movie_hub/src/core-ui/common_widgets/shimmer_placeholder.dart';
import 'package:my_movie_hub/src/core-ui/modals/standard_modal.dart';
import 'package:my_movie_hub/src/core-ui/placeholders/empty_data_message_placeholder.dart';
import 'package:my_movie_hub/src/core-ui/placeholders/error_data_reload_placeholder.dart';
import 'package:my_movie_hub/src/core-ui/placeholders/error_loading_new_data_message_placeholder.dart';
import 'package:my_movie_hub/src/core/di/service_locator.dart';
import 'package:my_movie_hub/src/core/routing/app_router.dart';
import 'package:my_movie_hub/src/core/utils/datetime_utils.dart';
import 'package:my_movie_hub/src/features/movie/domain/model/movie.dart';
import 'package:my_movie_hub/src/features/movie/presentation/movie_item/widgets/movie_card.dart';
import 'package:my_movie_hub/src/features/movie_list/presentation/widgets/refresco.dart';
import 'package:my_movie_hub/src/features/premieres/application/premieres_cubit.dart';
import 'package:my_movie_hub/src/features/premieres/application/premieres_state.dart';
import 'package:my_movie_hub/src/features/premieres/domain/repositories/premieres_repository.dart';
import 'package:my_movie_hub/src/features/premieres/presentation/countries.dart';
import 'package:ui_kit/ui_kit.dart';

class PremieresScreen extends StatelessWidget {
  const PremieresScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: 'premieres.mainTitle'.tr(),
        leadingIconAction: () => context.pushNamed(AppRoute.profile.name),
      ),
      body: BlocProvider<PremieresCubit>(
        create: (context) => PremieresCubit(
          premieresRepository: locator<PremieresRepository>(),
        )..getPremieres(),
        child: const SafeArea(
          bottom: false,
          child: _Body(),
        ),
      ),
    );
  }
}

class _Body extends StatefulWidget {
  const _Body({super.key});

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  final _scrollController = ScrollController();
  final double _scrollThreshold = 200;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      context.read<PremieresCubit>().getPremieres();
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      physics: const BouncingScrollPhysics(),
      slivers: [
        const _HeadlineTextHeader(),
        const _TimeLineFiltersHeader(),
        Refresco(
          refreshTriggerPullDistance: 120,
          onRefresh: () async =>
              context.read<PremieresCubit>().getPremieres(isRefreshing: true),
        ),
        const _TimeLineBody(),
        SliverToBoxAdapter(
          child: SizedBox(height: MediaQuery.of(context).padding.bottom),
        ),
      ],
    );
  }
}

class _HeadlineTextHeader extends StatelessWidget {
  const _HeadlineTextHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PremieresCubit, PremieresState>(
      builder: (context, state) {
        return SliverAppBar(
          toolbarHeight: 35,
          backgroundColor: context.colors.surface,
          flexibleSpace: Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpaces.s16,
              AppSpaces.s16,
              AppSpaces.s16,
              AppSpaces.s2,
            ),
            child: Text(
              'premieres.headline'.tr(
                namedArgs: {
                  'date':
                      state.initialDate?.toLongStylizedString(context) ?? '',
                  'country': CountryCode.fromCountryCode(state.countryCode)
                          .localize(context)
                          .name ??
                      'ES',
                },
              ),
              style: AppTextStyle.bodyMedium.copyWith(
                color: context.colors.onSurface,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        );
      },
    );
  }
}

class _TimeLineFiltersHeader extends StatelessWidget {
  const _TimeLineFiltersHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      snap: true,
      toolbarHeight: 72,
      backgroundColor: context.colors.surface,
      flexibleSpace: const Padding(
        padding: EdgeInsets.symmetric(
          vertical: AppSpaces.s12,
          horizontal: AppSpaces.s16,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              flex: 5,
              child: _InitialDateInput(),
            ),
            AppSpaces.gapW8,
            Expanded(
              flex: 5,
              child: _CountryInput(),
            ),
          ],
        ),
      ),
    );
  }
}

class _InitialDateInput extends StatelessWidget {
  const _InitialDateInput({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PremieresCubit, PremieresState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () => _showDatePickerDialog(
            context,
            cubit: context.read<PremieresCubit>(),
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: AppSpaces.s16),
            decoration: BoxDecoration(
              color: context.colors.surface,
              borderRadius: BorderRadius.circular(AppBorderRadius.br10),
              border: Border.all(
                color: context.colors.outline.withValues(alpha: 0.25),
              ),
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                state.initialDate?.toStylizedString() ?? '',
                style: AppTextStyle.titleMedium.copyWith(
                  color: context.colors.onSurface,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _showDatePickerDialog(
    BuildContext context, {
    required PremieresCubit cubit,
  }) {
    DateTime? selectedDate;

    return showStandardModal(
      context: context,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 216,
            child: CupertinoDatePicker(
              initialDateTime: cubit.state.initialDate,
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (DateTime date) {
                selectedDate = date;
              },
            ),
          ),
          AppSpaces.gapH8,
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppBorderRadius.br10),
              ),
              backgroundColor: context.colors.primary,
            ),
            onPressed: () {
              if (selectedDate != null) {
                cubit.updateInitialDateAndRefreshData(
                  initialDate: selectedDate!,
                );
              }
              context.pop();
            },
            child: Text(
              'premieres.showPremieresButton'.tr(),
              style: AppTextStyle.titleMedium.copyWith(
                color: context.colors.onPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CountryInput extends StatelessWidget {
  const _CountryInput({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: BorderRadius.circular(AppBorderRadius.br10),
        border: Border.all(
          color: context.colors.outline.withValues(alpha: 0.25),
        ),
      ),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          CountryCodePicker(
            onChanged: (country) => context
                .read<PremieresCubit>()
                .updateCountryAndRefreshData(countryCode: country.code),
            padding: EdgeInsets.zero,
            showCountryOnly: true,
            showFlagDialog: true,
            showOnlyCountryWhenClosed: true,
            backgroundColor: context.colors.surface,
            dialogBackgroundColor: context.colors.surface,
            barrierColor: AppColors.black.withValues(alpha: 0.5),
            dialogSize: Size(screenWidth, screenHeight * 0.5),
            dialogTextStyle: AppTextStyle.titleMedium,
            initialSelection: 'ES',
            searchStyle: AppTextStyle.titleMedium,
            textStyle: AppTextStyle.titleMedium.copyWith(
              color: context.colors.onSurface,
            ),
            alignLeft: true,
            boxDecoration: BoxDecoration(
              color: context.colors.surface,
              borderRadius: BorderRadius.circular(AppBorderRadius.br32),
              border: Border.all(
                color: context.colors.outline.withValues(alpha: 0.25),
              ),
            ),
            countryFilter: countries,
            flagDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppBorderRadius.br2),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: AppSpaces.s2),
            child: Align(
              alignment: Alignment.centerRight,
              child: Icon(
                Icons.arrow_drop_down_rounded,
                color: context.colors.outline,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TimeLineBody extends StatelessWidget {
  const _TimeLineBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PremieresCubit, PremieresState>(
      builder: (context, state) {
        if (state.status.isInitial ||
            (state.status.isLoading && state.movies.isEmpty)) {
          return const _TimeLineShimmer();
        } else if (state.status.isError && state.movies.isEmpty) {
          return SliverToBoxAdapter(
            child: ErrorDataReloadPlaceholder(
              onReload: context.read<PremieresCubit>().getPremieres,
            ),
          );
        } else if (state.movies.isNotEmpty) {
          return _TimeLine(state: state);
        } else {
          return const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(top: AppSpaces.s16),
              child: EmptyDataMessagePlaceholder(
                message: 'No hay estrenos para esta fecha en este país',
              ),
            ),
          );
        }
      },
    );
  }
}

class _TimeLine extends StatelessWidget {
  const _TimeLine({
    required this.state,
    super.key,
  });

  final PremieresState state;

  @override
  Widget build(BuildContext context) {
    final moviesByDate = _groupMoviesByReleaseDate(state.movies);

    return SliverList.separated(
      separatorBuilder: (context, index) => AppSpaces.gapH6,
      itemCount: state.hasReachedMax
          ? moviesByDate.keys.length
          : moviesByDate.keys.length + 1,
      itemBuilder: (context, index) {
        if (index >= moviesByDate.length) {
          if (state.status.isError) {
            return const ErrorLoadingNewDataMessagePlaceholder();
          } else {
            return const _TimeLineItemShimmer();
          }
        } else {
          final date = moviesByDate.keys.elementAt(index);
          final dateMovies = moviesByDate[date]!;
          return _TimeLineItem(date: date, movies: dateMovies);
        }
      },
    );
  }

  Map<String, List<Movie>> _groupMoviesByReleaseDate(List<Movie> movies) {
    final Map<String, List<Movie>> map = {};
    for (final movie in movies) {
      if (!map.containsKey(movie.releaseDate)) {
        map[movie.releaseDate] = [];
      }
      map[movie.releaseDate]!.add(movie);
    }
    return map;
  }
}

class _TimeLineShimmer extends StatelessWidget {
  const _TimeLineShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      separatorBuilder: (context, index) => AppSpaces.gapH6,
      itemCount: 4,
      itemBuilder: (context, index) {
        return const _TimeLineItemShimmer();
      },
    );
  }
}

class _TimeLineItem extends StatelessWidget {
  const _TimeLineItem({
    required this.date,
    required this.movies,
  });

  final String date;
  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    final parsedDate = DateTime.parse(date);
    final year = DateFormat('yyyy').format(parsedDate);
    final month =
        DateFormat('MMM', context.locale.languageCode).format(parsedDate);
    final day = DateFormat('dd').format(parsedDate);

    return IntrinsicHeight(
      // Permite que el widget hijo defina la altura
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 2,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 5,
                  decoration: BoxDecoration(
                    color: context.colors.primary,
                    borderRadius: BorderRadius.circular(AppBorderRadius.brMax),
                  ),
                ),
                Container(
                  width: screenWidth * 0.15,
                  height: screenHeight * 0.1,
                  padding: const EdgeInsets.symmetric(
                    vertical: AppSpaces.s4,
                  ),
                  decoration: BoxDecoration(
                    color: context.colors.primary,
                    borderRadius: BorderRadius.circular(AppBorderRadius.br16),
                    border: Border.all(
                      width: 0.5,
                      color: context.colors.onSurface.withValues(alpha: 0.25),
                    ),
                  ),
                  child: FittedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          day,
                          style: AppTextStyle.headlineXXL
                              .copyWith(color: context.colors.onPrimary),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          '$month\n$year',
                          style: AppTextStyle.bodyMedium
                              .copyWith(color: context.colors.onPrimary),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 8,
            child: SizedBox(
              height: screenHeight * 0.26,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: AppSpaces.s12,
                    horizontal: AppSpaces.s4,
                  ),
                  child: AspectRatio(
                    aspectRatio: 1 / 1.5,
                    child: MovieCard(movie: movies[index]),
                  ),
                ),
                itemCount: movies.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TimeLineItemShimmer extends StatelessWidget {
  const _TimeLineItemShimmer();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return IntrinsicHeight(
      // Permite que el widget hijo defina la altura
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 2,
            child: Stack(
              alignment: Alignment.center,
              children: [
                ShimmerPlaceholder(
                  width: screenWidth * 0.15,
                  height: screenHeight * 0.1,
                  shapeBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppBorderRadius.br16),
                  ),
                ),
                ShimmerPlaceholder(
                  width: 5,
                  shapeBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppBorderRadius.brMax),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 8,
            child: SizedBox(
              height: screenHeight * 0.26,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: AppSpaces.s12,
                    horizontal: AppSpaces.s4,
                  ),
                  child: buildShimmerSingleCard(context),
                ),
                itemCount: 3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildShimmerSingleCard(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;

  return AspectRatio(
    aspectRatio: 1 / 1.5,
    child: ShimmerPlaceholder(
      width: screenWidth,
      shapeBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppBorderRadius.br16),
      ),
    ),
  );
}
