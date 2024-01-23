
import 'package:flutter/material.dart';





class CustomExpansionListTile extends StatefulWidget {
  final Widget title;
  final Widget expandedChild;
  final Color titleBgColor;
  final Color descriptionBgColor;

  // final bool isExpand;


  CustomExpansionListTile({
    super.key,
    required this.title,
    required this.expandedChild,
    required this.titleBgColor,
    required this.descriptionBgColor,

  });

  @override
  _CustomExpansionListTileState createState() => _CustomExpansionListTileState();
}

class _CustomExpansionListTileState extends State<CustomExpansionListTile>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  bool _isExpanded = true;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    );
    _animationController.reverse();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
  void expanded() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _animationController.reverse();
      } else {
        _animationController.forward();
      }
    });
  }
  void _toggleExpansion() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (!_isExpanded) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context){
    return Column(
      children: <Widget>[
        Container(
          color: widget.titleBgColor,
          height: 40,// Set the title background color
          child: ListTile(

            title: Stack(children: [
              widget.title,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    children: [
                       !_isExpanded
                            ?  Icon(
                          Icons.keyboard_arrow_down,
                          size: 25,
                          color: Colors.white,
                        )
                            :  Icon(Icons.keyboard_arrow_right, size: 25,color: Colors.white,),

                    ],
                  ),
                ],
              )
            ]),
            //onTap:widget.isTap? _toggleExpansion:null,
            onTap:_toggleExpansion,
          ),
        ),
        Container(
          color:
          widget.descriptionBgColor, // Set the description background color
          child: SizeTransition(
            sizeFactor: _animation,
            child: widget.expandedChild,
          ),

        ),

      ],
    );
  }
}
