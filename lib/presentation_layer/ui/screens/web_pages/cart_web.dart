import 'package:flutter/material.dart';

import '../../Diy_components/web_related/web_custom_button.dart';
class CartWeb extends StatelessWidget{
  final double mdw;
  final double mdh;
  CartWeb(this.mdw, this.mdh);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            AppBar(title: Text("My Cart",style: TextStyle(fontSize: mdw*0.022),),),
            SizedBox(
              height: mdh*0.3,
            ),
            Container(
              child: Image.asset('assets/stickers/menu_card.png',width: mdw*0.085,),
            ),
            SizedBox(
              height: mdh*0.03,
            ),
            Container(
              child: Text("You haven't add to cart yet!",style: TextStyle(color: Color(0xFF9b9b9d),fontSize: mdw*0.013),),
            ),
          ],
        ),
      ),
    );
  }
}