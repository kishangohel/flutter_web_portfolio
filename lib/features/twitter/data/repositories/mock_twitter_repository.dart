import 'package:flutter/foundation.dart' show immutable;
import 'package:flutter_web_portfolio/features/twitter/data/models/twitter_data_model.dart';
import 'package:flutter_web_portfolio/features/twitter/data/repositories/twitter_repository.dart';
import 'package:flutter_web_portfolio/styles/personal_portfolio_icons.dart';

@immutable
class MockTwitterDataRepository implements ITwitterRepository {
  @override
  Future<TwitterDataModel> getTwitterModelData() {
    return Future.delayed(
      const Duration(seconds: 2),
      () {
        return const TwitterDataModel(
          title: 'Follow me',
          subTitle: 'on Twitter',
          icon: PersonalPortfolioIcons.twitter,
          linkLabel: '@23kishan',
          link: 'https://twitter.com/23kishan',
        );
      },
    );
  }
}
