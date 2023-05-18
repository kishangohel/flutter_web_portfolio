final class WelcomePageModel {
  WelcomePageModel({
    required this.name,
    required this.title,
    required this.subTitle,
    required this.imagePath,
    required this.greetings,
  });

  final String name;
  final String title;
  final String subTitle;
  final String imagePath;
  final List<String> greetings;
}
