import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class CustomNavbar extends StatelessWidget{
  final double mdw;
  final double mdh;
  const CustomNavbar({super.key, required this.mdw, required this.mdh});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: mdh*0.1,
      color: Colors.white,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: mdh*0.079,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 1.5,
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: FaIcon(FontAwesomeIcons.house,color: Color(0xFF029c55)),
                    onPressed: (){},
                  ),
                  IconButton(
                    icon: FaIcon(FontAwesomeIcons.heart,color: Color(0xFF88a5bc)),
                    onPressed: () {
                    },
                  ),
                  SizedBox(width: mdw*0.125),
                  IconButton(
                    icon: FaIcon(FontAwesomeIcons.filePen,color: Color(0xFF88a5bc)),
                    onPressed: (){},
                  ),
                  IconButton(
                    icon: FaIcon(FontAwesomeIcons.bars,color: Color(0xFF88a5bc)),
                    onPressed:(){},
                  ),
                ],
              ),
            ),
          ),
          // Center floating button
          Positioned(
            bottom: mdh*0.03022,
            left: mdw / 2 - 30,
            child: FloatingActionButton(
              backgroundColor: Color(0xFF029c55),
              shape: CircleBorder(),
              elevation: 5,
              onPressed: () {
              },
              child: Icon(Icons.shopping_cart, size: mdh*0.0335,color: Color(0xFFffffff),),
            ),
          ),
        ],
      ),
    );
  }
}