import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class MeasurableWidgetNotification extends Notification {
  const MeasurableWidgetNotification(this.size);
  final Size size;
}

class MeasurableWidget extends SingleChildRenderObjectWidget {
  const MeasurableWidget({
    super.key,
    required Widget super.child,
    this.onChange,
    this.handlePostFrame = true,
  });

  final ValueChanged<Size>? onChange;

  final bool handlePostFrame;

  ValueChanged<Size> _getChangeHandler(BuildContext context) => (Size size) {
        if (onChange != null) {
          onChange!(size);
        } else {
          MeasurableWidgetNotification(size).dispatch(context);
        }
      };

  @override
  RenderObject createRenderObject(BuildContext context) =>
      RenderMeasurableWidget(_getChangeHandler(context), handlePostFrame);

  @override
  void updateRenderObject(
    BuildContext context,
    RenderMeasurableWidget renderObject,
  ) =>
      renderObject
        ..onChange = _getChangeHandler(context)
        ..handlePostFrame = handlePostFrame;
}

class RenderMeasurableWidget extends RenderProxyBox {
  RenderMeasurableWidget(this.onChange, this.handlePostFrame);

  ValueChanged<Size> onChange;
  bool handlePostFrame;
  Size? _prevSize;

  @override
  void performLayout() {
    super.performLayout();
    Size? newSize = child?.size;
    if (_prevSize == newSize) return;
    _prevSize = newSize;
    if (handlePostFrame) {
      WidgetsBinding.instance.addPostFrameCallback((_) => onChange(newSize!));
    } else {
      onChange(newSize!);
    }
  }
}
