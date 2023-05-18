import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SplashLoading extends HookWidget {
  final String message;

  const SplashLoading({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(duration: const Duration(seconds: 5))..repeat();
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
              width: 60,
              height: 60,
              child: Stack(
                children: [
                  const Center(child: Icon(Icons.account_circle, color: Colors.white, size: 50)),
                  Center(
                    child: SizedBox(
                      width: 60,
                      height: 60,
                      child: CircularProgressIndicator(
                        valueColor: controller.drive(
                          ColorTween(begin: Colors.purple, end: Colors.yellow),
                        ),
                      ),
                    ),
                  )
                ],
              )),
          const SizedBox(width: 20),
          Text(message, style: const TextStyle(color: Colors.white))
        ],
      ),
    );
  }
}
