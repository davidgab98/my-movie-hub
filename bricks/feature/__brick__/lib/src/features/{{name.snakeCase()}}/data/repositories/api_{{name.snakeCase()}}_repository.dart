import 'package:my_movie_hub/src/core/network/network_service.dart';
import 'package:my_movie_hub/src/features/{{name.snakeCase()}}/domain/repositories/{{name.snakeCase()}}_repository.dart';

class Api{{name.pascalCase()}}Repository extends {{name.pascalCase()}}Repository {
  Api{{name.pascalCase()}}Repository({required this.networkService});
  final NetworkService networkService;
}