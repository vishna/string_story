import 'package:flutter/widgets.dart';

extension NavigatorWaitForContext on GlobalKey<NavigatorState> {
  // Art of the delay
  Future<void> executeWithContext(void Function(BuildContext) op,
      {int maxChecks = 100}) async {
    var checks = 0;
    void scheduleCheck() {
      if (checks > maxChecks) {
        return;
      }

      final context = currentContext;
      if (context != null && context.mounted) {
        op(context);
      } else {
        checks++;
        WidgetsBinding.instance.addPostFrameCallback((_) {
          scheduleCheck();
        });
      }
    }

    scheduleCheck();
  }
}
