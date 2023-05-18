import 'package:flutter_web_portfolio/features/twitter/data/models/twitter_data_model.dart';
import 'package:flutter_web_portfolio/features/twitter/data/repositories/twitter_repository.dart';

class TwitterVM {
  final ITwitterRepository repository;

  TwitterVM({required this.repository});

  Future<TwitterDataModel> getTwitterDataModel() => repository.getTwitterModelData();
}
