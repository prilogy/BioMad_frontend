import 'package:biomad_frontend/styles/avatar_sizes.dart';
import 'package:flutter/material.dart';

class CustomCircleAvatar extends StatelessWidget {
  final Widget? child;
  final String? text;
  final Color? backgroundColor;
  final double? radius;


  CustomCircleAvatar({this.child, this.text, this.backgroundColor, this.radius});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CircleAvatar(
      backgroundColor: backgroundColor,
      radius: radius ?? AvatarSizes.md,
      child: text != null ? 
      Text(text!.length > 0 ? text![0] : '', style: Theme.of(context).textTheme.headline5!.merge(TextStyle(color: theme.scaffoldBackgroundColor)),)
          : child != null ? child : Container()
    );
  }
}
