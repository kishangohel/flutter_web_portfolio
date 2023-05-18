import 'package:flutter_web_portfolio/features/github/data/models/github_data_model.dart';

abstract interface class IGithubRepository {
  Future<GithubDataModel> getData();
}
