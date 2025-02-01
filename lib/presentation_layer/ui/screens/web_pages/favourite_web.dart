import 'package:flutter/material.dart';
import 'package:sixbites/presentation_layer/ui/Diy_components/web_related/web_custom_button.dart';
class FavouriteWeb extends StatelessWidget{
  final double mdw;
  final double mdh;
  FavouriteWeb(this.mdw,this.mdh);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          children: [
            AppBar(title: Text("Favourite",style: TextStyle(fontSize: mdw*0.022),),),
            SizedBox(
              height: mdh*0.1,
            ),
            Container(
              child: Image.asset('assets/stickers/user.png',width: mdw*0.085,),
            ),
            SizedBox(
              height: mdh*0.03,
            ),
            Container(
              child: Text('Sorry!',style: TextStyle(color: Color(0xFF029c55),fontSize: mdw*0.034),),
            ),
            Container(
              child: Text("You are not logged in",style: TextStyle(color: Color(0xFF9b9b9d),fontSize: mdw*0.013),),
            ),
            SizedBox(
              height: mdh*0.065,
            ),
            WebCustomButton(mdw, mdh, "Login to Continue")
          ],
        ),
      ),
    );
  }
}