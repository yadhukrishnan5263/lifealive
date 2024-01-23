import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHoverWidget extends StatefulWidget {
   final String text;

  const MyHoverWidget({super.key, required this.text});
  @override
  _MyHoverWidgetState createState() => _MyHoverWidgetState();
}

class _MyHoverWidgetState extends State<MyHoverWidget> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: Text(
        widget.text,
        style: TextStyle(
          color: isHovered ? Color(0xffdd7871) : Color(0xff616161),
        ),
      ),
    );
  }
}
class HoverContainer extends StatefulWidget {
  final String text;
  final String icon;

  const HoverContainer({super.key, required this.text, required this.icon});
  @override
  HoverContainerState createState() => HoverContainerState();
}

class HoverContainerState extends State<HoverContainer> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    double h=MediaQuery.of(context).size.height;
    double w=MediaQuery.of(context).size.width;
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: Container(
        width: 120,
        height: h*0.08,
        color: isHovered ? Color(0xff6d6161) : Color(0xffa86d93),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           ImageIcon(AssetImage(widget.icon),color: Colors.white,size: h*0.025,),
            SizedBox(width: w*0.01,),
            Text(
              widget.text,
              style: TextStyle(
                color: Colors.white,
                
              ),
            ),
          ],
        ),
      ),
    );
  }
}




class HoverContainerWithSize extends StatefulWidget {
  final String text;
  final String title;

  const HoverContainerWithSize({super.key, required this.text, required this.title});
  @override
  HoverContainerWithSizeState createState() => HoverContainerWithSizeState();
}

class HoverContainerWithSizeState extends State<HoverContainerWithSize> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    double h=MediaQuery.of(context).size.height;
    double w=MediaQuery.of(context).size.width;
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          width: 120,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                 color: isHovered ? Colors.black12:Colors.white,
                offset: Offset(0, 1),
                spreadRadius: 5,
                blurRadius: 3
              )
            ],
            color: Colors.white,
          ),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.title,
                style: TextStyle(
                  color: Color(0xff999999),

                ),
              ),
              Text(
                widget.text,
                style: TextStyle(
                  color: Colors.black38,

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}