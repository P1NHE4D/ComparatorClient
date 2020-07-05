import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ComBox extends StatefulWidget {
  final Widget title;
  final Widget child;
  final Color backgroundColor;
  final Color focusColor;
  final void Function() onTap;
  final void Function() onTapDown;
  final void Function() onTapUp;
  final void Function() onTapCancel;
  final Icon icon;

  ComBox(
      {this.title,
      this.child,
      this.backgroundColor,
      this.focusColor,
      this.onTap,
      this.icon,
      this.onTapDown,
      this.onTapUp,
      this.onTapCancel});

  _ComBoxState createState() => _ComBoxState();
}

class _ComBoxState extends State<ComBox> {
  bool _isPressed = false;

  Widget _buildComBox() {
    return Container(
        decoration: BoxDecoration(
            color: _isPressed && widget.focusColor != null
                ? widget.focusColor
                : widget.backgroundColor,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(width: double.infinity, padding: EdgeInsets.all(12), child: widget.child),
            if (widget.icon != null) widget.icon
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(14, 20, 14, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.title != null) widget.title,
            if (widget.title != null) SizedBox(height: 6),
            GestureDetector(
                onTap: widget.onTap,
                onTapDown: (d) {
                  setState(() {
                    _isPressed = true;
                  });
                  if (widget.onTapDown != null) widget.onTapDown();
                },
                onTapUp: (d) {
                  setState(() {
                    _isPressed = false;
                  });
                  if (widget.onTapUp != null) widget.onTapUp();
                },
                onTapCancel: () {
                  setState(() {
                    _isPressed = false;
                  });
                  if (widget.onTapCancel != null) widget.onTapCancel();
                },
                child: _buildComBox())
          ],
        ));
  }
}
