import 'package:flutter_web_portfolio/features/github/data/models/github_data_model.dart';
import 'package:flutter_web_portfolio/features/github/data/repositories/github_repository.dart';
import 'package:flutter_web_portfolio/styles/personal_portfolio_icons.dart';

class MockGithubRepository implements IGithubRepository {
  @override
  Future<GithubDataModel> getData() {
    return Future.delayed(
      const Duration(seconds: 2),
      () {
        return const GithubDataModel(
          title: 'Check out\nMy Repos',
          icon: PersonalPortfolioIcons.github,
          linkLabel: 'on GitHub',
          link: 'https://github.com/kishangohel?tab=repositories',
        );
      },
    );
  }
}
