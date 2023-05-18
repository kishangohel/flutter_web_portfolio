import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio/features/navigation/presentation/widgets/left_navigation.dart';
import 'package:flutter_web_portfolio/helpers/utils.dart';
import 'package:flutter_web_portfolio/shared/widgets/page_color.dart';

class PortfolioMainPage extends StatelessWidget {
  static const String route = '/main';

  const PortfolioMainPage({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Utils.mainScaffold,
      body: Stack(
        fit: StackFit.expand,
        children: [
          const ColorPage(),
          Center(child: child),
          const Align(
            alignment: Alignment.centerLeft,
            child: LeftNavigationView(),
          ),
        ],
      ),
    );
  }
}
