import 'package:flutter/material.dart';

class PageRouteGenerator<T> extends PageRoute<T> {

  PageRouteGenerator({
    @required this.builder,
    RouteSettings settings,
    this.maintainState = true,
  })  : assert(builder != null),
        assert(maintainState != null),
      //  assert(opaque),
        super(settings: settings);

  /// Builds the primary contents of the route.
  final WidgetBuilder builder;

  @override
  final bool maintainState;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 400);

  @override
  Color get barrierColor => null;

  @override
  String get barrierLabel => null;

  @override
  bool canTransitionFrom(TransitionRoute<dynamic> previousRoute) {
    return previousRoute is PageRouteGenerator;
  }

  @override
  bool canTransitionTo(TransitionRoute<dynamic> nextRoute) {
    return (nextRoute is PageRouteGenerator);
  }

  @override
  Widget buildPage(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      ) {
    final Widget result = builder(context);
    assert(() {
      if (result == null) {
        throw FlutterError(
            'The builder for route "${settings.name}" returned null.');
      }
      return true;
    }());
    return Semantics(
      scopesRoute: true,
      explicitChildNodes: true,
      child: result,
    );
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return _FadeInPageTransition(routeAnimation: animation, child: child);
  }

  @override
  String get debugLabel => '${super.debugLabel}(${settings.name})';
}

class _FadeInPageTransition extends StatelessWidget {
  _FadeInPageTransition({
    Key key,
    @required
    Animation<double>
    routeAnimation, // The route's linear 0.0 - 1.0 animation.
    @required this.child,
  })  : _opacityAnimation = routeAnimation.drive(_easeInTween),
        super(key: key);

  // Fractional offset from 1/4 screen below the top to fully on screen.
  static final Tween<Offset> _bottomUpTween = Tween<Offset>(
    begin: const Offset(0.0, 0.25),
    end: Offset.zero,
  );
  static final Animatable<double> _fastOutSlowInTween =
  CurveTween(curve: Curves.fastOutSlowIn);
  static final Animatable<double> _easeInTween =
  CurveTween(curve: Curves.easeIn);

  final Animation<double> _opacityAnimation;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacityAnimation,
      child: child,
    );
  }
}