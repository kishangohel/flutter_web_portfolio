import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_portfolio/features/welcome/presentation/providers/welcome_page_providers.dart';
import 'package:flutter_web_portfolio/features/welcome/presentation/view_models/greetings_label_vm.dart';
import 'package:flutter_web_portfolio/shared/widgets/error_widget.dart';
import 'package:flutter_web_portfolio/styles/colors.dart';
import 'package:flutter_web_portfolio/styles/personal_portfolio_icons.dart';

class WelcomePage extends ConsumerWidget {
  static const String route = "/welcome";

  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final welcomePageAsyncValue = ref.watch(welComePageDataProvider);
    return welcomePageAsyncValue.when(
      data: (data) => Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border.all(color: PersonalPortfolioColors.welcomePrimary, width: 8),
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(data.imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 40),
                const Icon(PersonalPortfolioIcons.wave, size: 90, color: PersonalPortfolioColors.welcomeIcon),
              ],
            ),
            // GreetingLabelByStream(greetings: data.greetings),
            const GreetingsLabel(),
            Text.rich(
              TextSpan(
                style: const TextStyle(fontSize: 100, color: Colors.white),
                children: [
                  const TextSpan(text: "I'm "),
                  TextSpan(text: data.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(PersonalPortfolioIcons.badge, color: PersonalPortfolioColors.welcomePrimary, size: 80),
                const SizedBox(width: 20),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data.title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      data.subTitle,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 40, color: Colors.white),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
      error: (error, stackTrace) => ErrorMessageWidget(message: error.toString()),
      loading: () => const Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.white))),
    );

    /*Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TweenAnimationBuilder(
            duration: const Duration(seconds: 1),
            tween: Tween(begin: Alignment.centerRight, end: Alignment.center),
            builder: (BuildContext context, Alignment value, Widget? child) {
              return Align(
                alignment: value,
                child: child,
              );
            },
            child: const Text('Profile Page'),
          ),
        ],
      ),
    );*/
  }
}

class GreetingsLabel extends ConsumerStatefulWidget {
  const GreetingsLabel({Key? key}) : super(key: key);

  @override
  ConsumerState createState() => _GreetingsLabelState();
}

class _GreetingsLabelState extends ConsumerState<GreetingsLabel> {
  late final GreetingLabelVM _labelVM;

  @override
  void initState() {
    _labelVM = ref.read(greetingsLabelVmProvider.notifier);
    _labelVM.start();
    super.initState();
  }

  @override
  void dispose() {
    _labelVM.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(greetingsLabelVmProvider);
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      transitionBuilder: (child, animation) => ScaleTransition(
        scale: animation,
        child: FadeTransition(opacity: animation, child: child),
      ),
      child: Text(
        key: ValueKey(data),
        data,
        style: const TextStyle(fontSize: 100, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
}

class GreetingLabelByStream extends ConsumerWidget {
  const GreetingLabelByStream({required this.greetings, Key? key}) : super(key: key);

  final List<String> greetings;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final streamGreetingLabelAsyncValue = ref.watch(streamGreetingsProvider(greetings));
    return streamGreetingLabelAsyncValue.whenOrNull(
          data: (data) => AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            transitionBuilder: (child, animation) => ScaleTransition(
              scale: animation,
              child: FadeTransition(opacity: animation, child: child),
            ),
            child: Text(
              key: ValueKey(data),
              data,
              style: const TextStyle(fontSize: 100, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
          error: (error, stackTrace) => const Text('Greeting Error'),
        ) ??
        const SizedBox.shrink();
  }
}
