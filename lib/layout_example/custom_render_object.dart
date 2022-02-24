import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ShadowBox extends Listener {
  final Widget? child;
  final double? distance;
  final Color? color;
  final PointerDownEventListener? onPointerDown;

  ShadowBox({this.onPointerDown, this.child, this.color, this.distance})
      : super(child: child, onPointerDown: onPointerDown);

  @override
  RenderPointerListener createRenderObject(BuildContext context) {
    return RenderShadowBox(distance, color,onPointerDown);
  }

  @override
  void updateRenderObject(
      BuildContext context, covariant RenderShadowBox renderObject) {
    super.updateRenderObject(context, renderObject);
    renderObject.distance = distance;
    renderObject.color = color;
    renderObject.onPointerDown = onPointerDown;
  }
}

class RenderShadowBox extends RenderPointerListener
    with DebugOverflowIndicatorMixin {
  double? distance;

  final PointerDownEventListener? onPointerDown;

  RenderShadowBox(this.distance, this.color,this.onPointerDown):super(onPointerDown: onPointerDown);

  Color? color;


  @override
  void handleEvent(PointerEvent event, covariant HitTestEntry entry) {
    super.handleEvent(event, entry);
  }



  @override
  bool debugHandleEvent(PointerEvent event, HitTestEntry entry) {
    // TODO: implement debugHandleEvent
    return super.debugHandleEvent(event, entry);
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    context.canvas.drawRect(offset & size, Paint()..color = color!);
    context.paintChild(child!, offset);
  }



  @override
  bool hitTest(BoxHitTestResult result, {Offset? position}) {
    //
    if(color == Colors.green){
      hitChildren(result,this,position: position);
      result.add(BoxHitTestEntry(this, position!));
      return true;
    }
    //
    // print(
    //     '===>>> hitTest  color = ${(color==Colors.red)?'红':'绿'}');
    if (hitTestChildren(result, position: position!) || hitTestSelf(position)) {
      result.add(BoxHitTestEntry(this, position));
      return true;
    }
    return false;
  }

  hitChildren(BoxHitTestResult result,RenderBox child,{Offset? position}){
    var box = (child as RenderProxyBox);
    if(box.child!=null){
      hitChild(result,box.child,position: position!);
    }
  }

  void hitChild(BoxHitTestResult result,RenderBox? child,{required Offset position}){
    result.add(BoxHitTestEntry(this.child!, position));
  }

  @override
  bool hitTestSelf(Offset? position) {
    return false;
  }
}
