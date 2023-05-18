import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_portfolio/features/twitter/data/repositories/mock_twitter_repository.dart';
import 'package:flutter_web_portfolio/features/twitter/data/repositories/twitter_repository.dart';
import 'package:flutter_web_portfolio/features/twitter/presentation/view_models/twitter_view_model.dart';

final twitterRepoProvider = AutoDisposeProvider<ITwitterRepository>(
  (ref) => MockTwitterDataRepository(),
);

final twitterVMProvider = AutoDisposeProvider(
  (ref) => TwitterVM(repository: ref.read(twitterRepoProvider)),
);

final twitterDataFutureProvider = AutoDisposeFutureProvider(
  (ref) => ref.read(twitterVMProvider).getTwitterDataModel(),
);
