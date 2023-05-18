import 'package:flutter_web_portfolio/features/navigation/data/models/item_left_navigation.dart';

abstract interface class INavigationRepository {
  List<LeftNavigationItem> getDefaultNavItems();
}
