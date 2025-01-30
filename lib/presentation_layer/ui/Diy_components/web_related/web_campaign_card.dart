import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
Widget WebCampaignCard(double mdw,double mdh,String picurl,String foodname,String restaurant,String price,String discount,String rating) {
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
      height: mdh * 0.235,
      width: mdw * 0.295,
      child: Row(
        children: [
          Expanded(child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10)
              ),
            ),
            child: Container(padding: EdgeInsets.all(10),decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(image: NetworkImage(picurl),fit: BoxFit.cover)
            )),
          )),
          Expanded(flex: 1, child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
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
                    fontWeight: FontWeight.w600), maxLines: 1, overflow: TextOverflow.ellipsis,),
                Text("$restaurant",
                  style: TextStyle(color: Color(0xFFafafae)),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,),
                Container(
                  child: RatingBarIndicator(
                    rating: double.parse(rating),
                    itemBuilder: (context, index) => Icon(
                      Icons.star,
                      color: Color(0xFF22a96b),
                    ),
                    itemCount: 5,
                    itemSize: 14.0,
                    direction: Axis.horizontal,
                  ),
                ),
                SizedBox(height: mdh*0.005,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text("\$${price}", style:TextStyle(
                            color: Color(0xFF0e144c), fontSize: mdw * 0.0228,fontWeight: FontWeight.bold),),
                        SizedBox(width: mdw*0.01,),
                        Visibility(
                          visible: int.parse(discount)>0,
                          child: Text("\$${int.parse(price)+int.parse(discount)}", style: TextStyle(
                              color: Color(0xFFafafae), fontSize: mdw * 0.0102,decoration: TextDecoration.lineThrough),),
                        ),
                      ],
                    ),
                    Icon(Icons.add, color: Color(0xFF0e144c),)
                  ],
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}