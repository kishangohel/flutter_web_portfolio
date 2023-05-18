import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

class GreetingLabelVM extends StateNotifier<String> {
  GreetingLabelVM(super.state, {required this.greetings});

  final List<String> greetings;
  Timer? timer;
  int counter = 0;

  start() {
    timer?.cancel();
    timer = null;
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        Logger().d(counter);
        if (counter == greetings.length) counter = 0;
        state = greetings[counter++];
      },
    );
  }

  stop() {
    timer?.cancel();
    timer = null;
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}
