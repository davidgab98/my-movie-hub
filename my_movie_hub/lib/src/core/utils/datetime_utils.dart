import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';

extension DateTimeExtension on DateTime {
  String toApiFormat() {
    return DateFormat('yyyy-MM-dd').format(this);
  }

  String toStylizedString() {
    return DateFormat('dd MMM yyyy').format(this);
  }

  String toLongStylizedString(BuildContext context) {
    final String locale = context.locale.toString();
    final DateFormat formatter = DateFormat('d MMMM y', locale);
    return formatter.format(this);
  }
}
