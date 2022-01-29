import 'package:flutter/material.dart';
import 'package:cc_site_flutter/models/services.dart';
import 'package:cc_site_flutter/extensions/hover_extension.dart';
import 'package:cc_site_flutter/constants/constants.dart';
import 'package:glass/glass.dart';

class ServiceCard2 extends StatefulWidget {
  const ServiceCard2({
    Key? key,
    this.index,
  }) : super(key: key);

  final int? index;

  @override
  _ServiceCard2State createState() => _ServiceCard2State();
}

class _ServiceCard2State extends State<ServiceCard2> {
  bool isHover = false;
  Duration duration = Duration(milliseconds: 200);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: Wrap(children: [
        GlassContainer(
            text: services[widget.index!].title!,
            what: "what do you want?",
            color: services[widget.index!].color)
      ]),
    ));
  }
}

class GlassContainer extends StatefulWidget {
  final String? text;
  final String? what;
  final Color? color;
  GlassContainer({this.text, this.what, this.color});

  @override
  _GlassContainerState createState() => _GlassContainerState();
}

class _GlassContainerState extends State<GlassContainer> {
  bool animate = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      height: 220.0,
      width: 270.0,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 270),
              curve: Curves.easeOut,
              height: 230,
              width: 270,
              padding: EdgeInsets.only(
                  left: 37.0, right: 37.0, top: animate ? 37.0 : 80.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(21.0),
                  color: Colors.white),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    // services[widget.index!].title!,
                    "title from model",
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.7),
                      fontWeight: FontWeight.w900,
                      fontSize: 21,
                    ),
                  ),
                  Text(
                    widget.what!,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.7),
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  )
                ],
              ),
            ),
          ),
          AnimatedAlign(
            alignment: animate ? Alignment(0, 0.75) : Alignment.center,
            duration: Duration(microseconds: 270),
            child: MouseRegion(
              onEnter: (a) {
                setState(() {
                  animate = true;
                });
              },
              onExit: (a) {
                setState(() {
                  animate = false;
                });
              },
              child: AnimatedContainer(
                duration: Duration(microseconds: 275),
                curve: Curves.easeIn,
                height: animate ? 80 : 180,
                width: 220,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14.0),
                    color: animate ? widget.color! : Colors.transparent),
                child: Center(
                  child: Text(
                    widget.text!,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                      fontSize: 23.0,
                    ),
                  ),
                ),
              ).asGlass(
                clipBorderRadius: BorderRadius.circular(14.0),
                blurX: 8.0,
                blurY: 10.0,
              ),
            ),
          )
        ],
      ),
    );
  }
}
