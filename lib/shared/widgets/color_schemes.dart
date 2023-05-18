import 'package:flutter/material.dart';

class ColorSchemeWidget extends StatelessWidget {
  const ColorSchemeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return SingleChildScrollView(
      child: Wrap(
        children: [
          _ColorContainer(text: 'primary', color: colorScheme.primary, textColor: colorScheme.onPrimary),
          _ColorContainer(text: 'onPrimary', color: colorScheme.onPrimary),
          _ColorContainer(
            text: 'primaryContainer',
            color: colorScheme.primaryContainer,
            textColor: colorScheme.onPrimaryContainer,
          ),
          _ColorContainer(text: 'onPrimaryContainer', color: colorScheme.onPrimaryContainer),
          _ColorContainer(text: 'secondary', color: colorScheme.secondary, textColor: colorScheme.onSecondary),
          _ColorContainer(text: 'onSecondary', color: colorScheme.onSecondary),
          _ColorContainer(
            text: 'secondaryContainer',
            color: colorScheme.secondaryContainer,
            textColor: colorScheme.onSecondaryContainer,
          ),
          _ColorContainer(text: 'onSecondaryContainer', color: colorScheme.onSecondaryContainer),
          _ColorContainer(text: 'tertiary', color: colorScheme.tertiary, textColor: colorScheme.onTertiary),
          _ColorContainer(text: 'onTertiary', color: colorScheme.onTertiary),
          _ColorContainer(
            text: 'tertiaryContainer',
            color: colorScheme.tertiaryContainer,
            textColor: colorScheme.onTertiaryContainer,
          ),
          _ColorContainer(text: 'onTertiaryContainer', color: colorScheme.onTertiaryContainer),
          _ColorContainer(text: 'error', color: colorScheme.error, textColor: colorScheme.onError),
          _ColorContainer(text: 'onError', color: colorScheme.onError),
          _ColorContainer(
            text: 'errorContainer',
            color: colorScheme.errorContainer,
            textColor: colorScheme.onErrorContainer,
          ),
          _ColorContainer(text: 'onErrorContainer', color: colorScheme.onErrorContainer),
          _ColorContainer(text: 'outline', color: colorScheme.outline),
          _ColorContainer(text: 'outlineVariant', color: colorScheme.outlineVariant),
          _ColorContainer(text: 'background', color: colorScheme.background, textColor: colorScheme.onBackground),
          _ColorContainer(text: 'onBackground', color: colorScheme.onBackground),
          _ColorContainer(text: 'surface', color: colorScheme.surface, textColor: colorScheme.onSurface),
          _ColorContainer(text: 'onSurface', color: colorScheme.onSurface),
          _ColorContainer(
            text: 'surfaceVariant',
            color: colorScheme.surfaceVariant,
            textColor: colorScheme.onSurfaceVariant,
          ),
          _ColorContainer(text: 'onSurfaceVariant', color: colorScheme.onSurfaceVariant),
          _ColorContainer(
            text: 'inverseSurface',
            color: colorScheme.inverseSurface,
            textColor: colorScheme.onInverseSurface,
          ),
          _ColorContainer(text: 'onInverseSurface', color: colorScheme.onInverseSurface),
          _ColorContainer(text: 'inversePrimary', color: colorScheme.inversePrimary),
          _ColorContainer(text: 'shadow', color: colorScheme.shadow),
          _ColorContainer(text: 'scrim', color: colorScheme.scrim),
          _ColorContainer(text: 'surfaceTint', color: colorScheme.surfaceTint),
        ],
      ),
    );
  }
}

class _ColorContainer extends StatelessWidget {
  const _ColorContainer({
    Key? key,
    required this.text,
    required this.color,
    this.textColor,
  }) : super(key: key);

  final String text;
  final Color color;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 150,
      color: color,
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              text,
              style: TextStyle(color: Colors.grey, fontSize: textColor == null ? 20 : 14),
            ),
          ),
          if (textColor != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  'on${text.capitalizeFirst}',
                  style: TextStyle(color: textColor, fontSize: 20),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

extension StringX on String {
  String get capitalizeFirst {
    return replaceRange(0, 1, characters.first.toUpperCase());
  }
}
