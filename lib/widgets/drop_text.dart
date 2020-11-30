import 'package:biomad_frontend/styles/indents.dart';
import 'package:biomad_frontend/widgets/block_base_widget.dart';
import 'package:flutter/material.dart';

class DropText extends StatefulWidget {
  final String header;
  final String inside;
  final Color color;

  DropText({
    this.header,
    this.inside,
    this.color,
    Key key,
  }) : super(key: key);

  @override
  _DropTextState createState() => _DropTextState(header, inside, color);
}

class _DropTextState extends State<DropText> {
  final String header;
  final String inside;
  final Color color;

  _DropTextState(this.header, this.inside, this.color);

  bool visibility = false;

  void _changed() {
    setState(() {
      visibility = !visibility;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => _changed(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                header,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .merge(TextStyle(color: color)),
              ),
              Icon(
                Icons.arrow_drop_down,
                size: 22.0,
                color: color,
              ),
            ],
          )),
      visibility
          ? Container(
              margin: EdgeInsets.only(bottom: Indents.sm),
              child: Text(
                inside,
                style: Theme.of(context).textTheme.bodyText2,
              ),
            )
          : new Container(),
    ]);
  }
}
