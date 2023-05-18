import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_portfolio/features/welcome/data/repositories/mock_welcome_repository.dart';
import 'package:flutter_web_portfolio/features/welcome/presentation/view_models/greetings_label_vm.dart';
import 'package:flutter_web_portfolio/features/welcome/presentation/view_models/welcome_page_vm.dart';

final welComePageRepoProvider = AutoDisposeProvider(
  (ref) => MockWelcomePageRepository(),
);

final welcomePageVmProvider = AutoDisposeProvider(
  (ref) => WelcomePageVm(
    ref: ref,
    repository: ref.read(welComePageRepoProvider),
  ),
);

final welComePageDataProvider = AutoDisposeFutureProvider(
  (ref) => ref.read(welcomePageVmProvider).getWelcomePageData(),
);

final greetingsLabelsProvider = StateProvider<List<String>>(
  (ref) => [],
);

final greetingsLabelVmProvider = AutoDisposeStateNotifierProvider<GreetingLabelVM, String>(
  (ref) {
    final labels = ref.watch(greetingsLabelsProvider);
    return GreetingLabelVM(labels.firstOrNull ?? '', greetings: labels);
  },
);

/// update greeting labels using stream
final streamGreetingsProvider = AutoDisposeStreamProviderFamily<String, List<String>>(
  (ref, arg) {
    var counter = 0;
    return Stream.periodic(
      const Duration(seconds: 1),
      (computationCount) {
        // Logger().d('$computationCount   $counter');
        if (counter == arg.length) counter = 0;
        final label = arg.elementAt(counter++);
        // Logger().d(label);
        return label;
      },
    );
  },
);
