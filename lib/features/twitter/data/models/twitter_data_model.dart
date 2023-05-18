import 'package:flutter/material.dart' show IconData, immutable;

@immutable
final class TwitterDataModel {
  final String title;
  final String subTitle;
  final IconData icon;
  final String linkLabel;
  final String link;

  const TwitterDataModel({
    required this.title,
    required this.subTitle,
    required this.icon,
    required this.linkLabel,
    required this.link,
  });
}
