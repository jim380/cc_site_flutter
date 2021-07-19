import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:cc_site_flutter/models/portfolio.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cc_site_flutter/constants/constants.dart';

class PortfolioCard extends StatefulWidget {
  // just press "Command + ."
  const PortfolioCard({
    Key? key,
    this.index,
    this.press,
  }) : super(key: key);

  final int? index;
  final Function? press;

  @override
  _PortfolioCardState createState() => _PortfolioCardState();
}

class _PortfolioCardState extends State<PortfolioCard> {
  var isHover = false;
  late final _recognizer = TapGestureRecognizer()..onTap = _onTap;

  // void _onTap(String? url) {
  //   launch(portfolio[widget.index!].url!);
  // }
  void _onTap() {
    launch("https://www.google.com/");
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.press as void Function()?,
      onHover: (value) {
        setState(() {
          isHover = value;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        height: 250,
        width: 360,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [if (isHover) kDefaultCardShadow],
        ),
        child: Row(
          children: [
            Image.asset(portfolio[widget.index!].image!),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(portfolio[widget.index!].category!.toUpperCase()),
                    SizedBox(height: kDefaultPadding / 2),
                    Text(
                      portfolio[widget.index!].title!,
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(height: 1.5),
                    ),
                    SizedBox(height: kDefaultPadding),
                    InkWell(
                      // child: Text(
                      //   "View Details",
                      //   style: TextStyle(decoration: TextDecoration.underline),
                      // ),
                      // onTap: () async {
                      //   if (await canLaunch("www.google.com")) {
                      //     await launch("www.google.com");
                      //   }
                      // },
                      child: SelectableText.rich(TextSpan(children: [
                        TextSpan(
                          text: "View Details",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: isHover ? Colors.indigo : null),
                          mouseCursor: SystemMouseCursors.click,
                          onEnter: (event) => setState(() => isHover = true),
                          onExit: (event) => setState(() => isHover = true),
                          recognizer: _recognizer,
                        )
                      ])),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
