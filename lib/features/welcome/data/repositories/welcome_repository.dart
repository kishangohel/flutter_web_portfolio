import 'package:flutter_web_portfolio/features/welcome/data/models/welcome_page_model.dart';

abstract interface class IWelcomePageRepository {
  Future<WelcomePageModel> getWelcomePageData();
}
