import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:my_movie_hub/src/features/movie_list/presentation/simple_movie_list.dart';
import 'package:ui_kit/ui_kit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('appTitle'.tr()),
        leading: IconButton(
          padding: const EdgeInsets.only(left: AppSpaces.s12),
          icon: const Icon(
            Icons.person,
            size: 28,
          ),
          onPressed: () {},
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppSpaces.gapH16,
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                child: Text(
                  'Seleccionadas para ti',
                  style: AppTextStyle.headlineLargeExtra,
                ),
              ),
              AppSpaces.gapH12,
              const SizedBox(
                height: 290,
                child: SimpleMovieList(),
              ),
              AppSpaces.gapH12,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 0, 12),
                    child: Text(
                      'Popular',
                      style: AppTextStyle.headlineLargeExtra,
                    ),
                  ),
                  const SizedBox(
                    height: 190,
                    child: SimpleMovieList(),
                  ),
                ],
              ),
              AppSpaces.gapH12,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 0, 12),
                    child: Text(
                      'Top Rated',
                      style: AppTextStyle.headlineLargeExtra,
                    ),
                  ),
                  const SizedBox(
                    height: 190,
                    child: SimpleMovieList(),
                  ),
                ],
              ),
              AppSpaces.gapH12,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 0, 12),
                    child: Text(
                      'Trending',
                      style: AppTextStyle.headlineLargeExtra,
                    ),
                  ),
                  const SizedBox(
                    height: 190,
                    child: SimpleMovieList(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
