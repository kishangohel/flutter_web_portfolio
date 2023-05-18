import 'package:flutter_web_portfolio/features/github/presentation/pages/github_page.dart';
import 'package:flutter_web_portfolio/features/linked_in/presentation/pages/linked_in_page.dart';
import 'package:flutter_web_portfolio/features/shell/presentation/pages/portfolio_main_page.dart';
import 'package:flutter_web_portfolio/features/splash/presentation/pages/splash_page.dart';
import 'package:flutter_web_portfolio/features/twitter/presentation/pages/twitter_page.dart';
import 'package:flutter_web_portfolio/features/web/presentation/pages/web_page.dart';
import 'package:flutter_web_portfolio/features/welcome/presentation/pages/welcome_page.dart';
import 'package:flutter_web_portfolio/helpers/utils.dart';
import 'package:flutter_web_portfolio/shared/pages/error_page.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static final router = GoRouter(
    initialLocation: SplashPage.route,
    navigatorKey: Utils.mainNav,
    errorBuilder: (context, state) => ErrorPage(message: state.error?.toString() ?? 'Unknown error'),
    routes: [
      GoRoute(
        parentNavigatorKey: Utils.mainNav,
        path: SplashPage.route,
        builder: (context, state) => SplashPage(key: state.pageKey),
      ),
      ShellRoute(
        navigatorKey: Utils.tabNav,
        builder: (context, state, child) => PortfolioMainPage(key: state.pageKey, child: child),
        routes: [
          GoRoute(
            path: WelcomePage.route,
            parentNavigatorKey: Utils.tabNav,
            pageBuilder: (context, state) => NoTransitionPage(child: WelcomePage(key: state.pageKey)),
          ),
          GoRoute(
            path: TwitterPage.route,
            parentNavigatorKey: Utils.tabNav,
            pageBuilder: (context, state) => NoTransitionPage(child: TwitterPage(key: state.pageKey)),
          ),
          GoRoute(
            path: LinkedInPage.route,
            parentNavigatorKey: Utils.tabNav,
            pageBuilder: (context, state) => NoTransitionPage(child: LinkedInPage(key: state.pageKey)),
          ),
          GoRoute(
            path: GithubPage.route,
            parentNavigatorKey: Utils.tabNav,
            pageBuilder: (context, state) => NoTransitionPage(child: GithubPage(key: state.pageKey)),
          ),
          GoRoute(
            path: WebPage.route,
            parentNavigatorKey: Utils.tabNav,
            pageBuilder: (context, state) => NoTransitionPage(child: WebPage(key: state.pageKey)),
          ),
        ],
      ),
    ],
  );
}
