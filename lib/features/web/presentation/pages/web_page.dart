import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio/styles/colors.dart';
import 'package:flutter_web_portfolio/styles/personal_portfolio_icons.dart';

class WebPage extends StatelessWidget {
  const WebPage({Key? key}) : super(key: key);

  static const String route = "/webPage";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(PersonalPortfolioIcons.web, size: 100, color: PersonalPortfolioColors.webIcon),
          const SizedBox(height: 16),
          Text(
            'Website\nUnder Construction!',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }
}
