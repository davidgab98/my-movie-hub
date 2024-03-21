import 'package:country_code_picker/country_code_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
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

class _Body extends StatelessWidget {
  const _Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PremieresCubit, PremieresState>(
      builder: (context, state) {
        return TimeLine(
          movies: state.movies,
        );
      },
    );
  }
}

class TimeLine extends StatefulWidget {
  final List<Movie> movies;
  const TimeLine({required this.movies, super.key});

  @override
  State<TimeLine> createState() => _TimeLineState();
}

class _TimeLineState extends State<TimeLine> {
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
    // Agrupar películas por fecha de estreno
    final moviesByDate = _groupMoviesByDate(widget.movies);

    return CustomScrollView(
      controller: _scrollController,
      physics: const AlwaysScrollableScrollPhysics(),
      slivers: [
        BlocBuilder<PremieresCubit, PremieresState>(
          builder: (context, state) {
            return SliverAppBar(
              toolbarHeight: 35,
              backgroundColor: context.colors.background,
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
                          state.initialDate?.toLongStylizedString(context) ??
                              '',
                      'country': CountryCode.fromCountryCode(state.countryCode)
                              .localize(context)
                              .name ??
                          'ES',
                    },
                  ),
                  style: AppTextStyle.bodyMedium.copyWith(
                    color: context.colors.onBackground,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            );
          },
        ),
        const _TimeLineFiltersHeader(),
        Refresco(
          refreshTriggerPullDistance: 120,
          onRefresh: () async =>
              context.read<PremieresCubit>().getPremieres(isRefreshing: true),
        ),
        SliverList.separated(
          separatorBuilder: (context, index) => AppSpaces.gapH6,
          itemCount: moviesByDate.keys.length,
          itemBuilder: (context, index) {
            final date = moviesByDate.keys.elementAt(index);
            final dateMovies = moviesByDate[date]!;
            return _TimeLineItem(date: date, movies: dateMovies);
          },
        ),
        SliverToBoxAdapter(
          child: SizedBox(height: MediaQuery.of(context).padding.bottom),
        ),
      ],
    );
  }

  // Agrupar las películas por su fecha de lanzamiento
  Map<String, List<Movie>> _groupMoviesByDate(List<Movie> movies) {
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

class _TimeLineFiltersHeader extends StatelessWidget {
  const _TimeLineFiltersHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      snap: true,
      toolbarHeight: 72,
      backgroundColor: context.colors.background,
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
          onTap: () => showDatePickerDialog(
            context,
            cubit: context.read<PremieresCubit>(),
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: AppSpaces.s16),
            decoration: BoxDecoration(
              color: context.colors.surface,
              borderRadius: BorderRadius.circular(AppBorderRadius.br10),
              border: Border.all(
                color: context.colors.outline.withOpacity(0.25),
              ),
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                state.initialDate?.toStylizedString() ?? '',
                style: AppTextStyle.titleMedium.copyWith(
                  color: context.colors.onBackground,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        );
      },
    );
  }

  void showDatePickerDialog(
    BuildContext context, {
    required PremieresCubit cubit,
  }) {
    DateTime? selectedDate;

    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        final screenHeight = MediaQuery.of(context).size.height;

        return Dialog(
          backgroundColor: context.colors.background,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppBorderRadius.br20),
            side: BorderSide(
              color: context.colors.outline.withOpacity(0.25),
            ),
          ),
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topRight,
            children: [
              Container(
                height: screenHeight * 0.5,
                padding: const EdgeInsets.symmetric(horizontal: AppSpaces.s20),
                child: CupertinoDatePicker(
                  initialDateTime: cubit.state.initialDate,
                  mode: CupertinoDatePickerMode.date,
                  onDateTimeChanged: (DateTime date) {
                    selectedDate = date;
                  },
                ),
              ),
              IconButton(
                icon: Icon(Icons.close, color: context.colors.onBackground),
                onPressed: context.pop,
              ),
            ],
          ),
        );
      },
    ).then((_) {
      if (selectedDate != null) {
        // update date when modal is closed
        cubit.updateInitialDateAndRefreshData(initialDate: selectedDate!);
      }
    });
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
          color: context.colors.outline.withOpacity(0.25),
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
            backgroundColor: context.colors.background,
            dialogBackgroundColor: context.colors.background,
            barrierColor: AppColors.black.withOpacity(0.5),
            dialogSize: Size(screenWidth, screenHeight * 0.5),
            dialogTextStyle: AppTextStyle.titleMedium,
            initialSelection: 'ES',
            searchStyle: AppTextStyle.titleMedium,
            textStyle: AppTextStyle.titleMedium.copyWith(
              color: context.colors.onBackground,
            ),
            alignLeft: true,
            boxDecoration: BoxDecoration(
              color: context.colors.background,
              borderRadius: BorderRadius.circular(AppBorderRadius.br32),
              border: Border.all(
                color: context.colors.outline.withOpacity(0.25),
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

class _TimeLineItem extends StatelessWidget {
  const _TimeLineItem({
    required this.date,
    required this.movies,
    super.key,
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
                  //margin: const EdgeInsets.symmetric(vertical: AppSpaces.s2),
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
                      color: context.colors.onBackground.withOpacity(0.25),
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
