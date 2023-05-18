import 'package:flutter_web_portfolio/features/github/presentation/pages/github_page.dart';
import 'package:flutter_web_portfolio/features/linked_in/presentation/pages/linked_in_page.dart';
import 'package:flutter_web_portfolio/features/navigation/data/models/item_left_navigation.dart';
import 'package:flutter_web_portfolio/features/navigation/data/repositories/navigation_repository.dart';
import 'package:flutter_web_portfolio/features/twitter/presentation/pages/twitter_page.dart';
import 'package:flutter_web_portfolio/features/web/presentation/pages/web_page.dart';
import 'package:flutter_web_portfolio/features/welcome/presentation/pages/welcome_page.dart';
import 'package:flutter_web_portfolio/styles/personal_portfolio_icons.dart';

class MockNavigationRepository implements INavigationRepository {
  @override
  List<LeftNavigationItem> getDefaultNavItems() {
    return [
      const LeftNavigationItem(
        icon: PersonalPortfolioIcons.user,
        label: 'My Profile',
        route: WelcomePage.route,
        isSelected: true,
      ),
      const LeftNavigationItem(
        icon: PersonalPortfolioIcons.twitter,
        label: 'Twitter',
        route: TwitterPage.route,
        isSelected: false,
      ),
      const LeftNavigationItem(
        icon: PersonalPortfolioIcons.linkedin,
        label: 'LinkedIn',
        route: LinkedInPage.route,
        isSelected: false,
      ),
      const LeftNavigationItem(
        icon: PersonalPortfolioIcons.github,
        label: 'Github',
        route: GithubPage.route,
        isSelected: false,
      ),
      const LeftNavigationItem(
        icon: PersonalPortfolioIcons.web,
        label: 'Web',
        route: WebPage.route,
        isSelected: false,
      ),
    ];
  }
}
