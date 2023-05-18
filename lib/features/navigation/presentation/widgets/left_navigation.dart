import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_portfolio/features/navigation/presentation/providers/navigation_providers.dart';
import 'package:flutter_web_portfolio/features/navigation/presentation/widgets/tile_item_left_navigation.dart';

class LeftNavigationView extends ConsumerWidget {
  const LeftNavigationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navItems = ref.watch(navVMProvider);
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.white.withOpacity(0.25),
            Colors.transparent,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        children: List.generate(
          navItems.length,
          (index) {
            final item = navItems[index];

            return LeftNavigationItemTile(item: item);
          },
        ),
      ),
    );
  }
}
