import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_portfolio/features/navigation/data/models/item_left_navigation.dart';
import 'package:flutter_web_portfolio/helpers/utils.dart';
import 'package:flutter_web_portfolio/shared/providers/shared_providers.dart';
import 'package:flutter_web_portfolio/styles/colors.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';

class LeftNavigationViewModel extends StateNotifier<List<LeftNavigationItem>> {
  final Ref ref;

  LeftNavigationViewModel(List<LeftNavigationItem> items, this.ref) : super(items) {
    for (var element in items) {
      Logger().i(element);
    }
    selectNavItem(items.first);
  }

  void selectNavItem(LeftNavigationItem item) {
    if (item.route.isNotEmpty) {
      GoRouter.of(Utils.tabNav.currentContext!).go(item.route);
    }

    ref.read(colorPageProvider.notifier).state = PersonalPortfolioColors.pageColor[item.route];
    state = [for (final element in state) element.copyWith(isSelected: element == item)];
  }
}
