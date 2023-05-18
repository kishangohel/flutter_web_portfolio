import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_portfolio/features/navigation/data/models/item_left_navigation.dart';
import 'package:flutter_web_portfolio/features/navigation/data/repositories/mock_navigation_repository.dart';
import 'package:flutter_web_portfolio/features/navigation/data/repositories/navigation_repository.dart';
import 'package:flutter_web_portfolio/features/navigation/presentation/viewmodels/left_navigation_viewmodel.dart';

final navigationRepositoryProvider = Provider<INavigationRepository>((ref) => MockNavigationRepository());

final navigationItemsProvider = Provider<List<LeftNavigationItem>>((ref) {
  return ref.read(navigationRepositoryProvider).getDefaultNavItems();
});

final navVMProvider = StateNotifierProvider<LeftNavigationViewModel, List<LeftNavigationItem>>(
  (ref) => LeftNavigationViewModel(
    ref.read(navigationItemsProvider),
    ref,
  ),
);
