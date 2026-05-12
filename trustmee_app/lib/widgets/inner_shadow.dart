import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class InnerShadow extends SingleChildRenderObjectWidget {
  const InnerShadow({
    super.key,
    this.blur = 5,
    this.color = Colors.black38,
    this.offset = const Offset(0, 4),
    super.child,
  });

  final double blur;
  final Color color;
  final Offset offset;

  @override
  RenderObject createRenderObject(BuildContext context) {
    final renderObject = _RenderInnerShadow();
    updateRenderObject(context, renderObject);
    return renderObject;
  }

  @override
  void updateRenderObject(
      BuildContext context, _RenderInnerShadow renderObject) {
    renderObject
      ..color = color
      ..blur = blur
      ..dx = offset.dx
      ..dy = offset.dy;
  }
}

class _RenderInnerShadow extends RenderProxyBox {
  double blur = 5;
  Color color = Colors.black38;
  double dx = 0;
  double dy = 4;

  @override
  void paint(PaintingContext context, Offset offset) {
    if (child == null) return;

    final Rect outerRect = offset & size;
    final Canvas canvas = context.canvas;

    canvas.saveLayer(outerRect, Paint());
    context.paintChild(child!, offset);

    final Paint shadowPaint = Paint()
      ..blendMode = BlendMode.srcATop
      ..colorFilter = ColorFilter.mode(color, BlendMode.srcOut)
      ..imageFilter = ImageFilter.blur(sigmaX: blur, sigmaY: blur);

    canvas.saveLayer(outerRect, shadowPaint);
    canvas.translate(dx, dy);
    context.paintChild(child!, offset);

    canvas.restore();
    canvas.restore();
  }
}
