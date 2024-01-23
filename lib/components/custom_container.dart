import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomContainer extends StatefulWidget {
  final String text;
  final String price;
  final bool selected;
  const CustomContainer({
    super.key,
    required this.text,
    required this.price,
    required this.selected,
  });

  @override
  State<CustomContainer> createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(10 / 4),
      child: Container(
          height: 40,
          width: 220,
          decoration: BoxDecoration(
              color: widget.selected == true ? Color(0xffdd7871) : Colors.white,
              border: Border.all(color: Color(0xff999999), width: 1)),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 140,
                    child: Text(widget.text,
                        maxLines: 1,
                        style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.w700,
                          fontSize: 13,
                          color: widget.selected == true
                              ? Colors.white
                              : Color(0xffa96d93),
                        )),
                  ),
                  widget.price == ""
                      ? Text("")
                      : Text("\$${widget.price}",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 13,
                            color: widget.selected == true
                                ? Colors.white
                                : Color(0xffa96d93),
                          )),
                ]),
          )),
    );
  }
}
