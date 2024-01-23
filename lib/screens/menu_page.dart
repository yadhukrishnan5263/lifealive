import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lifealive/screens/menu_detail.dart';

import '../components/hover_text.dart';
import '../data/model/menu_model.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  List<MenuModel> items = [];
  Future<void> readJson() async {
    final String respones = await rootBundle.loadString("json_data/menu.json");
    final data = await json.decode(respones);
    setState(() {
      items = data["Menu"]
          .map<MenuModel>((item) => MenuModel.fromJson(item))
          .toList();
    });
  }

  @override
  void initState() {
    readJson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    bool isDesktop = MediaQuery.of(context).size.width >= 600;
    bool isMobile = MediaQuery.of(context).size.width < 600;
    print(h.toString());
    print(w.toString());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: h * 0.42,
                width: w,
                color: Colors.white,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("MENU",style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 16,color: Color(0xff999999),
                      ),),
                      SizedBox(height: 20,),
                      Image(
                        image: AssetImage("assets/Logo.png"),
                        height: h * 0.25,
                      ),
                      SizedBox(
                        height: h * 0.03,
                      ),
                      isMobile
                          ? Container()
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                MyHoverWidget(
                                  text: "ORDER ONLINE",
                                ),
                                SizedBox(
                                  width: w * 0.02,
                                ),
                                MyHoverWidget(
                                  text: "CATERING",
                                ),
                                SizedBox(
                                  width: w * 0.02,
                                ),
                                MyHoverWidget(
                                  text: "OUR MENU",
                                ),
                                SizedBox(
                                  width: w * 0.02,
                                ),
                                MyHoverWidget(
                                  text: "OUR JOURNEY",
                                ),
                                SizedBox(
                                  width: w * 0.02,
                                ),
                                MyHoverWidget(
                                  text: "WORK HERE",
                                ),
                                SizedBox(
                                  width: w * 0.02,
                                ),
                                MyHoverWidget(
                                  text: "GIFT CARDS",
                                ),
                                SizedBox(
                                  width: w * 0.02,
                                ),
                                MyHoverWidget(
                                  text: "LOCATIONS",
                                ),
                              ],
                            )
                    ])),
            Stack(children: [
              Column(children: [
                Container(
                  height: h * 0.75,
                  width: w,
                  child: Image(
                    image: AssetImage("assets/banner.png"),
                    fit: BoxFit.cover,
                  ),
                )
              ]),
              Padding(
                padding: const EdgeInsets.only(top: 100.0),
                child: Center(
                  child: Container(
                    width: w<600 ? w :w<900?w: w * 0.65,
                    color: Colors.white,
                    child: Column(
                      children: [
                        Container(
                          height: h * 0.08,
                          color: Color(0xffa86d93),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              HoverContainer(
                                text: "MENU",
                                icon: "assets/fork-and-knife.png",
                              ),
                              HoverContainer(
                                text: "MY BAG",
                                icon: 'assets/shopping-bag.png',
                              ),
                              HoverContainer(
                                text: "ACCOUNT",
                                icon: 'assets/user.png',
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                "LIFE ALIVE MENU",
                                style: TextStyle(
                                    color: Color(0xff616161), fontSize: 17),
                              ),
                            ),
                            Container(
                              height: 1,
                              color: Colors.black,
                              width: 150,
                            ),
                            SizedBox(
                              height: h * 0.01,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
                              child: Divider(
                                color: Color(0xff999999).withOpacity(0.3),
                                height: 0.09,
                              ),
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: items.length,
                              itemBuilder: (context, i) => Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: h * 0.05),
                                    child: isMobile
                                        ? Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 150,
                                                height: 50,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Center(
                                                      child: Container(
                                                        height: 30,
                                                        width: 30,
                                                        decoration: BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            border: Border.all(
                                                                color: Color(
                                                                    0xff999999))),
                                                        child: Center(
                                                            child: Text("V",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    color: Colors
                                                                        .black))),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text(
                                                      "Vegetarian",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: Color(
                                                              0xff616161)),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    width: 150,
                                                    height: 50,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        SizedBox(
                                                          width: 24,
                                                        ),
                                                        Center(
                                                          child: Container(
                                                            height: 30,
                                                            width: 30,
                                                            decoration: BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                border: Border.all(
                                                                    color: Color(
                                                                        0xff999999))),
                                                            child: Center(
                                                                child: Text(
                                                                    "VG",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            12,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w700,
                                                                        color: Colors
                                                                            .black))),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Text(
                                                          "Vegan",
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: Color(
                                                                  0xff616161)),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                width: 150,
                                                height: 50,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    SizedBox(
                                                      width: 11,
                                                    ),
                                                    Center(
                                                      child: Container(
                                                        height: 30,
                                                        width: 30,
                                                        decoration: BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            border: Border.all(
                                                                color: Color(
                                                                    0xff999999))),
                                                        child: Center(
                                                            child: Text("GF",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    color: Colors
                                                                        .black))),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text(
                                                      "Gluten Free",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: Color(
                                                              0xff616161)),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                width: 150,
                                                height: 50,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Center(
                                                      child: Container(
                                                        height: 30,
                                                        width: 30,
                                                        decoration: BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            border: Border.all(
                                                                color: Color(
                                                                    0xff999999))),
                                                        child: Center(
                                                            child: Text("DF",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    color: Colors
                                                                        .black))),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text(
                                                      "Dairy Free",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: Color(
                                                              0xff616161)),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                width: 150,
                                                height: 50,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Center(
                                                      child: Container(
                                                        height: 30,
                                                        width: 30,
                                                        decoration: BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            border: Border.all(
                                                                color: Color(
                                                                    0xff999999))),
                                                        child: Center(
                                                            child: Text("NF",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    color: Colors
                                                                        .black))),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text(
                                                      "Nut Free",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: Color(
                                                              0xff616161)),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          )
                                        : Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                height: 30,
                                                width: 30,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                        color:
                                                            Color(0xff999999))),
                                                child: Center(
                                                    child: Text("V",
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color:
                                                                Colors.black))),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                "Vegetarian",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w400,
                                                    color: Color(0xff616161)),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Container(
                                                height: 30,
                                                width: 30,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                        color:
                                                            Color(0xff999999))),
                                                child: Center(
                                                    child: Text("VG",
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color:
                                                                Colors.black))),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                "Vegan",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w400,
                                                    color: Color(0xff616161)),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Container(
                                                height: 30,
                                                width: 30,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                        color:
                                                            Color(0xff999999))),
                                                child: Center(
                                                    child: Text("GF",
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color:
                                                                Colors.black))),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                "Gluten Free",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w400,
                                                    color: Color(0xff616161)),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Container(
                                                height: 30,
                                                width: 30,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                        color:
                                                            Color(0xff999999))),
                                                child: Center(
                                                    child: Text("DF",
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color:
                                                                Colors.black))),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                "Dairy Free",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w400,
                                                    color: Color(0xff616161)),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Container(
                                                height: 30,
                                                width: 30,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                        color:
                                                            Color(0xff999999))),
                                                child: Center(
                                                    child: Text("NF",
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color:
                                                                Colors.black))),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                "Nut Free",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w400,
                                                    color: Color(0xff616161)),
                                              ),
                                            ],
                                          ),
                                  ),
                                  SizedBox(
                                    height: 50,
                                  ),
                                  Image.asset("assets/badge.png"),
                                  Text(items[i].title,
                                      style: TextStyle(
                                          fontSize: 24,
                                          color: Color(0xffa96d93),
                                          fontWeight: FontWeight.w900)),
                                  Text(items[i].subtitle,
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: Color(0xff616161)
                                              .withOpacity(.5))),
                                  SizedBox(
                                    height: 50,
                                  ),
                                  Container(
                                    child: Wrap(
                                      runSpacing: 10,
                                      spacing: 2,
                                      alignment: WrapAlignment.center,
                                      children: List.generate(
                                          items[i].items.length, (index) {
                                        return Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              18 / 3, 0, 18 / 3, 0),
                                          child: GestureDetector(
                                            onTap: () {
                                              Navigator.of(context)
                                                  .push(MaterialPageRoute(
                                                builder: (context) =>
                                                    MenuDetail(
                                                  dname: items[i]
                                                      .items[index]
                                                      .dName,
                                                  discreption: items[i]
                                                      .items[index]
                                                      .description,
                                                  price: items[i]
                                                      .items[index]
                                                      .price,
                                                  image: items[i]
                                                      .items[index]
                                                      .image,
                                                  catagory: items[i]
                                                      .items[index]
                                                      .category,
                                                ),
                                              ));
                                            },
                                            child: Container(
                                              height: 536,
                                              width: 315,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Color(0xff999999)
                                                          .withOpacity(0.3),
                                                      blurRadius: 3,
                                                      spreadRadius: 0.5,
                                                      offset: Offset(0, 1))
                                                ],
                                                color: Colors.white,
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    height: 318,
                                                    width: 318,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topLeft: Radius
                                                                  .circular(10),
                                                              topRight: Radius
                                                                  .circular(
                                                                      10)),
                                                      image: DecorationImage(
                                                          image: AssetImage(
                                                              items[i]
                                                                  .items[index]
                                                                  .image),
                                                          fit: BoxFit.cover),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(
                                                        10, 20, 10, 5),
                                                    child: Text(
                                                        items[i]
                                                            .items[index]
                                                            .dName,
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            color: Color(
                                                                0xffa96d93),
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500)),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(10, 0, 0, 20),
                                                    child: Text(
                                                        items[i]
                                                            .items[index]
                                                            .description,
                                                        maxLines: 4,
                                                        style: TextStyle(
                                                            fontSize: 13,
                                                            overflow:
                                                                TextOverflow
                                                                    .clip,
                                                            color: Color(
                                                                    0xff616161)
                                                                .withOpacity(
                                                                    .5))),
                                                  ),
                                                  Spacer(),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(
                                                        10, 0, 10, 15),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: <Widget>[
                                                        Text(
                                                            "\$${items[i].items[index].price}",
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                color: Color(
                                                                    0xffa96d93),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w900)),
                                                        Row(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children:
                                                                List.generate(
                                                                    items[i]
                                                                        .items[
                                                                            index]
                                                                        .category
                                                                        .length,
                                                                    (j) =>
                                                                        Padding(
                                                                          padding: const EdgeInsets
                                                                              .fromLTRB(
                                                                              5,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                          child:
                                                                              Center(
                                                                            child:
                                                                                Container(
                                                                              height: 25,
                                                                              width: 25,
                                                                              decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Color(0xff999999))),
                                                                              child: Center(child: Text(items[i].items[index].category[j], style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: Colors.black))),
                                                                            ),
                                                                          ),
                                                                        ))),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 150,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "QUESTION ABOUT A DELIVERY ORDER? ",
                                  style: TextStyle(
                                      color: Color(0xff616161),
                                      fontSize:isMobile?9: 13,
                                      letterSpacing: 3),
                                ),
                                Text(
                                  "CONTACT DOORDASH  SUPPORT",
                                  style: TextStyle(
                                      color: Color(0xfff09b3a),
                                      fontSize:isMobile?9: 13,
                                      letterSpacing: 3),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "PRESS INQUIRIES ",
                                  style: TextStyle(
                                      color: Color(0xfff09b3a),
                                      fontSize:isMobile?9: 13,
                                      letterSpacing: 3),
                                ),
                                Container(
                                  height: 20,
                                  width: 1,
                                  color: Colors.black,
                                ),
                                Text(
                                  " ALL OTHER INQUIRIES ",
                                  style: TextStyle(
                                      color: Color(0xfff09b3a),
                                      fontSize:isMobile?9: 13,
                                      letterSpacing: 3),
                                ),
                                Container(
                                  height: 20,
                                  width: 1,
                                  color: Colors.black,
                                ),
                                Text(
                                  " NUTRITION INFO",
                                  style: TextStyle(
                                      color: Color(0xfff09b3a),
                                      fontSize:isMobile?9: 13,
                                      letterSpacing: 3),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image(
                                  image: AssetImage("assets/instagram.png"),
                                  height: 30,
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Image(
                                    image: AssetImage("assets/twitter.png"),
                                    height: 30),
                                SizedBox(
                                  width: 30,
                                ),
                                Image(
                                    image: AssetImage("assets/facebook.png"),
                                    height: 30),
                                SizedBox(
                                  width: 30,
                                ),
                                Image(
                                    image: AssetImage("assets/ticktok.png"),
                                    height: 30),
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Center(
                                child: Text(
                              "2023 LIFE ALIVE ORGANIC CAFE . ALL RIGHTS RESERVED",
                              style: TextStyle(
                                  color: Color(0xff616161),
                                  fontSize:isMobile?9: 13,
                                  letterSpacing: 3),
                            )),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "TERMS & CONDITIONS ",
                                  style: TextStyle(
                                      color: Color(0xfff09b3a),
                                      fontSize:isMobile?9: 13,
                                      letterSpacing: 3),
                                ),
                                Container(
                                  height: 10,
                                  width: 1,
                                  color: Colors.black,
                                ),
                                Text(
                                  " PRIVACY POLICY",
                                  style: TextStyle(
                                      color: Color(0xfff09b3a),
                                      fontSize:isMobile?9: 13,
                                      letterSpacing: 3),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 50,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            ]),
          ],
        ),
      ),
    );
  }
}
