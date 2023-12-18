import 'package:bloc/bloc.dart';
import 'package:my_movie_hub/src/core/exceptions/exceptions_helper.dart';
import 'package:my_movie_hub/src/features/{{name.snakeCase()}}/application/{{name.snakeCase()}}_state.dart';
import 'package:my_movie_hub/src/features/{{name.snakeCase()}}/domain/repositories/{{name.snakeCase()}}_repository.dart';

class {{name.pascalCase()}}Cubit extends Cubit<{{name.pascalCase()}}State> with ExceptionsHelper {
  {{name.pascalCase()}}Cubit({required {{name.pascalCase()}}Repository {{name.camelCase()}}Repository})
      : _{{name.camelCase()}}Repository = {{name.camelCase()}}Repository,
        super(const {{name.pascalCase()}}State());

  final {{name.pascalCase()}}Repository _{{name.camelCase()}}Repository;

}
