import 'package:flutter/material.dart';

// typedef HideCallback = Future Function();

class WeToast extends TransitionRoute {
  OverlayEntry _toastBarrier;
  final Widget message;
  final Widget icon;
  final RouteTransitionsBuilder _transitionBuilder;
  final Alignment _alignment;
  final Color _backgroudColor;
  final Color _color;
  final bool _inline;
  WeToast(
      {@required this.message,
      @required this.icon,
      @required Color backgroudColor,
      @required Color color,
      @required Alignment alignment,
      @required bool inline,
      Duration transitionDuration = const Duration(milliseconds: 100),
      RouteTransitionsBuilder transitionBuilder})
      : assert(icon != null),
        assert(message != null),
        assert(backgroudColor != null),
        assert(color != null),
        assert(alignment != null),
        assert(inline != null),
        _transitionDuration = transitionDuration,
        _transitionBuilder = transitionBuilder,
        _backgroudColor = backgroudColor,
        _color = color,
        _inline = inline,
        _alignment = alignment;

  @override
  void didChangePrevious(Route<dynamic> previousRoute) {
    super.didChangePrevious(previousRoute);
    changedInternalState();
  }

  @override
  void changedInternalState() {
    super.changedInternalState();
    _toastBarrier.markNeedsBuild();
  }

  @override
  Iterable<OverlayEntry> createOverlayEntries() sync* {
    yield _toastBarrier = OverlayEntry(builder: _buildToastBarrier);
    yield OverlayEntry(builder: _buildToastScope, maintainState: true);
  }

  @override
  bool get opaque => false;

  @override
  Duration get transitionDuration => _transitionDuration;
  final Duration _transitionDuration;

  Widget _buildToastBarrier(BuildContext context) {
    return IgnorePointer(
      ignoring: true,
    );
  }

  Widget _buildToastScope(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: Align(
          alignment: _alignment,
          child: IntrinsicHeight(
            child: AnimatedBuilder(
              animation: animation,
              builder: (context, child) {
                return _buildTransition(
                    context, animation, secondaryAnimation, child);
              },
              child: _inline
                  ? Container(
                      // alignment: Alignment.center,
                      padding: EdgeInsets.fromLTRB(8, 6, 8, 4),
                      decoration: BoxDecoration(
                          color: _backgroudColor,
                          borderRadius: BorderRadius.circular(5.0)),
                      constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.75),
                      child: Wrap(
                        runSpacing: 4.0, // 纵轴（垂直）方向间距
                        alignment: WrapAlignment.center,
                        spacing: 4.0, // gap between adjacent chips
                        direction: Axis.vertical,
                        children: <Widget>[
                          IconTheme(
                                data: IconThemeData(color: _color, size: 16.0),
                                child: icon),
                          DefaultTextStyle(
                            style: TextStyle(color: _color, fontSize: 16.0),
                            child: message,
                          )
                        ],
                      ))
                  : Container(
                      width: 122.0,
                      decoration: BoxDecoration(
                          color: _backgroudColor,
                          borderRadius: BorderRadius.circular(5.0)),
                      constraints: BoxConstraints(
                        minHeight: 122.0,
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 22.0),
                            constraints: BoxConstraints(minHeight: 55.0),
                            child: IconTheme(
                                data: IconThemeData(color: _color, size: 24.0),
                                child: icon),
                          ),
                          DefaultTextStyle(
                            style: TextStyle(color: _color, fontSize: 16.0),
                            child: message,
                          ),
                          //SizedBox(height: 18)
                        ],
                      ),
                    ),
            ),
          ),
        ));
  }

  Widget _buildTransition(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (_transitionBuilder == null) {
      return FadeTransition(
          opacity: CurvedAnimation(
            parent: animation,
            curve: Curves.linear,
          ),
          child: child);
    } // Some default transition
    return _transitionBuilder(context, animation, secondaryAnimation, child);
  }
}
