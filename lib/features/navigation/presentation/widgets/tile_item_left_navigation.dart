import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_portfolio/features/navigation/data/models/item_left_navigation.dart';
import 'package:flutter_web_portfolio/features/navigation/presentation/providers/navigation_providers.dart';

class LeftNavigationItemTile extends ConsumerWidget {
  const LeftNavigationItemTile({required this.item, Key? key}) : super(key: key);

  final LeftNavigationItem item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Color navItemColor = item.isSelected ? Colors.white : Colors.white.withOpacity(0.25);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: IconButton(
        iconSize: 30,
        icon: Icon(
          item.icon,
          color: navItemColor,
        ),
        onPressed: () => ref.read(navVMProvider.notifier).selectNavItem(item),
      ),
    );
  }
}
