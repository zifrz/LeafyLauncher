import 'package:flutter/material.dart';

import '../resources/app_constants.dart';

class TouchableTextButton extends StatefulWidget {
  final String text;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final Color? color;
  final Color? pressedColor;
  final TextStyle? style;

  const TouchableTextButton({
    Key? key,
    required this.text,
    this.onTap,
    this.onLongPress,
    this.color,
    this.pressedColor,
    this.style,
  }) : super(key: key);

  @override
  _TouchableTextButtonState createState() => _TouchableTextButtonState();
}

class _TouchableTextButtonState extends State<TouchableTextButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _colorTween;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 50),
    );

    _colorTween = ColorTween(
      begin: widget.color,
      end: widget.pressedColor,
    ).animate(_animationController);
  }

  // @override
  // void didChangeDependencies() {
  //   _colorTween = ColorTween(
  //     begin: widget.color,
  //     end: widget.pressedColor,
  //   ).animate(_animationController);

  //   super.didChangeDependencies();
  // }

  Future _animateForward() => _animationController.animateTo(
        1.0,
        duration: kButtonPressForwardAnimationDuration,
      );

  Future _animateBackward() => _animationController.animateTo(
        0.0,
        duration: kButtonPressReverseAnimationDuration,
      );

  Future _onTapDown(_) {
    return _animateForward();
  }

  Future _onTapCancel() {
    return _animateBackward();
  }

  Future _onTap() {
    widget.onTap?.call();

    return _animateForward().then((_) => _animateBackward());
  }

  @override
  Widget build(BuildContext context) {
    final hasTapHandler = widget.onTap != null || widget.onLongPress != null;

    return GestureDetector(
      onTapDown: hasTapHandler ? _onTapDown : null,
      onTapCancel: hasTapHandler ? _onTapCancel : null,
      onTap: hasTapHandler ? _onTap : null,
      onLongPress: widget.onLongPress,
      child: AnimatedBuilder(
        animation: _colorTween,
        builder: (_, child) {
          final style = widget.style ?? const TextStyle();

          return Text(
            widget.text,
            style: style.copyWith(color: _colorTween.value),
          );
        },
      ),
    );
  }
}
