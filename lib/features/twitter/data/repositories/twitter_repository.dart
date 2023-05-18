import 'package:flutter_web_portfolio/features/twitter/data/models/twitter_data_model.dart';

abstract interface class ITwitterRepository {
  Future<TwitterDataModel> getTwitterModelData();
}
