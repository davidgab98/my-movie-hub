import 'package:flutter/material.dart';
import 'package:my_movie_hub/src/features/movie/presentation/movie_detail/widgets/account_states_icons/movie_favorite_icon.dart';
import 'package:my_movie_hub/src/features/movie/presentation/movie_detail/widgets/account_states_icons/movie_rate_icon.dart';
import 'package:my_movie_hub/src/features/movie/presentation/movie_detail/widgets/account_states_icons/movie_watchlist_icon.dart';

class MovieAccountStatesRow extends StatelessWidget {
  const MovieAccountStatesRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        MovieFavoriteIcon(),
        MovieWatchlistIcon(),
        MovieRatingIcon(),
      ],
    );
  }
}
