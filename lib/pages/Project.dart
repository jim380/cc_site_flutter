import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'dart:math' as math;

class Project extends StatefulWidget {
  @override
  _ProjectState createState() => _ProjectState();
}

class _ProjectState extends State<Project> {
  bool condition = false;
  double height = 0;
  ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();
    setState(() {
      condition = false;
      height = 1500;
      Future.delayed(Duration(milliseconds: 400), () {
        setState(() {
          height = 0;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff101010),
      body: Container(
        child: Stack(
          children: [
            SingleChildScrollView(
              controller: controller,
              child: Center(
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 25.0, right: 25.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              height = MediaQuery.of(context).size.height;
                            });
                            Future.delayed(Duration(milliseconds: 1000), () {
                              Navigator.pop(context);
                            });
                          },
                          child: Container(
                              child: Icon(
                            Icons.clear_rounded,
                            color: Colors.white,
                            size: 35.0,
                          )),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 43.0,
                    ),
                    Text(
                      "Check out our projects",
                      style: GoogleFonts.poppins(
                          fontSize: 15.0,
                          color: Colors.white70,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      "Projects",
                      style: GoogleFonts.poppins(
                          fontSize: 46.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 112.0,
                    ),
                    MediaQuery.of(context).size.width > 950
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ResumeCard("Education"),
                              SizedBox(
                                width: 75.0,
                              ),
                              ResumeCard("Experience"),
                            ],
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ResumeCard("Education"),
                              SizedBox(
                                height: 35.0,
                              ),
                              ResumeCard("Experience"),
                            ],
                          ),
                    SizedBox(
                      height: 120.0,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.7 + 70,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: double.maxFinite,
                            child: Column(
                              children: [
                                Text(
                                  "My level of knowledge in some tools",
                                  style: GoogleFonts.poppins(
                                      fontSize: 15.0,
                                      color: Colors.white70,
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                  height: 8.0,
                                ),
                                Text(
                                  "My Skills",
                                  style: GoogleFonts.poppins(
                                      fontSize: 46.0,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white),
                                ),
                                MediaQuery.of(context).size.width > 950
                                    ? Row(
                                        children: [
                                          PercentItem(),
                                          SizedBox(
                                            width: 50.0,
                                          ),
                                          PercentItem(),
                                        ],
                                      )
                                    : Column(
                                        children: [
                                          PercentItem(),
                                          SizedBox(
                                            width: 50.0,
                                          ),
                                          PercentItem(),
                                        ],
                                      ),
                                SizedBox(
                                  height: 100.0,
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.7 +
                                          70,
                                  child: BootstrapRow(
                                    height: 350,
                                    children: [
                                      BootstrapCol(
                                        sizes:
                                            'col-12 col-sm-12 col-md-12 col-lg-6',
                                        child: Container(
                                          height: 350.0,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Take a tour of my office",
                                                overflow: TextOverflow.ellipsis,
                                                style: GoogleFonts.poppins(
                                                    fontSize: 25.0,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.white),
                                              ),
                                              SizedBox(
                                                height: 20.0,
                                              ),
                                              Container(
                                                height: 350.0 - 60,
                                                child: AutoSizeText(
                                                  "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quia cum quasi assumenda culpa praesentium consectetur voluptatibus expedita. Voluptatem tempore, aspernatur rem facilis, distinctio nemo! Odio velit, nemo dolorem voluptas!\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Laudantium qui aspernatur unde mollitia, in laborum.",
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 16.0,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      color: Colors.white70),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      BootstrapCol(
                                          sizes:
                                              'col-12 col-sm-12 col-md-12 col-lg-6',
                                          child: Container(
                                            height: 300,
                                            color: Colors.white,
                                            child: Image(
                                              image: NetworkImage(
                                                  "https://images.pexels.com/photos/1918291/pexels-photo-1918291.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"),
                                              fit: BoxFit.cover,
                                            ),
                                          ))
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Positioned(
                    top: condition ? null : 0,
                    bottom: condition ? 0 : null,
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                      onEnd: () {
                        // setState(() {
                        //   condition ? condition = false : condition = true;
                        //   Future.delayed(Duration(milliseconds: 400), () {
                        //     height = 0;
                        //   });
                        // });
                      },
                      height: height,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PercentItem extends StatefulWidget {
  @override
  _PercentItemState createState() => _PercentItemState();
}

class _PercentItemState extends State<PercentItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          PercentCard(
            progress: 0.95,
            text: "HTML/CSS",
          ),
          PercentCard(
            progress: 0.8,
            text: "Web Design",
          ),
          PercentCard(
            progress: 0.9,
            text: "JavaScript",
          ),
        ],
      ),
    );
  }
}

class PercentCard extends StatefulWidget {
  final double? progress;
  final String? text;
  PercentCard({this.progress, this.text});

  @override
  _PercentCardState createState() => _PercentCardState();
}

class _PercentCardState extends State<PercentCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width > 950
          ? MediaQuery.of(context).size.width * 0.3 + 35
          : MediaQuery.of(context).size.width * 0.7,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 45.0,
          ),
          Text(
            "   ${widget.text}",
            style: GoogleFonts.poppins(
                fontSize: 16.0,
                color: Colors.white,
                fontWeight: FontWeight.w300),
          ),
          SizedBox(
            height: 10.0,
          ),
          LinearPercentIndicator(
            percent: widget.progress!,
            lineHeight: 8.0,
            animation: true,
            animationDuration: 1000,
            linearStrokeCap: LinearStrokeCap.butt,
            progressColor: Color(0xff009e66),
            backgroundColor: Color(0xff161616),
          ),
        ],
      ),
    );
  }
}

class ResumeCard extends StatefulWidget {
  final String head;
  ResumeCard(this.head);
  @override
  _ResumeCardState createState() => _ResumeCardState();
}

class _ResumeCardState extends State<ResumeCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.head,
            style: GoogleFonts.poppins(
                fontSize: 25.0,
                fontWeight: FontWeight.w500,
                color: Colors.white),
          ),
          SizedBox(
            height: 15.0,
          ),
          CustomCard(
            head: "Computer Science",
            sub2:
                "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Optio quo repudiandae",
            sub: "Cambridge University / 2004 - 2007",
          ),
          Container(
            height: 1.5,
            width: MediaQuery.of(context).size.width > 950
                ? MediaQuery.of(context).size.width * 0.35
                : MediaQuery.of(context).size.width * 0.7,
            color: Colors.white,
          ),
          CustomCard(
            head: "Computer Science",
            sub2:
                "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Optio quo repudiandae",
            sub: "Cambridge University / 2004 - 2007",
          ),
          Container(
            height: 1.5,
            width: MediaQuery.of(context).size.width > 950
                ? MediaQuery.of(context).size.width * 0.35
                : MediaQuery.of(context).size.width * 0.7,
            color: Colors.white,
          ),
          CustomCard(
            head: "Computer Science",
            sub2:
                "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Optio quo repudiandae",
            sub: "Cambridge University / 2004 - 2007",
          ),
        ],
      ),
    );
  }
}

class CustomCard extends StatefulWidget {
  final String? head;
  final String? sub;
  final String? sub2;
  CustomCard({this.head, this.sub, this.sub2});

  @override
  _CustomCardState createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: MediaQuery.of(context).size.width > 950
          ? MediaQuery.of(context).size.width * 0.35
          : MediaQuery.of(context).size.width * 0.7,
      color: Color(0xff161616),
      child: Row(
        children: [
          Container(
            width: 50,
            child: Stack(
              children: [
                Container(
                  height: 250,
                  width: 2,
                  color: Color(0xff009e66),
                ),
                Positioned(
                  top: 50.0,
                  left: 1,
                  child: Container(
                    height: 20.0,
                    width: 25.0,
                    color: Color(0xff009e66),
                  ),
                ),
                Positioned(
                  top: 53,
                  left: 19.5,
                  child: Transform.rotate(
                    angle: 45 * math.pi / 180,
                    child: Container(
                      height: 14.0,
                      width: 14.0,
                      color: Color(0xff009e66),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width > 950
                ? MediaQuery.of(context).size.width * 0.35 - 60
                : MediaQuery.of(context).size.width * 0.7 - 65,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 45,
                ),
                Text(
                  widget.head!,
                  style:
                      GoogleFonts.poppins(fontSize: 21.0, color: Colors.white),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  widget.sub!,
                  style: GoogleFonts.poppins(
                      fontSize: 14.0,
                      color: Colors.white70,
                      fontWeight: FontWeight.w300),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  widget.sub2!,
                  style: GoogleFonts.poppins(
                      fontSize: 14.0,
                      color: Colors.white70,
                      fontWeight: FontWeight.w300),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
