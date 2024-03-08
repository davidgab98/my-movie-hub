import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie_hub/src/features/movie/application/movie_account_states/movie_account_states_cubit.dart';
import 'package:my_movie_hub/src/features/movie/application/movie_account_states/movie_account_states_state.dart';
import 'package:ui_kit/ui_kit.dart';

class MovieFavoriteIcon extends StatelessWidget {
  const MovieFavoriteIcon({
    this.size,
    super.key,
  });

  final double? size;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<MovieAccountStatesCubit, MovieAccountStatesState, bool>(
      selector: (state) => state.isFavorite,
      builder: (context, isFavorite) {
        //return Container();
        // return const RedMetallicIcon(
        //   icon: Icons.favorite,
        //   size: 32,
        // );
        return IconButton(
          iconSize: size,
          icon: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_outline,
            color: AppColors.red,
            size: 28,
          ),
          onPressed: () =>
              context.read<MovieAccountStatesCubit>().toggleFavoritesStatus(),
        );
      },
    );
  }
}

class RedMetallicIcon extends StatelessWidget {
  final IconData icon;
  final double size;

  const RedMetallicIcon({
    Key? key,
    required this.icon,
    this.size = 24.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>[
            Colors.white.withOpacity(0.5), // Reflejos brillantes pero sutiles
            Colors.red[700]!, // Rojo oscuro para el cuerpo metálico
            Colors.red, // Rojo base para mantener el color distintivo
            Colors.red[800]!, // Rojo aún más oscuro para sombras
            Colors.red[500]!, // Rojo medio para transición suave
            Colors.white.withOpacity(0.5), // Reflejos finales brillantes
          ],
          stops: [
            0.0,
            0.2,
            0.4,
            0.6,
            0.8,
            1.0
          ], // Puntos de transición entre colores
        ).createShader(bounds);
      },
      blendMode: BlendMode.srcIn, // Aplica el gradiente al icono existente
      child: Icon(
        icon,
        size: size,
        color: Colors.white, // El color base para la máscara debe ser blanco
      ),
    );
  }
}
