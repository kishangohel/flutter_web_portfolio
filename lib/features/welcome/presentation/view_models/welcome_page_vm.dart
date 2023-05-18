import 'package:flutter/foundation.dart' show immutable;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_portfolio/features/welcome/data/models/welcome_page_model.dart';
import 'package:flutter_web_portfolio/features/welcome/data/repositories/welcome_repository.dart';
import 'package:flutter_web_portfolio/features/welcome/presentation/providers/welcome_page_providers.dart';

@immutable
final class WelcomePageVm {
  final Ref ref;
  final IWelcomePageRepository repository;

  const WelcomePageVm({required this.ref, required this.repository});

  Future<WelcomePageModel> getWelcomePageData() async {
    final pageData = await repository.getWelcomePageData();
    ref.read(greetingsLabelsProvider.notifier).state = pageData.greetings;
    return pageData;
  }
}
