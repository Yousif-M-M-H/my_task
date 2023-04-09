import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(4, 9, 35, 1),
                  Color.fromRGBO(39, 105, 171, 1),
                ],
                begin: FractionalOffset.bottomCenter,
                end: FractionalOffset.topCenter),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 73),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.logout_rounded,
                      color: Colors.white,
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "My Profile",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
                SizedBox(
                  height: 22,
                ),
                Container(
                  height: height * 0.43,
                  // color: Colors.black,
                  child: LayoutBuilder(builder: (context, constraints) {
                    double innerHeight = constraints.maxHeight;
                    double innerWidth = constraints.maxWidth;

                    return Stack(
                      fit: StackFit.expand,
                      children: [
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            height: innerHeight * 0.72,
                            width: innerWidth,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.white),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 80,
                                ),
                                Text(
                                  "Yosif Mohamedain",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 37,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          "Orders",
                                          style: TextStyle(
                                              color: Colors.grey[700],
                                              fontSize: 25),
                                        ),
                                        Text(
                                          "10",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 21),
                                        )
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 8),
                                      child: Container(
                                        height: 50,
                                        width: 3,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            color: Colors.grey),
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          "pending",
                                          style: TextStyle(
                                              color: Colors.grey[700],
                                              fontSize: 21),
                                        ),
                                        Text(
                                          "1",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 25),
                                        )
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          child: Center(
                            child: Container(
                              child: Image.asset(
                                'assets/images/white_background_bag_after.jpg',
                                fit: BoxFit.fitWidth,
                                width: innerWidth * 0.45,
                                // height: 90,
                              ),
                            ),
                          ),
                        )
                      ],
                    );
                  }),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: height * 0.5,
                  width: width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'My Orders',
                          style: TextStyle(color: Colors.black, fontSize: 27),
                        ),
                        Divider(
                          thickness: 2.5,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: height * 0.15,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(30)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: height * 0.15,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(30)),
                        ),
                      ],
                    ),
                  ),
                )
              ]),
            ),
          ),
        )
      ],
    );
  }
}
