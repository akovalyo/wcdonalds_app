import 'dart:math' as math;
import 'package:flutter/material.dart';

import '../../theme/theme.dart';

class ExpandableContainer extends StatefulWidget {
  final Widget titleWidget;
  final double collapsedHeight;
  final double expandedHeight;
  final double width;
  final Color color;
  final Widget child;

  const ExpandableContainer({
    Key? key,
    required this.titleWidget,
    this.collapsedHeight = AppTheme.collapsedWidgetHeight,
    required this.expandedHeight,
    this.width = AppTheme.maxWidthWidget,
    required this.color,
    required this.child,
  }) : super(key: key);

  @override
  _ExpandableContainerState createState() => _ExpandableContainerState();
}

class _ExpandableContainerState extends State<ExpandableContainer>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;
  late AnimationController _controller;
  late Animation _sizeAnimation;
  late Animation _opacityAnimation;
  late Animation _arrowAnimation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    //Animation params of the container, changes the size of the container
    _sizeAnimation =
        Tween<double>(begin: widget.collapsedHeight, end: widget.expandedHeight)
            .animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.3, curve: Curves.fastOutSlowIn),
    ));

    //Animation params of the child widget, changes opacity of the child widget
    _opacityAnimation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.3, 0.45, curve: Curves.linear),
    ));

    //Animation params of the arrow, rotates arrow 180 degrees
    _arrowAnimation = Tween(begin: 0.0, end: 180.0).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.45, curve: Curves.fastOutSlowIn),
    ));

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _isExpanded = true;
        });
      } else if (status == AnimationStatus.reverse) {
        setState(() {
          _isExpanded = false;
        });
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (_isExpanded) {
          _controller.reverse();
        } else {
          _controller.forward();
        }
      },
      child: AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context, _) {
          return Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 10,
            ),
            width: widget.width,
            height: _sizeAnimation.value,
            color: widget.color,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        widget.titleWidget,
                        Transform.rotate(
                          angle: (_arrowAnimation.value * math.pi / 180),
                          child: const Padding(
                            padding: EdgeInsets.only(bottom: 2.0),
                            child: Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.black,
                              size: 25,
                            ),
                          ),
                        )
                      ]),
                  _sizeAnimation.value == widget.expandedHeight
                      ? Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Opacity(
                              opacity: _opacityAnimation.value,
                              child: widget.child),
                        )
                      : Container(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
