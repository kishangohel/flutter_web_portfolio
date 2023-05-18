import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_portfolio/shared/providers/shared_providers.dart';

class ColorPage extends ConsumerWidget {
  const ColorPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageGradient = ref.watch(colorPageProvider);
    return SizedBox.expand(
      child: DecoratedBox(
        decoration: BoxDecoration(gradient: pageGradient),
      ),
    );
  }
}
