import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_portfolio/features/welcome/presentation/pages/welcome_page.dart';
import 'package:flutter_web_portfolio/styles/colors.dart';

final colorPageProvider = StateProvider(
  (ref) => PersonalPortfolioColors.pageColor[WelcomePage.route],
);
