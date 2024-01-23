import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lifealive/components/custom_container.dart';

import '../components/custom_expansiontile.dart';
import '../components/hover_text.dart';
import '../data/model/menu_model.dart';
import '../data/model/options_model.dart';

class MenuDetail extends StatefulWidget {
  final String dname;
  final String discreption;
  final String price;
  final String image;
  final List catagory;
  const MenuDetail({
    super.key,
    required this.dname,
    required this.discreption,
    required this.price,
    required this.image,
    required this.catagory,
  });

  @override
  State<MenuDetail> createState() => _MenuDetailState();
}

class _MenuDetailState extends State<MenuDetail> {
  List<OptionsModel> options = [];
  List<SelectedModel> selectedlist = [];
  double totalPrice=0;
  Future<void> readJson() async {
    final String respones =
        await rootBundle.loadString("json_data/option.json");
    final data = await json.decode(respones);
    setState(() {
      options = data["options"]
          .map<OptionsModel>((item) => OptionsModel.fromJson(item))
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
                      isMobile?Container():Row(
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
                    width:w<600 ? w :w<990?w:1180,
                    color: Colors.white,
                    child: Column(
                      children: [
                        Container(
                          height: h * 0.08,
                          color: Color(0xffa86d93),
                          child: Stack(
                            children: [
                              Row(
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
                              GestureDetector(
                                onTap: (){
                                  Navigator.pop(context);
                                },
                                child: HoverContainer(
                                  text: "BACK",
                                  icon: 'assets/arrow.png',
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border(
                                            right: BorderSide(
                                              color: Color(0xff616161)
                                                  .withOpacity(.1),
                                              width: 1.0,
                                            ),
                                          )),
                                      height: h+300,
                                      width: isMobile?w*0.9:430,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: 430,
                                            width: 430,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image:
                                                      AssetImage(widget.image),
                                                  fit: BoxFit.cover),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                10, 20, 10, 5),
                                            child: Text(widget.dname,
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: Color(0xffa96d93),
                                                    fontWeight:
                                                        FontWeight.w900)),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                10, 0, 0, 20),
                                            child: Text(widget.discreption,
                                                maxLines: 4,
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    overflow: TextOverflow.clip,
                                                    color: Color(0xff616161)
                                                        .withOpacity(.9))),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                10, 0, 10, 15),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text("\$${widget.price}",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color:
                                                            Color(0xff616161),
                                                        fontWeight:
                                                            FontWeight.w900)),
                                                Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: List.generate(
                                                        widget.catagory.length,
                                                        (j) => Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .fromLTRB(
                                                                      5,
                                                                      0,
                                                                      0,
                                                                      0),
                                                              child: Center(
                                                                child:
                                                                    Container(
                                                                  height: 28,
                                                                  width: 28,
                                                                  decoration: BoxDecoration(
                                                                      shape: BoxShape
                                                                          .circle,
                                                                      border: Border.all(
                                                                          color:
                                                                              Color(0xff999999))),
                                                                  child: Center(
                                                                      child: Text(
                                                                          widget.catagory[
                                                                              j],
                                                                          style: TextStyle(
                                                                              fontSize: 14,
                                                                              fontWeight: FontWeight.w700,
                                                                              color: Colors.black))),
                                                                ),
                                                              ),
                                                            ))),
                                              ],
                                            ),
                                          ),
                                          selectedlist.length!=0?Text("${selectedlist.length} Selection",style:TextStyle(fontSize: 15,fontWeight: FontWeight.w700, color: Colors.black),):Container(),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                10, 10, 0, 10),
                                            child: Divider(
                                              height: 1,
                                              color: Color(0xff616161)
                                                  .withOpacity(.3),
                                            ),
                                          ),
                                          Column(
                                            children: [
                                              Container(
                                                width: 430,
                                                child:  Wrap(
                                                    runSpacing: 10,
                                                    spacing: 3,
                                                    alignment:
                                                    WrapAlignment.center,
                                                    children: List.generate(
                                                        selectedlist.length, (index) {
                                                      return selectedlist[index].price!=0?HoverContainerWithSize(text: selectedlist[index].text+ "\$ ${selectedlist[index].price}", title: selectedlist[index].title,):HoverContainerWithSize(text: selectedlist[index].text, title: selectedlist[index].title,);
                                                    })),
                                              ),
                                            ],
                                          ),
                                          selectedlist.length!= 0?Divider(
                                            height: 1,
                                            color: Color(0xff616161)
                                                .withOpacity(.3),
                                          ):Container(),
                                          Row(
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
                                                    child: Icon(Icons.remove)),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        8, 0, 8, 0),
                                                child: Text(
                                                  "1",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 20),
                                                ),
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
                                                    child: Icon(Icons.add)),
                                              ),
                                              SizedBox(
                                                width: 25,
                                              ),
                                              Container(
                                                width: 300,
                                                height: h * 0.08,
                                                color: Color(0xffdd7871),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    ImageIcon(
                                                      AssetImage(
                                                          "assets/shopping-bag.png"),
                                                      color: Colors.white,
                                                      size: h * 0.025,
                                                    ),
                                                    SizedBox(
                                                      width: w * 0.01,
                                                    ),
                                                    Text(
                                                      "Add to bag \$${double.parse(widget.price)+totalPrice}",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          isMobile? Expanded(
                                            child: Container(
                                                alignment:
                                                AlignmentDirectional.topStart,
                                                child: ListView.builder(
                                                  shrinkWrap: true,
                                                  itemCount: options.length,
                                                  itemBuilder: (context, i) =>
                                                      Padding(
                                                        padding:
                                                        const EdgeInsets.fromLTRB(
                                                            10, 10, 10, 0),
                                                        child: CustomExpansionListTile(
                                                          title: Text(
                                                            options[i].title,
                                                            style: TextStyle(
                                                                color: Colors.white),
                                                          ),
                                                          expandedChild: Container(
                                                            child: Wrap(
                                                                runSpacing: 10,
                                                                spacing: 3,
                                                                alignment:
                                                                WrapAlignment.center,
                                                                children: List.generate(
                                                                    options[i]
                                                                        .items
                                                                        .length, (index) {
                                                                  return GestureDetector(
                                                                    onTap: (){
                                                                      if(options[i]
                                                                          .items[index]
                                                                          .selected==true) {
                                                                        options[i]
                                                                            .items[index]
                                                                            .selected = false;
                                                                        selectedlist.removeWhere((item) => item.id == i+index);
                                                                        setState(() {
                                                                          totalPrice = selectedlist.fold(0, (sum, item) => sum + item.price);

                                                                        });
                                                                      }else{
                                                                        options[i]
                                                                            .items[index]
                                                                            .selected = true;
                                                                        selectedlist.add(SelectedModel(text: options[i]
                                                                            .items[index].text, id: i+index, title:  options[i].title, price: double.parse( options[i].items[index].price==""?"0":  options[i].items[index].price)));
                                                                        setState(() {

                                                                          totalPrice = selectedlist.fold(0, (sum, item) => sum + item.price);

                                                                        });
                                                                      }
                                                                    },
                                                                    child: CustomContainer(
                                                                      text: options[i]
                                                                          .items[index]
                                                                          .text,
                                                                      price: options[i]
                                                                          .items[index]
                                                                          .price, selected:  options[i]
                                                                        .items[index]
                                                                        .selected ,),
                                                                  );
                                                                })),
                                                          ),
                                                          titleBgColor: Color(0xffa96d93),
                                                          descriptionBgColor:
                                                          Colors.white,
                                                        ),
                                                      ),
                                                )),
                                          ):Container(),

                                        ],
                                      ),
                                    ),
                                  isDesktop?  Expanded(
                                      child: Container(
                                          alignment:
                                              AlignmentDirectional.topStart,
                                          child: ListView.builder(
                                            physics: NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            itemCount: options.length,
                                            itemBuilder: (context, i) =>
                                                Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      10, 10, 10, 0),
                                              child: CustomExpansionListTile(
                                                title: Text(
                                                  options[i].title,
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                expandedChild: Container(
                                                  child: Wrap(
                                                      runSpacing: 10,
                                                      spacing: 3,
                                                      alignment:
                                                          WrapAlignment.center,
                                                      children: List.generate(
                                                          options[i]
                                                              .items
                                                              .length, (index) {
                                                        return GestureDetector(
                                                          onTap: (){
                                                           if(options[i]
                                                               .items[index]
                                                               .selected==true) {
                                                              options[i]
                                                                  .items[index]
                                                                  .selected = false;
                                                              selectedlist.removeWhere((item) => item.id == i+index);
                                                              setState(() {
                                                                totalPrice = selectedlist.fold(0, (sum, item) => sum + item.price);

                                                              });
                                                            }else{
                                                             options[i]
                                                                 .items[index]
                                                                 .selected = true;
                                                             selectedlist.add(SelectedModel(text: options[i]
                                                                 .items[index].text, id: i+index, title:  options[i].title, price: double.parse( options[i].items[index].price==""?"0":  options[i].items[index].price)));
                                                             setState(() {

                                                                totalPrice = selectedlist.fold(0, (sum, item) => sum + item.price);

                                                             });
                                                           }
                                                          },
                                                          child: CustomContainer(
                                                              text: options[i]
                                                                  .items[index]
                                                                  .text,
                                                              price: options[i]
                                                                  .items[index]
                                                                  .price, selected:  options[i]
                                                              .items[index]
                                                              .selected ,),
                                                        );
                                                      })),
                                                ),
                                                titleBgColor: Color(0xffa96d93),
                                                descriptionBgColor:
                                                    Colors.white,
                                              ),
                                            ),
                                          )),
                                    ):Container()
                                  ],
                                )
                              ],
                            ),
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
                              "CONTACT DOORDASH SUPPORT",
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
