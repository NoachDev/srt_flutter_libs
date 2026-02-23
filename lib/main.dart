import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:srt_dart/main.dart';

Future<void> initializeSrtFlutter() async {
  Srt();
  // Also hook into Dart app lifecycle for graceful shutdown
  WidgetsBinding.instance.addObserver(
    _LifecycleObserver(),
  );
}

class _LifecycleObserver extends WidgetsBindingObserver {
  @override
  Future<AppExitResponse> didRequestAppExit() async {
    Srt.cleanUp();
    return AppExitResponse.exit;
  }
}
