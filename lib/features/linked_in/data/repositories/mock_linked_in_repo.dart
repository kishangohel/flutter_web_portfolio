import 'package:flutter_web_portfolio/features/linked_in/data/models/linked_in_model.dart';
import 'package:flutter_web_portfolio/features/linked_in/data/repositories/linked_in_repository.dart';
import 'package:flutter_web_portfolio/styles/personal_portfolio_icons.dart';

class MockLinkedInRepository implements ILinkedInRepository {
  @override
  Future<LinkedInDataModel> getLinkedInData() {
    return Future.delayed(
      const Duration(seconds: 2),
      () {
        return const LinkedInDataModel(
          title: 'Let\'s\nConnect',
          icon: PersonalPortfolioIcons.linkedin,
          linkLabel: 'on LinkedIn',
          link: 'https://www.linkedin.com/in/kishan-gohel-51052138',
        );
      },
    );
  }
}
