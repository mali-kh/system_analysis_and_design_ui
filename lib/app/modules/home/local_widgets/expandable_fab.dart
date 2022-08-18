import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:system_analysis_and_design_project/app/modules/home/controllers/fab_controller.dart';

@immutable
class ExpandableFabClass extends StatefulWidget {
  const ExpandableFabClass({
    Key? key,
    this.isInitiallyOpen = false,
    required this.distanceBetween,
    required this.subChildren,
  }) : super(key: key);

  final bool isInitiallyOpen;
  final double distanceBetween;
  final List<Widget> subChildren;

  @override
  _ExpandableFabClassState createState() => _ExpandableFabClassState();
}

class _ExpandableFabClassState extends State<ExpandableFabClass>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _expandAnimationFab;
  // bool _open = false;
  final FABController controller = Get.put(FABController());

  void _toggle() {
    // controller.toggleOpen();

    if (controller.open) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
    // setState(
    //   () {
    //     _open = !_open;
    //     if (_open) {
    //       _animationController.forward();
    //     } else {
    //       _animationController.reverse();
    //     }
    //   },
    // );
  }

  @override
  void initState() {
    controller.changeOpen(widget.isInitiallyOpen);
    // _open = widget.isInitiallyOpen ?? false;
    // controller.initializeAnimationController(widget.isInitiallyOpen, this);
    _animationController = AnimationController(
      value: widget.isInitiallyOpen ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );

    // controller.initializeAnimationController(_animationController);

    _expandAnimationFab = CurvedAnimation(
      curve: Curves.fastOutSlowIn,
      reverseCurve: Curves.easeOutQuad,
      parent: _animationController,
    );

    controller.addListener(() {
      _toggle();
    });
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return SizedBox.expand(
      child: Stack(
        alignment: Alignment.bottomRight,
        clipBehavior: Clip.none,
        children: [
          _buildTapToCloseFab(theme),
          ..._buildExpandingActionButtons(),
          _buildTapToOpenFab(theme),
        ],
      ),
    );
  }

  Widget _buildTapToCloseFab(ThemeData theme) {
    return SizedBox(
      width: 56.0,
      height: 56.0,
      child: Center(
        child: Material(
          color: theme.hoverColor,
          shape: const CircleBorder(),
          clipBehavior: Clip.antiAlias,
          elevation: 4.0,
          child: GetBuilder<FABController>(
            builder: (controller) => InkWell(
              // onTap: _toggle,
              onTap: () => controller.toggleOpen(),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.close_rounded,
                  color: theme.primaryColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildExpandingActionButtons() {
    final children = <Widget>[];
    final count = widget.subChildren.length;
    final step = 90.0 / (count - 1);
    for (var i = 0, angleInDegrees = 0.0;
        i < count;
        i++, angleInDegrees += step) {
      children.add(
        _ExpandingActionButton(
          directionInDegrees: angleInDegrees,
          maxDistance: widget.distanceBetween,
          progress: _expandAnimationFab,
          child: widget.subChildren[i],
        ),
      );
    }
    return children;
  }

  Widget _buildTapToOpenFab(ThemeData theme) {
    return GetBuilder<FABController>(
      builder: (controller) {
        return IgnorePointer(
          ignoring: controller.open,
          child: AnimatedContainer(
            transformAlignment: Alignment.center,
            transform: Matrix4.diagonal3Values(
              controller.open ? 0.7 : 1.0,
              controller.open ? 0.7 : 1.0,
              1.0,
            ),
            duration: const Duration(milliseconds: 250),
            curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
            child: AnimatedOpacity(
              opacity: controller.open ? 0.0 : 1.0,
              curve: const Interval(0.25, 1.0, curve: Curves.easeInOut),
              duration: const Duration(milliseconds: 250),
              child: FloatingActionButton(
                backgroundColor: theme.primaryColor,
                // onPressed: _toggle,
                onPressed: () => controller.toggleOpen(),
                child: Icon(
                  Icons.add_rounded,
                  color: theme.hoverColor,
                  size: 35,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

@immutable
class _ExpandingActionButton extends StatelessWidget {
  _ExpandingActionButton({
    Key? key,
    required this.directionInDegrees,
    required this.maxDistance,
    required this.progress,
    required this.child,
  }) : super(key: key);

  final double directionInDegrees;
  final double maxDistance;
  final Animation<double> progress;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: progress,
      builder: (context, child) {
        final offset = Offset.fromDirection(
          directionInDegrees * (math.pi / 180.0),
          progress.value * maxDistance,
        );
        return Positioned(
          right: 4.0 + offset.dx,
          bottom: 4.0 + offset.dy,
          child: Transform.rotate(
            angle: (1.0 - progress.value) * math.pi / 2,
            child: child!,
          ),
        );
      },
      child: FadeTransition(
        opacity: progress,
        child: child,
      ),
    );
  }
}

class FABActionButton extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final String text;
  const FABActionButton({
    Key? key,
    required this.onTap,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Center(
      child: Column(
        children: [
          Material(
            color: theme.primaryColor,
            shape: const CircleBorder(),
            clipBehavior: Clip.antiAlias,
            // elevation: 4.0,
            child: InkWell(
              onTap: onTap,
              child: Padding(
                padding: const EdgeInsets.all(13),
                child: Center(
                  child: Icon(
                    icon,
                    color: theme.hintColor,
                    size: 20,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 3,
          ),
          Text(
            text,
            style: TextStyle(fontSize: 11),
          ),
        ],
      ),
    );
  }
}
