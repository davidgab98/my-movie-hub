import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_movie_hub/src/core/enums/state_status.dart';

part '{{name.snakeCase()}}_state.freezed.dart';

@freezed
class {{name.pascalCase()}}State with _${{name.pascalCase()}}State {
  const factory {{name.pascalCase()}}State({
    @Default(StateStatus.initial) StateStatus status,
    @Default('') String errorMessage,
  }) = _{{name.pascalCase()}}State;
}
