import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_portfolio/features/github/presentation/providers/github_providers.dart';
import 'package:flutter_web_portfolio/shared/widgets/error_widget.dart';
import 'package:flutter_web_portfolio/styles/colors.dart';
import 'package:url_launcher/url_launcher_string.dart';

class GithubPage extends ConsumerWidget {
  const GithubPage({Key? key}) : super(key: key);
  static const String route = "/gitHubPage";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final githubDataAsyncValue = ref.watch(githubFutureDataProvider);
    return githubDataAsyncValue.when(
      loading: () => const Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(Colors.white),
        ),
      ),
      error: (error, stackTrace) => ErrorMessageWidget(message: error.toString()),
      data: (data) => Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(data.icon, size: 100, color: PersonalPortfolioColors.githubIcon),
            const SizedBox(height: 16),
            Text(
              data.title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8),
            DecoratedBox(
              decoration: ShapeDecoration(
                shape: const StadiumBorder(),
                color: PersonalPortfolioColors.githubSecondary.withOpacity(0.5),
              ),
              child: InkWell(
                onTap: () => launchUrlString(data.link),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  child: Text(
                    data.linkLabel,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: PersonalPortfolioColors.githubIcon.withOpacity(0.8),
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
