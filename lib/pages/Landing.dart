import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cc_site_flutter/routes/routes.dart';
import 'package:cc_site_flutter/extensions/hover_extension.dart';

class Landing extends StatefulWidget {
  String buttonText = "Enter";
  @override
  _LandingState createState() => _LandingState();
}

List text = ["dreamers", "thinkers", "doers"];

class _LandingState extends State<Landing> {
  double width = 180;
  String name = text[0];
  double height = 1500;
  int i = 0;
  bool condition = false;
  bool animate = false;

  @override
  void initState() {
    width = 0;
    condition = true;
    super.initState();
    Future.delayed(Duration(milliseconds: 400), () {
      setState(() {
        width = 180;
        height = 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff101010),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage('https://i.imgur.com/heJeIvO.gifv'),
              fit: BoxFit.cover),
        ),
        child: Center(
          child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 120,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 45.0),
                        // child: Text(
                        //   "Kitzu",
                        //   style: GoogleFonts.poppins(
                        //       fontSize: 31.0,
                        //       fontWeight: FontWeight.w900,
                        //       color: Colors.white),
                        // ),
                      ),
                      Spacer(),
                    ],
                  ),
                  // Spacer(),
                  SizedBox(
                    height: 200,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Cypher Core",
                        style: GoogleFonts.poppins(
                          fontSize: 71.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          shadows: <Shadow>[
                            // Shadow(
                            //   offset: Offset(10.0, 10.0),
                            //   blurRadius: 3.0,
                            //   color: Color.fromARGB(255, 0, 0, 0),
                            // ),
                            Shadow(
                              offset: Offset(10.0, 10.0),
                              blurRadius: 8.0,
                              color: Color.fromARGB(124, 179, 255, 0),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "We are ",
                              style: GoogleFonts.poppins(
                                  fontSize: 31.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                            AnimatedContainer(
                              duration: Duration(milliseconds: 1000),
                              curve: Curves.easeInOut,
                              width: width,
                              onEnd: () {
                                if (i == 3) i = 0;
                                if (width == 0) {
                                  name = text[i++];
                                }
                                Future.delayed(Duration(milliseconds: 200), () {
                                  setState(() {
                                    width == 180 ? width = 0 : width = 180;
                                  });
                                });
                              },
                              child: Text(
                                name,
                                softWrap: false,
                                style: GoogleFonts.poppins(
                                    fontSize: 31.0,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                            ),
                            Container(
                              height: 29.0,
                              width: 2.0,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      // MaterialButton(
                      //   color: Colors.white,
                      //   shape: RoundedRectangleBorder(
                      //       borderRadius:
                      //           BorderRadius.all(Radius.circular(20.0))),
                      //   onPressed: () => Navigator.pushNamed(context, '/Home'),
                      //   child: Padding(
                      //     padding: const EdgeInsets.symmetric(
                      //         vertical: 10.0, horizontal: 25.0),
                      //     child: Text(
                      //       "Enter",
                      //       style: GoogleFonts.poppins(
                      //           fontSize: 16.0,
                      //           fontWeight: FontWeight.w500,
                      //           color: Colors.black),
                      //     ),
                      //   ),
                      // ).moveUpOnHover,
                      Container(
                        height: 50,
                        width: 250,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () => Navigator.pushNamed(context, '/Home'),
                            child: MouseRegion(
                              onEnter: (val) {
                                setState(() {
                                  animate = true;
                                });
                              },
                              onExit: (val) {
                                setState(() {
                                  animate = false;
                                });
                              },
                              child: Container(
                                width: 250,
                                child: Stack(
                                  children: [
                                    AnimatedContainer(
                                      alignment:
                                          Alignment(animate ? -0.70 : 0, 0),
                                      duration: Duration(milliseconds: 400),
                                      curve: Curves.easeInSine,
                                      height: 50,
                                      width: animate ? 250 : 50,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                        color: Colors.white,
                                      ),
                                    ),
                                    AnimatedPadding(
                                      padding: EdgeInsets.only(
                                          left: animate ? 35 : 15),
                                      duration: Duration(milliseconds: 400),
                                      child: Container(
                                        height: 50.0,
                                        child: Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ),
                                    AnimatedPositioned(
                                      left: animate ? 25.0 : 10,
                                      top: 23.5,
                                      child: AnimatedOpacity(
                                        opacity: animate ? 1 : 0,
                                        duration: Duration(milliseconds: 300),
                                        child: Container(
                                          height: 3.0,
                                          width: 24.0,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            color: Colors.black87,
                                          ),
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 400),
                                      curve: Curves.easeInOutSine,
                                    ),
                                    Container(
                                      height: 50.0,
                                      padding: EdgeInsets.only(left: 25.0),
                                      child: Center(
                                        child: Text(
                                          widget.buttonText,
                                          style: TextStyle(
                                              fontSize: 21.0,
                                              fontWeight: FontWeight.w700,
                                              color: animate
                                                  ? Colors.black87
                                                  : Colors.white),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.only(bottom: 25.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 25.0),
                          child: RotatedBox(
                            quarterTurns: 1,
                            child: Row(
                              children: [
                                // Text(
                                //   "ENG",
                                //   style: GoogleFonts.poppins(
                                //       fontSize: 16.0,
                                //       fontWeight: FontWeight.w400,
                                //       color: Colors.white),
                                // ),
                                // SizedBox(
                                //   width: 10.0,
                                // ),
                                // Text(
                                //   "JAP",
                                //   style: GoogleFonts.poppins(
                                //       fontSize: 16.0,
                                //       fontWeight: FontWeight.w400,
                                //       color: Colors.white),
                                // ),
                              ],
                            ),
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 25.0),
                          child: Column(
                            children: [
                              Icon(FontAwesomeIcons.twitter,
                                  color: Colors.white),
                              SizedBox(
                                height: 15.0,
                              ),
                              Icon(FontAwesomeIcons.linkedin,
                                  color: Colors.white),
                              SizedBox(
                                height: 15.0,
                              ),
                              Icon(FontAwesomeIcons.github,
                                  color: Colors.white),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
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
                          height: height,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.black,
                          duration: Duration(milliseconds: 700),
                          curve: Curves.easeInOut,
                          onEnd: () {
                            print("i have runned");
                            setState(() {
                              Future.delayed(Duration(milliseconds: 100), () {
                                height = 0;
                              });
                            });
                            print(height);
                          },
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
