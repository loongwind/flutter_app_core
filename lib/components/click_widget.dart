import 'package:flutter/material.dart';
import 'package:flutter_app_core/utils/func_utils.dart';

enum ClickType {
  none,
  throttle,
  throttleWithTimeout,
  debounce
}

class ClickWidget extends StatelessWidget {
  final Widget child;
  final Function? onTap;
  final ClickType type;
  final int? timeout;

  const ClickWidget(
      {Key? key,
      required this.child,
      this.onTap,
      this.type = ClickType.throttle,
      this.timeout})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      child: child,
      onTap: _getOnTap(),
    );
  }

  VoidCallback? _getOnTap() {
    if (type == ClickType.throttle) {
      return onTap?.throttle();
    } else if (type == ClickType.throttleWithTimeout) {
      return onTap?.throttleWithTimeout(timeout: timeout);
    }else if (type == ClickType.debounce) {
      return onTap?.debounce(timeout: timeout);
    }
    return () => onTap?.call();
  }
}
