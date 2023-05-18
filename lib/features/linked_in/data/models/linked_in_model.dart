import 'package:flutter/material.dart' show IconData, immutable;

@immutable
final class LinkedInDataModel {
  final String title;
  final IconData icon;
  final String linkLabel;
  final String link;

  const LinkedInDataModel({
    required this.title,
    required this.icon,
    required this.linkLabel,
    required this.link,
  });
}
