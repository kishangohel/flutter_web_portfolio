import 'package:flutter_web_portfolio/features/linked_in/data/models/linked_in_model.dart';
import 'package:flutter_web_portfolio/features/linked_in/data/repositories/linked_in_repository.dart';

class LinkedInVM {
  LinkedInVM({required this.repository});

  final ILinkedInRepository repository;

  Future<LinkedInDataModel> getLinkedInData() => repository.getLinkedInData();
}
