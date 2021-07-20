import 'package:first_flutter_demo/animate/ImplicitlyAnimated/FiveAnimation.dart';
import 'package:first_flutter_demo/animate/ImplicitlyAnimated/FourthTweenAnimation.dart';
import 'package:first_flutter_demo/animate/ImplicitlyAnimated/SecondAnite.dart';
import 'package:first_flutter_demo/animate/ImplicitlyAnimated/ThirdAnimation.dart';
import 'package:first_flutter_demo/animate/animate_home.dart';
import 'package:first_flutter_demo/animate/transition/FirstTransition.dart';
import 'package:flutter/cupertino.dart';

import 'animate/ImplicitlyAnimated/FirstAnimate.dart';
import 'animate/transition/CustomPaintTransition.dart';
import 'animate/transition/Transition478.dart';

class AnimateRouter {
  static const FIRST_ANIMATE_ROUTER = 'first_Animate_router';
  static const SECOND_ANIMATE_ROUTER = '控件之间切换动画';
  static const THIRD_ANIMATE_ROUTER = 'Curves';
  static const FOURTH_ANIMATE_ROUTER = 'fourth_Animate_router';
  static const FIFTH_ANIMATE_ROUTER = 'fifth_Animate_router';
  static const FIRST_TRANSITION_ROUTER = 'first_transition_router';
  static const CUSTOM_PAIN_TRANSITION_ROUTER = 'custom_pain_transition_router';
  static const TRANSITION_478_ROUTER = 'transition_478_router';
}

class Group {
  static const ANIMATED_LIST = 'animated_list';
}

///动画路由
Map<String, WidgetBuilder> animateRoutes = {
  AnimateRouter.FIRST_ANIMATE_ROUTER: (context) => FirstAnimatePage(),
  AnimateRouter.SECOND_ANIMATE_ROUTER: (context) => SecondAnimated(),
  AnimateRouter.THIRD_ANIMATE_ROUTER: (context) => ThirdAnimation(),
  AnimateRouter.FOURTH_ANIMATE_ROUTER: (context) => FourthTweenAnimation(),
  AnimateRouter.FIFTH_ANIMATE_ROUTER: (context) => FiveAnimation(),
  AnimateRouter.FIRST_TRANSITION_ROUTER: (context) => FirstTransition(),
  AnimateRouter.CUSTOM_PAIN_TRANSITION_ROUTER: (context) =>
      CustomPaintTransition(),
  AnimateRouter.TRANSITION_478_ROUTER: (context) => Transition478(),
};

Map<String, WidgetBuilder> groupRoutes = {
  Group.ANIMATED_LIST: (context) => AnimatedDemo(),
};
