import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:instagram_redesign_web/enum/layouts.dart';
import 'package:instagram_redesign_web/pages/home.dart';
import 'package:sizer/sizer.dart';
import '../global.dart';

class RightSide extends StatefulWidget {
  const RightSide({super.key});

  @override
  State<RightSide> createState() => RrightSideState();
}

class RrightSideState extends State<RightSide> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: layout == Layouts.desktop ? 7 : 4,
      child: Container(
        margin: EdgeInsets.only(top: 5.sp, right: 5.sp, bottom: 5.sp),
        decoration: BoxDecoration(
          color: Color(0xFFE1E2E2),
          borderRadius: BorderRadius.all(Radius.circular(14.sp)),
        ),
        child: Column(
          children: [
            appBar(),
            Expanded(
              child: ScrollConfiguration(
                behavior:
                    ScrollConfiguration.of(context).copyWith(dragDevices: {
                  PointerDeviceKind.mouse,
                  PointerDeviceKind.touch,
                }, scrollbars: false),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      story(),
                      feed(),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container feed() {
    int numberOfPost = 0;
    switch (layout) {
      case Layouts.mobile:
        numberOfPost = 1;
        break;
      case Layouts.tablet:
        numberOfPost = 2;
        break;
      case Layouts.desktop:
        numberOfPost = 3;
        break;
    }
    // ignore: avoid_unnecessary_containers
    return Container(
      // color: Colors.green,
      // height: 400,
      child: Column(
        children: [
          const SizedBox(height: 15),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            alignment: Alignment.centerLeft,
            child: const Text(
              "Feed",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          StaggeredGrid.count(
              crossAxisCount: numberOfPost,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              axisDirection: AxisDirection.down,
              children: [
                ...List.generate(userData.length, (index) {
                  return Container(
                    margin: EdgeInsets.only(
                        top: 5.sp, left: 5.sp, right: 5.sp, bottom: 5.sp),
                    child: Material(
                      elevation: 10.sp,
                      borderRadius: BorderRadius.all(Radius.circular(5.sp)),
                      child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.sp)),
                          ),
                          child: Column(
                            children: [
                              ListTile(
                                  title: SizedBox(
                                    width: double.infinity,
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      physics: const BouncingScrollPhysics(),
                                      child: Text(
                                        userData[index]["name"],
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1.2,
                                        ),
                                      ),
                                    ),
                                  ),
                                  subtitle: Text(
                                    userData[index]["country"],
                                    style: const TextStyle(
                                      fontSize: 12,
                                      letterSpacing: 1.2,
                                    ),
                                  ),
                                  leading: CircleAvatar(
                                    radius: 25,
                                    backgroundColor: const Color(0xFFE1E2E2),
                                    child: CircleAvatar(
                                      radius: 23,
                                      backgroundImage:
                                          AssetImage(userData[index]["logo"]),
                                    ),
                                  ),
                                  trailing: const CircleAvatar(
                                    radius: 25,
                                    backgroundColor: Colors.transparent,
                                    child: Icon(
                                      Icons.more_vert,
                                      color: Colors.grey,
                                      size: 30,
                                    ),
                                  )),
                              Container(
                                height: 30.h,
                                width: 80.w,
                                margin: EdgeInsets.only(
                                  top: 2.sp,
                                  left: 2.sp,
                                  right: 2.sp,
                                  bottom: 0,
                                ),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(userData[index]["img"]),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(24)),
                                ),
                              ),
                              Container(
                                width: 50.w,
                                margin: EdgeInsets.symmetric(horizontal: 4.sp),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      userData[index]["isLiked"]
                                          ? IconButton(
                                              onPressed: () {},
                                              icon: Icon(
                                                Icons.favorite,
                                                color: Colors.pink,
                                                size: 6.sp,
                                              ),
                                            )
                                          : IconButton(
                                              onPressed: () {},
                                              icon: Icon(
                                                Icons.favorite_outline,
                                                size: 6.sp,
                                              ),
                                            ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.message_outlined,
                                          size: 6.sp,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.send_outlined,
                                          size: 6.sp,
                                        ),
                                      ),
                                      SizedBox(width: 15.sp),
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.bookmark_border,
                                          size: 6.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 2.sp, vertical: 5.sp),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 6,
                                        backgroundImage:
                                            AssetImage(userData[index]["logo"]),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      const Text(
                                        "Like By ",
                                        style: TextStyle(
                                          fontSize: 12,
                                          // letterSpacing: 1.1,
                                        ),
                                      ),
                                      const Text(
                                        "Andrew and 360 others",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          // letterSpacing: 1.1,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 10,
                                ),
                                child: Text(
                                  userData[index]["desc"],
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    // letterSpacing: 1.1,
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ),
                  );
                })
              ]),
        ],
      ),
    );
  }

  Container story() {
    return Container(
      // color: Colors.red,
      margin: const EdgeInsets.only(bottom: 10),
      // height: 400,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            alignment: Alignment.centerLeft,
            child: const Text(
              "Stories",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 15),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              alignment: Alignment.centerLeft,
              child: ScrollConfiguration(
                behavior:
                    ScrollConfiguration.of(context).copyWith(dragDevices: {
                  PointerDeviceKind.mouse,
                  PointerDeviceKind.touch,
                }, scrollbars: false),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ...List.generate(storyData.length, (index) {
                        if (index == 0) {
                          return Container(
                            margin: const EdgeInsets.only(left: 10),
                            child: const Column(
                              children: [
                                Stack(
                                  alignment: Alignment.centerRight,
                                  children: [
                                    CircleAvatar(
                                      radius: 38,
                                      backgroundImage:
                                          AssetImage('images/2m.jpg'),
                                    ),
                                    Positioned(
                                      bottom: -0,
                                      right: 0,
                                      child: CircleAvatar(
                                        radius: 12,
                                        backgroundColor: Colors.blue,
                                        child: Icon(
                                          Icons.add,
                                          size: 10,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8),
                                Text("Your Story")
                              ],
                            ),
                          );
                        }
                        return Container(
                          margin: const EdgeInsets.only(left: 20),
                          child: Column(
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  const CircleAvatar(
                                    radius: 44,
                                    backgroundColor:
                                        Color.fromARGB(255, 245, 60, 13),
                                    child: CircleAvatar(
                                      radius: 41,
                                      backgroundColor: Colors.white,
                                    ),
                                  ),
                                  CircleAvatar(
                                    radius: 38,
                                    backgroundImage: AssetImage(
                                      "${storyData[index]["logo"]}",
                                    ),
                                  ),
                                  if (storyData[index]["isLive"])
                                    Positioned(
                                      bottom: -3,
                                      child: Container(
                                        color: Colors.pink,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5, vertical: 4),
                                        child: const Text(
                                          "LIVE",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10),
                                        ),
                                      ),
                                    )
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text(storyData[index]["firstName"])
                            ],
                          ),
                        );
                      })
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }

  Container appBar() {
    return Container(
      height: 5.h,
      margin: EdgeInsets.only(
        top: 5.sp,
        left: 10.sp,
        right: 10.sp,
        bottom: 10.sp,
      ),
      decoration: const BoxDecoration(
          // color: Colors.red,
          ),
      child: Row(
        children: [
          layout == Layouts.mobile
              ? IconButton(
                  onPressed: () {
                    scaffoldKey.currentState!.openDrawer();
                  },
                  icon: const Icon(Icons.menu),
                )
              : SizedBox(
                  width: 2.w,
                ),
          Expanded(
            flex: layout == Layouts.desktop ? 3 : 2,
            child: Container(
              width: 30.w,
              height: 10.h,
              padding: EdgeInsets.only(top: 2.sp, bottom: 2.sp, left: 10.sp),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(14.sp)),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: [
                  Icon(
                    Icons.search_outlined,
                    color: Colors.grey,
                    size: 4.sp,
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Text(
                    "Search",
                    style: TextStyle(color: Colors.grey, fontSize: 5.sp),
                  )
                ]),
              ),
            ),
          ),
          const Spacer(flex: 1),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_active_outlined),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.message_rounded),
          ),
          SizedBox(
            width: 2.w,
          ),
          Expanded(
            flex: layout == Layouts.desktop ? 2 : 1,
            child: Material(
              elevation: 4.sp,
              borderRadius: BorderRadius.all(Radius.circular(14.sp)),
              child: Container(
                  height: 10.h,
                  width: 20.w,
                  padding:
                      EdgeInsets.symmetric(vertical: 2.sp, horizontal: 4.sp),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(14.sp)),
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      stops: [
                        0.1,
                        0.4,
                        0.6,
                        0.9,
                        0.9,
                      ],
                      colors: [
                        Colors.orange,
                        Color.fromARGB(255, 233, 111, 30),
                        Color.fromARGB(255, 224, 67, 39),
                        Colors.pink,
                        Colors.pink,
                      ],
                    ),
                  ),
                  child: Text(
                    "+  Create a post",
                    style: TextStyle(color: Colors.white, fontSize: 4.sp),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
