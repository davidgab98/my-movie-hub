// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part '{{name.snakeCase()}}.freezed.dart';
part '{{name.snakeCase()}}.g.dart';

@freezed
class {{name.pascalCase()}} with _${{name.pascalCase()}} {
  const factory {{name.pascalCase()}}({
    @Default('') @JsonKey(name: 'variable') String variable,
  }) = _{{name.pascalCase()}};

  factory {{name.pascalCase()}}.fromJson(Map<String, Object?> json) =>
      _${{name.pascalCase()}}FromJson(json);
}
