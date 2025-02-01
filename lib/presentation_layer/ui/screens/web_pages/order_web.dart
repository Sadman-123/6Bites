import 'package:flutter/material.dart';
import 'package:sixbites/presentation_layer/ui/Diy_components/web_related/web_custom_button.dart';
class OrderWeb extends StatelessWidget{
  final double mdw;
  final double mdh;
  OrderWeb(this.mdw,this.mdh);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          AppBar(backgroundColor: Colors.white,title: Text("My Orders",style: TextStyle(fontSize: mdw*0.022),),),
          SizedBox(
            height: mdh*0.21,
          ),
          Text("Track your Orders",style: TextStyle(fontSize: mdw*0.03),),
          SizedBox(
            height: mdh*0.06,
          ),
          Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                Container(
                  width: mdw*0.25,
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Order ID",
                        prefixIcon: Icon(Icons.shopping_cart),
                        border: OutlineInputBorder()
                    ),
                  ),
                ),
                SizedBox(
                  height: mdh*0.025,
                ),
                Container(
                  width: mdw*0.25,
                  child: TextField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.phone),
                        hintText: "Phone Number",
                        border: OutlineInputBorder()
                    ),
                  ),
                ),
                SizedBox(
                  height: mdh*0.025,
                ),
                WebCustomButton(mdw, mdh, "Track Order")
              ],
            ),
          )

        ],
      ),
    );
  }
}