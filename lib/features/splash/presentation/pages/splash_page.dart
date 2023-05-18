import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio/features/splash/presentation/widgets/splash_loading.dart';
import 'package:flutter_web_portfolio/features/welcome/presentation/pages/welcome_page.dart';
import 'package:flutter_web_portfolio/styles/colors.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatefulWidget {
  static const String route = '/splash';

  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with WidgetsBindingObserver {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 2),
      () => context.go(WelcomePage.route),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: PersonalPortfolioColors.mainBlue,
      body: SplashLoading(message: 'Loading an awesome,\nKick-ass Profile...'),
    );
  }
}
