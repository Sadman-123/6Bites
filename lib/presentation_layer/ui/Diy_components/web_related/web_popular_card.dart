import 'package:flutter/material.dart';
Widget WebPopularCard(double mdw,double mdh,String picurl,String foodname,String restaurant,int price,double rating) {
  {
    return Container(
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      height: mdh * 0.367,
      width: mdw * 0.157,
      child: Column(
        children: [
          Expanded(child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)
                ),
                image: DecorationImage(
                    image: NetworkImage("$picurl")
                    , fit: BoxFit.cover
                )
            ),
          )),
          Expanded(flex: 1, child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)
                )
            ),
            width: double.infinity,
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("$foodname", style: TextStyle(color: Color(0xFF030a45),
                    fontSize: mdw * 0.0131,
                    fontWeight: FontWeight.w600),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,),
                Text("$restaurant", style: TextStyle(color: Color(0xFFafafae)),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("\$${price}", style: TextStyle(
                        color: Color(0xFF0e144c), fontSize: mdw * 0.0228,fontWeight: FontWeight.bold),),
                    Row(
                      children: [
                        Icon(Icons.star, color: Color(0xFF22a96b),size: mdw * 0.0131 ,),
                        Text("${rating}", style: TextStyle(color: Color(
                            0xFF22a96b), fontSize: mdw * 0.0131),)
                      ],
                    )
                  ],
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}