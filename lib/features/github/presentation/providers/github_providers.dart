import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_portfolio/features/github/data/repositories/github_repository.dart';
import 'package:flutter_web_portfolio/features/github/data/repositories/mock_github_repo.dart';
import 'package:flutter_web_portfolio/features/github/presentation/view_models/github_vm.dart';

final githubRepoProvider = AutoDisposeProvider<IGithubRepository>(
  (ref) => MockGithubRepository(),
);

final githubVmProvider = AutoDisposeProvider(
  (ref) => GithubVM(repository: ref.read(githubRepoProvider)),
);

final githubFutureDataProvider = AutoDisposeFutureProvider(
  (ref) => ref.read(githubVmProvider).getData(),
);
