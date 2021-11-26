import 'package:flutter/material.dart';

OverlayEntry showOverlayWidget({
  required BuildContext ctx,
  required LayerLink layerLink,
  required Widget child,
  required Offset offset,
}) {
  final overlay = Overlay.of(ctx)!;
  final renderBox = ctx.findRenderObject() as RenderBox;
  final size = renderBox.size;
  final overlayEntry = OverlayEntry(
    builder: (ctx) => Positioned(
      width: size.width,
      child: CompositedTransformFollower(
        link: layerLink,
        showWhenUnlinked: false,
        offset: offset,
        child: child,
      ),
    ),
  );
  overlay.insert(overlayEntry);

  return overlayEntry;
}
