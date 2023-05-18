import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_portfolio/features/linked_in/data/repositories/linked_in_repository.dart';
import 'package:flutter_web_portfolio/features/linked_in/data/repositories/mock_linked_in_repo.dart';
import 'package:flutter_web_portfolio/features/linked_in/presentation/view_models/linked_in_vm.dart';

final linkedInRepoProvider = AutoDisposeProvider<ILinkedInRepository>(
  (ref) => MockLinkedInRepository(),
);

final linkedInVmProvider = AutoDisposeProvider(
  (ref) => LinkedInVM(repository: ref.read(linkedInRepoProvider)),
);

final linkedInFutureDataProvider = AutoDisposeFutureProvider(
  (ref) => ref.read(linkedInVmProvider).getLinkedInData(),
);
