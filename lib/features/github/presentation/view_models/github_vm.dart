import 'package:flutter_web_portfolio/features/github/data/models/github_data_model.dart';
import 'package:flutter_web_portfolio/features/github/data/repositories/github_repository.dart';

class GithubVM {
  GithubVM({required this.repository});

  final IGithubRepository repository;

  Future<GithubDataModel> getData() => repository.getData();
}
