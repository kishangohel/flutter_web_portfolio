import 'package:flutter_web_portfolio/features/linked_in/data/models/linked_in_model.dart';

abstract interface class ILinkedInRepository {
  Future<LinkedInDataModel> getLinkedInData();
}
