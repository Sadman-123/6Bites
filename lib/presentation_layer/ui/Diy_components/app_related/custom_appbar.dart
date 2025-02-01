import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class CustomAppbar extends StatelessWidget{
  final double mdw;
  CustomAppbar({required this.mdw});
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: false,
      backgroundColor: Colors.white,
      elevation: 0,
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              FaIcon(FontAwesomeIcons.solidBell, color: Color(0xFF000101), size: mdw * 0.057),
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  width: mdw * 0.025,
                  height: mdw * 0.025,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                      width: mdw*0.003,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
      title: Row(
        children: [
          Icon(Icons.home_filled,size: mdw*0.057,color: Color(0xFFcdcdcd),),
          SizedBox(width: mdw*0.011),
          Text("Mirpur,Dhaka,Bangladesh",style: TextStyle(fontSize: mdw*0.043,color: Color(0xFFcdcdcd)),)
        ],
      ),
    );
  }
}