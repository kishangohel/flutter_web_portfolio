import 'package:flutter/material.dart';

@immutable
final class GithubDataModel {
  final String title;
  final IconData icon;
  final String linkLabel;
  final String link;

  const GithubDataModel({
    required this.title,
    required this.icon,
    required this.linkLabel,
    required this.link,
  });
}
