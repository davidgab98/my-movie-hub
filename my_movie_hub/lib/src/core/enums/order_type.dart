import 'package:easy_localization/easy_localization.dart';

enum OrderType {
  asc,
  desc;

  @override
  String toString() {
    switch (this) {
      case asc:
        return 'orderType.ascendent'.tr();
      case desc:
        return 'orderType.descendent'.tr();
    }
  }

  String toApi() {
    switch (this) {
      case asc:
        return 'created_at.asc';
      case desc:
        return 'created_at.desc';
    }
  }
}
